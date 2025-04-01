# Etapa de construcción
FROM node:14 AS builder

WORKDIR /app

# Copia solo los archivos necesarios para instalar dependencias
COPY package*.json ./
COPY yarn.lock ./

# Instala dependencias de producción
RUN npm ci --only=production

# Copia el resto del código
COPY . .

# Construye la aplicación
RUN npm run build

# Etapa de producción
FROM node:14-slim

WORKDIR /app

# Copia solo los archivos necesarios desde la etapa de construcción
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/public ./public

# Limpia la caché de npm
RUN npm cache clean --force

# Expone el puerto
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]
