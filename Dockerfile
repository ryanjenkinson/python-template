ARG BUILDPLATFORM=linux/amd64
ARG BUILDTAG=3.11-slim

FROM --platform=$BUILDPLATFORM python:$BUILDTAG as dependencies
# Note: can also pin to a specific uv version here instead of latest
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Copy the project into the image
ADD . /app
WORKDIR /app

# Sync the project into a new environment
RUN uv sync

RUN addgroup --system user && adduser --system user --ingroup user
USER user

# Copy the project into the image
ADD . /app
WORKDIR /app

ENV PATH=$PATH:/home/user/.local/bin

# Sync the project into a new environment
RUN uv sync

FROM dependencies as test
CMD ["uv", "run", "pytest"]

FROM dependencies as prod

ENTRYPOINT ["uv", "run", "mypackage:app"]
