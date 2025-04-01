FROM node:18-slim

WORKDIR /app

# Copia los archivos necesarios para instalar dependencias
COPY package*.json yarn.lock ./

# Instala solo las dependencias necesarias para producción
RUN yarn install --production --network-timeout 1000000

# Copia el resto del código
COPY . .

# Expone el puerto
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["yarn", "start"]
