ARG BUILDPLATFORM=linux/amd64
ARG BUILDTAG=3.11-slim

FROM --platform=$BUILDPLATFORM python:$BUILDTAG as dependencies

RUN addgroup --system user && adduser --system user --ingroup user
USER user

WORKDIR /home/user/app

COPY --chown=user  . .

ENV PATH=$PATH:/home/user/.local/bin
# Install uv
ENV VIRTUAL_ENV=/usr/local
ADD --chmod=755 https://astral.sh/uv/install.sh /install.sh
RUN /install.sh && rm /install.sh
# Install Python dependencies
COPY requirements.txt /requirements.txt
RUN /root/.cargo/bin/uv pip install --no-cache -r dev.requirements.txt

FROM dependencies as test
CMD ["pytest"]

FROM dependencies as prod

COPY --chown=user:user --from=dependencies /home/user/app/requirements.txt requirements.txt

# TODO: Do we also need the distribution etc?
RUN /root/.cargo/bin/uv pip install --no-cache -r requirements.txt

ENTRYPOINT ["python", "-m", "mypackage"]
