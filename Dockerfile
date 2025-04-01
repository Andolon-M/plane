# Usa una imagen base oficial de Node.js
FROM node:14

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos del proyecto a la imagen
COPY . .

# Instala las dependencias del proyecto
RUN npm install

# Expone el puerto en el que la app estará corriendo
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]
