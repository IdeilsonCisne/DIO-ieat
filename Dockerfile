## versão do Ruby linux alpine(enxuto)
FROM ruby:2.7.2-alpine 

## Variáveis de ambiente chave e valor
ENV TZ American/Sao_Paulo
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV RAILS_ENV development
ENV NODE_ENV development
ENV RAILS_LOG_TO_STDOUT true

#caminho do projeto
WORKDIR /ieat

# Set porta do servirdor
EXPOSE 3000

## Copiar tudo do direitório atual para o /ieat/
COPY . /ieat/

## Rodar comando
RUN gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
RUN apk update && apk add --no-cache build-base postgresql-dev tzdata nodejs yarn git
RUN yarn install --check-files
RUN bundle install

## Executar comando script
CMD ["./scripts/server.sh"]
