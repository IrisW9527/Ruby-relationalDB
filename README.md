# README

This is a Ruby on Rails web application implementing a relational database and demonstrating model relationships. 
JSON data available through API endpoints.


Website link: https://prophase2.herokuapp.com/users/sign_in

Test user:
- Email: doj@gmail.com
- Password: 123123

For http GET requests:
The JSON formats are also accessible through the following API endpoints:
- get all photos: https://prophase2.herokuapp.com/api/photos
- get one photo by its photo id: https://prophase2.herokuapp.com/api/photos/2
- get photo's info by passing its 'title': https://prophase2.herokuapp.com/api/photos/search?title=image1
- get a user's info by passing its user id: https://prophase2.herokuapp.com/api/users/1

For POST requests:
- User authentication can be logged in through urls and an authentication token ("autotoken") will be returned in JSON. The token can be used to retrieve user's personal information.
- can be tested with localhost in Postman.


1. The application has Users/Photos/Profile/Comments/Groups 5 models with their associated controllers & views
2. The application has 1 nested resource(Photos & Comments)
3. The models’ relationships used the following model relationships:
  - one-to-one (User-Profile)
  - one-to-many (Users-Photos, Photo-Comments)
  - rich one-to-many (Users-Groups)
4. The application has a user model with authentication & authorization
5. The application uses sessions to identify logged in users
6. The application illustrates proper use of DRY using partials
