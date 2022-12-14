# course-project-group-_1-cs-222
course-project-group-_1-cs-222 created by GitHub Classroom

a)
Our project for CS 222: Software Design Lab is CommunityMap. 
This mobile application allows users to input the location of any potholes or road damages
they run into onto an online map for other users to see. 
The primary purpose of this application is to highlight the presence of potholes and road damage. 
These are generally overlooked by competing apps like Waze, which instead focus on traffic and construction work. 
The mapping of various potholes and road damage can also ensure that 
the local government of the area is aware of the conditions that their roads are in. 
By providing a centralized repository of potholes, we are ensuring that 
users can drive safely by being aware of all road conditions 
and local governments can be aware of the condition of their roads. 
This mobile application was built with Swift and uses the Google Firebase database for data management and storage.

b)
<h4> Sensor Inputs </h4>
Provides all the primary data for our application.
The primary data consists of live location, accelerometer data, and gyroscope data.
The libraries we used for this are CoreMotion, CoreLocation, and MapKit. 
Our sensor inputs interact with our backend algorithm processing by segwaying the data collected into the algorithm.

<h4> Backend Algorithm Processing </h4>
Takes the input provided by the sensor inputs and determines if we found a pothole in a boolean format. We don't essentially use libraries in the part of our project but use our logic for determination of potholes. Our backend algorithm interacts with our database storage and the user interface.

<h4> Database Storage </h4>
We use MySQL and Firebase to store the location and other primary data of a found pothole.

<h4> User Interface on iOS </h4>
We use libraries such as Swift Storyboards to make our user-interface simpler and more user-friendly. It interactively displays our backend's work such as putting a pin on a pothole live and also does the job of showcasing all the potholes in the chosen area.


c)
## Installing / Getting started

A quick introduction of the setup of the environment and code execution instructions.

* clone the project into your system.
* open "/course-project-group-_1-cs-222/community-map-release-1.0/community-map-release-1.0.xcodeproj/project.xcworkspace" on Xcode (version 14.1)
* to run on simulator:
  click 'Run' and make sure it runs on an emulator downloaded on your swift 
* to run on real device:
  * click 'Run' and make sure it runs on a connected device making sure Developer settigns are enabled on it.

d)
Varun took care of sensor API implementation.
Kushal implemented the primary algorithm to evaluate the potholes.
Varun and Kushal also took care of the user-interface of the application
and how all the features of the app connect and interact with each other.
Aayush was responsible for all implementations related to the Firebase database 
as well as parsing these large amounts of data for read and write functions 
such that it is easy to use in the algorithms sections. 
