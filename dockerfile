FROM denoland/deno:alpine

# These steps will be re-run upon each file change in your working directory:
COPY . .

# The port that your application listens to.
EXPOSE 3000

WORKDIR /app

# Prefer not to run as root.
USER deno

RUN deno install

# Compile the main app so that it doesn't need to be compiled each startup/entry.
RUN deno cache ./src/main.ts

CMD ["task", "start"]
