# README

ToDo Ruby on Rails JSON API 

Ruby version: 2.6.3

Database: PostgreSQL

API endpoints:

    GET     /           Welcome page
    GET     /todo       Lists of current user's todos
    POST    /todo       Creates new todo for current user
    GET     /todo/:id   Gets todo with :id if exists for current user 
    PUT     /todo/:id   Updates todo with :id if exists for current user
    DELETE  /todo/:id   Deletes todo witg :id if exists for current user
    GET     /user       Get current user
    POST    /user       Creates new user and returns his access token
    PUT     /user       Updates current user
    DELETE  /user       Deletes current user
    
For API requesting use for example: curl -H "authorization: <access_token>" <server_url>
      
