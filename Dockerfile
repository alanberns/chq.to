# Usa la imagen oficial de Ruby
FROM ruby:3.2.2

# Establece el directorio de trabajo
WORKDIR /usr/src/app

# Instala Bundler
RUN gem install bundler

# Instala las dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    git \
    curl \
    nodejs \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copia el Gemfile y Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instala las dependencias de la aplicación
RUN bundle install

# Copia el resto de la aplicación
COPY . .

# Cambia los permisos del directorio de trabajo
RUN groupadd -g 1000 www && \
    useradd -u 1000 -ms /bin/bash -g www www && \
    chown -R www:www /usr/src/app && \
    chmod 755 /usr/src/app

# Cambia al usuario creado
USER www

# Expone el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["rails", "server", "-b", "0.0.0.0"]
