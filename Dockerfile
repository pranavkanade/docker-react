FROM node:alpine as builder

# specify workdir
WORKDIR /app
# copy the package.json
COPY ./package.json ./
#install dependencies
RUN npm install
# copy all the contents
COPY ./ ./

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html