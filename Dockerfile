FROM node:alpine AS build
WORKDIR /app
COPY package*.json /app
RUN npm install
COPY . /app
RUN npm run build --prod

# Stage 2: Serve app with nginx server
FROM nginx:alpine
COPY --from=build /app/dist/sample-angular-app /usr/share/nginx/html
# Expose port 80
EXPOSE 80
