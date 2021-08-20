# CandidateQuestionPaperObjections

Question Paper Objection tracking tool post examination activity.

Candidate can raise objections for any number of questions for a question paper or examination the candidate has given.

	- Tech Stack
		- Java 8
		- Maven
		- Spring Boot 2.4.5
		- MySQL
		- Angular
	- Functionalities
		- User Login.
		- User JWToken for authenticating requests onto backend.
		- Post login via user can see the subject list and exam date & time of the subject and also exam submitted status
		- User can view his question paper. (To be Implemented)
		- User can raise objections for a question number in his question paper.
		- User first saves the objections and later a submit button appears.
		- User can add or delete objections even after saving them.
		- Once submitted user will be unable to add or delete an objection.
		- User logout.


## Sping Security Configuration
	- Use the Client ID & Client Secret in the application.properties file to configure.
	- Created a service.
	- CandidateQPObjections
		- User registration & login. Runs on 8080 port.
		- User profiles are stored in the database.
		- Generates a key/token while login & for authenticating incoming requests.
		- Token is expired after 90 mins.
	- Libraries Added:
		- Spring Security, JPA, Mail, Validation
			- To give registration, login, logout & Json web token functionality.
			- To perform database operations.
			- To validate entity fields.
			- MySQL driver to connect to the DB.
			- 
		- jsonwebtoken
			- To create json web tokens.
		- lombok.jar 
			= To the dependencies to create getters, setters, constructors at compile time.
		- springfox
			- To create API documentation with Swagger 2.
			- Link to access the api-docs http://localhost:8080/reddit-service/swagger-ui.html
