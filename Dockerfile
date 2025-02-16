FROM node:12 
#this is a base image that we will start building on... this is officially supported

WORKDIR /app 
#this is the main directory of your app... any subsequent instructions in our dockerfile will start from this directory

COPY package*.json ./ 
#this copies all the dependencies found in the package files to the current directory of the dockerfile

RUN npm install 
#this installs the copied dependencies
 
COPY . . 
#this copies all the code in the project to this directory
### We don't want to include the node modules folder in this copy because it will override the node modules we installed there, so we will put the node modules folder in the dockerignore file... just like gitignore  

ENV PORT=8080 
#environment variable 

EXPOSE 8080

CMD [ "npm", "start" ] 
#there can only be one of these per docker file... it tells the container how to run the actual app
