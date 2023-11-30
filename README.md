# PoC-chat
PoC-chat is a proof of concept about the the ability to communicate with customer service via online chat.

## Technologies
- NodeJS v16+
- Angular CLI v16+
- Java 17+
- SpringBoot v3.0.4
- MySQL v8.0
- Maven (installed on your system or available with your IDE)

## Authors
Our code squad: Sabrina student from OpenClassrooms.

## Contribute to the project
This application is available on my github, it must be clone with command line 
"git clone https://github.com/Sab-Ben/Poc-chat.git".
When the project is cloned, use file script.sql available via 
Poc-chat/chat-websocket-backend/src/main/resources/script.sql


To install MySQL :

If you have Docker, create an image with the following command line "docker pull mysql" to get the latest one.
The MySQL image requires that you supply a root password. You cannot set this in the Docker Desktop GUI and must do so through the command line (PowerShell or cmd):
docker run --name my-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mypassword -d mysql. A terminal window should appear. First run mysql -u root -p and enter your specified root password when prompted.
Once you reach the MySQL prompt,then retrieve the information from the script.sql 
file and copy and paste it into the terminal window.

Otherwise with MySQL Workbench : Import the sql script from 
Developpez-une-application-full-stack-complete/src/main/resources/script.sql 
and execute it, this will create the tables
From MySQL terminal: Use the command SOURCE </absolute/path/to/script>

## Build
### For BackEnd App :
With IntelliJ IDE, open the file pom.xml as a project inside the folder chat-websocket-backend, click at top right on the IDE on 
Maven -> Poc-chat -> Lifecycle -> clean and after build -> install.
With Eclipse IDE, import your project with Maven and choose existing maven project to find the file pom.xml,
then right-click on the project and choose update the project, right-click agin and choose maven clean and after build maven install.

### For FrontEnd App :
Use command  `cd chat-websocket-frontend`, then use commande line `npm install` to install nodes_modules.

## Development server
### For Backend App :
Run the project at ChatWebsocketBackendApplication (where annotation @SpringBootApplication appears).

### For FrontEnd App :
Run `ng serve` for a dev server inside folder chat-websocket-front. Navigate to `http://localhost:4200/`.
Open two windows, one as a client and one as a support, to set up the exchange. 

## Licensing
This project was created by OpenClassrooms for the training course "Développeur Fullstack Java-Angular".
