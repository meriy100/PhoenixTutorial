FROM elixir:latest
ENV NODE_VERSION 8.x
ENV NPM_VERSION 6.1.0
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash \
  && apt-get install -y nodejs && apt-get install -y inotify-tools
RUN npm install npm@${NPM_VERSION} -g
RUN mix local.hex --force && \
  mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez && \
  mix local.rebar --force
WORKDIR /app