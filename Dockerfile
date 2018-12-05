FROM node:alpine as builder
#install dependencies and build app
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY  . .
RUN npm run build 

# /app/builder is the folder that has all production
# artificat 
# previous block is complete 


FROM nginx
EXPOSE 80
#copy something from the builder phase
COPY --from=builder /app/build /usr/share/nginx/html 


