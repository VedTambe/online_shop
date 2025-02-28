#getting image from dockerhub

FROM node:18

#making a working directory for putting dir

WORKDIR /app

#copy the code from HOST to Cotanier


copy . .

#install pkages

RUN npm install

#expose port

EXPOSE 5173

#run the application


CMD ["npm", "run", "dev"]


