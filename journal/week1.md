# Week 1 — App Containerization

## Required Homework/Tasks

### Create Docker containers for backend and frontend services

#### Create docker container for  for backend-flask
- Create Dockerfile for backend-flask
[backend-flask Dockerfile]((../backend-flask/Dockerfile))

- Build Docker image for backend-flask
![Backend Docker Output](assets/week1/backend-flask-docker-run.png)

- Run Docker container for backend-flask
![Backend Output](assets/week1/backend-flask-output.png)

#### Create docker container for  for frontend-react-js
- Create Dockerfile for frontend-react-js
[backend-flask Dockerfile]((../frontend-react-js/Dockerfile))

- Build Docker image for frontend-react-js
![Frontend Docker Output](assets/week1/frontend-docker-run.png)

- Run Docker container for frontend-react-js
![Frontend Output](assets/week1/frontend-output.png)

### Create docker-compose to run backend and frontend simultaneously
- Create `docker-compose.yml` for both services together
[docker-compose.yml]((../docker-compose.yml))

- Run docker-compose-up to run spin up both the containers
[Backend and Frontend endpoints](assets/week1/docker-compose-up.png)
[Website with mock data](assets/week1/docker-compose-output.png)

### Create Notification feature 
- Implemented a backend flask API endpoint to return notification activities for a particular user
![Notification API output](assets/week1/notification-api.png)

- Integrated backend API to fetch notifications and display it on the frontend web app
![Notifications on React](assets/week1/notification-frontend.png)

- Documented the Notification API on openAPI spec

## Additional Homework/Tasks