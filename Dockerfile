FROM --platform=$BUILDPLATFORM rust:latest as builder
COPY . .
RUN cargo install --path .

FROM debian:bookworm-slim
# RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/ecosystem /usr/bin/ecosystem
ENV USER root
ENTRYPOINT ["/usr/bin/ecosystem"]
