# FROM node:lts-alpine
# ENV NODE_ENV=production
# WORKDIR /usr/src/app
# COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
# RUN npm install --production --silent && mv node_modules ../
# COPY . .
# EXPOSE 3000
# RUN chown -R node /usr/src/app
# USER node
# CMD ["npm", "start"]



# use the official Node.JS image as the base image
FROM node:14

# create the working directory
WORKDIR /liu_yulin_site

# copy project files into the working directory of the container
COPY . .

# install project dependencies
RUN npm install

# build the react application
RUN npm run build

# install http=server for serving static files
RUN npm install -g http-server

# expose 7775 port
EXPOSE 7775

# use http-server to serve the built static files
CMD ["http-server", "build", "-p", "7775"]
