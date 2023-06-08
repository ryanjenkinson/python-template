ARG BUILDPLATFORM=linux/amd64
ARG BUILDTAG=3.11-slim

FROM --platform=$BUILDPLATFORM python:$BUILDTAG as dependencies

RUN addgroup --system user && adduser --system user --ingroup user
USER user

WORKDIR /home/user/app

COPY --chown=user  . .

ENV PATH=$PATH:/home/user/.local/bin

RUN pip install --no-cache poetry poethepoet
RUN poetry config --no-cache
RUN poetry install --no-root

RUN poetry install
RUN poetry build --format=wheel
RUN poetry export --only main -f requirements.txt --without-hashes --output requirements.txt

FROM dependencies as test
RUN poe lint
CMD ["poe", "-q", "test"]

FROM dependencies as prod

COPY --chown=user:user --from=dependencies /home/user/app/requirements.txt requirements.txt
COPY --chown=user:user --from=dependencies /home/user/app/dist dist

RUN pip install --no-cache -r requirements.txt dist/*.whl --user

ENTRYPOINT ["poe", "run"]
