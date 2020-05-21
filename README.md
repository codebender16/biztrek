# BizTrek

BizTrek is a mentorship marketplace application that builds the bridge between entrepreneurs and business pioneers. In an overview, we are targeting two personas which are:

1. Business Pioneers (Mentors)
2. Aspiring Entrepreneurs (Students)

## Problem
---
" It could be an idea you had from many years ago, but was never executed. Many years after, you stumbled upon a product that feels familiar and you go, I thought about that idea "

More often than not, aspiring entrepreneurs always find themselves in that situation. There could be many reasons and circumstances that prevent the ideas they had from being executed.

I have discovered the most common reasons are:

1. Lack of resources
2. Lack of knowledge
3. Risk-associated costs

Not everyone is born with a wealth of resources ready to be utilised and not everyone knows where to look for resources. One big problem with starting a business venture is, we don't know where and how to access venture-related information or guidances. This goes hand-in-hand with lacking knowledge in business. Some people may have great ideas but they lack the skills set and knowledge to run a business. The lack of these two factors eventually leads to risk-associated costs. The more we don't know, the more uncertainty there is and hence, the less manageable a business will be. In order to reduce the risks involved in experimenting an idea that you have or , we created BizTrek to allow you to fail cheaply and quickly with experienced mentors guiding you through from the start to the end.

This is where BizTrek can helps bridge the gap. With many business pioneers who are passionate in helping others grow, BizTrek acts as a platform for the two sides to meet. Business pioneers would be able to share their strategies and experiences in a familiar industry through developing educational courses on our platform. Business pioneers would be referred as mentor and aspiring entrepreneurs would be referred as students or mentees.

## Links
---

[Heroku](https://biztrek.herokuapp.com/)
[GitHub](https://github.com/codebender16/biztrek)

## Running the app
---

In order to run the app successfully, you will need to run the following after cloning the project from github.

    yarn install 

Then, set up a stripe account (link provided in third-party integration section) if you don't have one already. 

Obtain the **publishable keys** and **secret keys**

screenshot 


Then, run on rails terminal

    EDITOR="code --wait" rails credentials:edit

Add your keys into the credential file and voila!

    stripe:
    secret_key: { your secret key }
    public_key: { your public key }

## Purpose
---
- to encourage more people to get into business
- to help people explore their business ideas
- to help give a taste of how running business is like
- to reduce risks involved when starting a business
- to help people build business acumen
- to make running business more accessible to people

## Functionality and Features
---
**Current features**

1. Sign Up / Log In (Including role selection)
2. Buy/Sell Courses
3. Upload Images for each course (mentors only) - using Amazon s3
4. Manage Courses (mentors and admin only)
5. Browse Courses 
6. Cart functionality
7. Payment (through Stripe)
8. Webhooks to track successful payments

**Future features**

1. Messaging
2. Booking system for 1 - 1 consultation (integration with third-party calendars)
3. Profiles
4. Ratings
5. Testimonials
6. Category filter (dropdown)
7. Search filter

**Site Map**

[]()

**Tech Stack**

- Ruby on Rails (ruby, html, css)
- Bootstrap
- Jquery
- JavaScript
- Stripe
- Notion
- Heroku

## User Stories
---

**Admin**

1. manage everything on the app

**Mentor**

1. As a mentor, I want to sign up with BizTrek to share my experiences.
2. As a mentor, I want to log into my account so that I can fill in my details in my profile.
3. As a mentor, I want to nominate a payment account so that funds can be transferred into my account. 
4. As a mentor, I want to create a course on BizTrek so that venturers can view, get in touch or purchase my course. 
5. As a mentor, I want to save as draft  for revision  before I publish my program.
6. As a mentor, I want to update details in the course or delete the whole program if anything changes. 
7. As a mentor, I want these fields in the program: title, description, learning outcome and price so that it is more transparent and I can filter out potential questions before the users decide to get in touch.
8. As a mentor, I would like to automate payments if users want to purchase my course so that I can spend more time preparing the materials for potential users.

**Mentees/Students**

1. As a venturer, I want to be able to view all the courses without having to sign in.
2. I want to sign up for BizTrek so that I can buy courses.
3. I want to browse specific course so I can read all the details before I consider making a purchase
4. I want to get in touch with the mentor to gather more information before i make a purchase
5. I want to set up a payment method so I can pay for the course I want to take 
6. I want to add to cart so i can edit or delete the item from cart before I finalise my decision

## Wireframe
---

## BizTrek Heroku 
---

## ERD
---

## High-level components in BizTrek
---
In this project, I used Rails to develop BizTrek. 

**Rails** 

Ruby on Rails was designed to provide simplicity and productivity with the concept of DRY (Don't Repeat Yourself). Rails uses a MVC framework to help development run more efficiently. Below are some of the components that are used in BizTrek.

**Active Record**

In BizTrek, I utilised Active Record (which is the Model part of MVC framework) to connect the objects in BizTrek with the tables in Postgresql. Active Record uses a technique called Object Relational Mapping (ORM) to store and retrieve data from the database (Postgresql) without using SQL statements directly. For example, the data in User model can be retrieved by using SQL statements as rails methods such as User.create(attributes), will create a new user (object) and store it inside the mapped table (users) in Postgresql. Whenever we would like to retrieve the data stored in an object, we can run methods such as User.find(id) and that would return the matching-id object from the users table. Note that only models and tables with some sort of relationship would be able to utilise these rails sql methods. 

Other functionality based on the ORM framework are establishing associations between models, validations such as ones set up in the User and Course models and the representations of hierarchy inheritances through related models. 

**Active Storage**

Since BizTrek allows user to upload images, the app needs a place where it can store these images and be retrieved upon calls. Active Storage is a facility provided by rails for file uploads purposes. It operates similarly to other cloud storage services such as Amazon and BackBlaze. Two tables are used for storing files in the database, one is active_storage_blobs and the other is active_storage_attachments (a polymorphic joined tables that stores model class name). As an example, in the create course form, there is an image upload functionality for mentors to upload course image. When the course is created, the image related to the course will be saved inside the local disk (has to set storage services to local in development / production). When the app runs on the homepage (where all the courses will be shown), it will make query requests to the tables generated by Active Storage in order retrieve the image for each course on the homepage. 

However, I am using Amazon s3 in BizTrek, hence, the production environment active storage is set to amazon. 

The last thing to note is that active storage though provided rails, it is not turned on by default. If we want to use active storage or anything other cloud storage services, we have to set it up by following the steps on edgeguides.


**Action View**

Action View handles the output of a request made from the controllers (handled by Action Controller). Normally, Action Controller is responsible for directing requests to the right component such as communicating with the database or performing CRUD operations. Henceforth, Action View's duty would be to collate the response it has received and render a template with accurate data post-request. To demonstrate, when a destroy request is made to course_y, the controller would communicate with the database through the Course model and asks the courses table to delete course_y. Once that is updated, the view of courses will now render the most updated data from courses table (which is without course_y). 

## Third-party services
---
BizTrek uses Stripe for payments and Amazon s3 for file storage.

1. Stripe
BizTrek uses Stripe to process payments made by mentees/students. The main reason we use Stripe is because it has very well-documented API to follow and it also allows customisation on the form (in stripe.js) if such need arises. Most things come in default with Stripe such as the default form with already sleek UI and form validations. It integrates well with most apps in countries where stripe is accepted as an payment option. 

The other reason for using Stripe is for its' security. Stripe has been audited by PCI-compliance auditor and holds a valid certification of [PCI Service Provider Level 1](https://www.visa.com/splisting/searchGrsp.do?companyNameCriteria=stripe). Stripe enforces usage of TSL(SSL) for all the services that want to integrates with Stripe, such as Stripe.js is only served over TLS and it verifies each connection with TLS. This provides an extra layer of security when it comes to sensitive information in the students credit cards. Stripe provides other forms of security such as AES-256 and PGP for data encryption.

**How is Stripe used in the app?**

Once Stripe is installed and set up in the gemfile, gemfile.lock and stripe.js, a payments controller is set up for route directing whenever a student proceeds to checkout. A cart feature is in place for students to accumulate items in their cart before deciding to move forward with their purchases. Payments Controller is set up with 3 methods which are success, webhook and get_stripe_id. In routes file, two routes, one to payments controller and one to success page are set up to direct the students to the correct pages (based on the session event). 

A webhook is then implemented to track real-time payments so that BizTrek will receive accurate data from Stripe regarding the payment status. Through webhook, BizTrek will be able to update the database with the correct information.

To test stripe, you will need to use the keys from your test account. If you dont have one, please register at [Stripe](https://dashboard.stripe.com/register).

**The process**
           
Student checkouts from cart (activates payment/session route) --> strip checkout form (if payment made, webhook is initialised and respond to BizTrek app with code 200) --> success page and update database


1. Amazon s3

Amazon s3 is a cloud storage platform in the form of objects in resources known as buckets (biztrek-app is the bucket for BizTrek). The storage enables us to store and retrieve data from BizTrek webapp. It is flexible and simple to use, which allow easy integrations with other applications. Similar to Stripe, s3 supports the transfer of data on SSL and uses automated encryptions when uploads are completed. s3 covers a wide geographical regions and has a robust infrastructure for storing information. 

**How is s3 used in the app?**

BizTrek only uses s3 for image storage at its' current stage, where production config.active_storage.service is set to amazon. However, in development, in order to test the functionality of the app, the config.active_storage.service is set to local. In production, when a mentor upload an image, the image will automatically send a put request to the biztrek-app bucket for storage. When the homepage is loaded, Biztrek will communicate with s3 to get the stored image from s3 to be rendered on the homepage through the courses index template. 


## Schema and Database Relations
---
Insert ERD here

In the ERD, the following tables were set up but only those which are utilised currently on the MVP will be mentioned:

1. users
2. courses
3. carts
4. carts_courses (joint between carts and courses)
5. orders (joint between courses and users)

The relationships between the tables:

1. **users**
   - one-to-many **courses** (a mentor can own many courses)
   - many-to-many **orders** (this is to allow students to make multiple purchases and track their purchases through the orders table)
   - one-to-one with **mentor** (because one user can only have one mentor profile if user signed up as a mentor)
   - one-to-one with **cart** (to store added courses for students)

2. **courses**
    - many-to-many with **orders**  (course can be purchased by many students)
    - many-to-many with **carts_courses** (course can be added to cart by many students)
    - many-to-one with **users** (many courses belong to the mentor who created them)

3. **carts**
    - one-to-one with **users** (in my approach, I am emptying the cart rather than recreating a new one, hence, one user can only have one cart)
    - many-to-many with **carts_courses** (this joint table allow students to view all the courses a student has in their cart)

4. **carts_courses**
    - this is a joint table between courses and carts
    - one-to-many with **carts** and **courses**
    - this table is allows carts and courses to retrieve data from each other

5. **orders**
    - this is a joint table between courses and users 
    - one-to-many with **courses** and **users**
    - this table is used to keep track of the orders (courses) made by students after they purchased them

Please see the below for a detailed ERD code I used to generate the database relations.

**Project Biztrek ERD Codef**

Table users {
  id int [pk]
  first_name string
  last_name string
  email string
  password string
  is_admin boolean
  is_mentor boolean
  is_student boolean
  created_at datetime
}

Table courses {
  id int [pk]
  title string
  sub_title string
  price int
  description text
  created_at datetime
  user_id int [ref: > users.id]
}

Table messages {
  id int [pk]
  mentor_id int
  message text
  created_at datetime
}

Table mentors {
  id int [pk]
  description text
  expertise string
  business string
  industry string
  created_at datetime
  user_id int [ref: - users.id]
}

Table carts {
  id int [pk]
  user_id int [ref: - users.id]
  
}


Table carts_courses {
  id int [pk]
  course_id int [ref: > courses.id]
  cart_id int [ref: > carts.id]
}

Table categories {
  id int [pk]
  name string
}

Table courses_categories {
  id int [pk]
  course_id int [ref: > courses.id]
  category_id int [ref: > categories.id]
}

Table wishlists {
  id int [pk]
  user_id int
  quantity int
}

Table testimonials {
  id int [pk]
  user_id int [ref: > users.id]
  course_id int [ref: > courses.id]
  description text
}

Table orders {
  id int [pk]
  user_id int [ref: > users.id]
  course_id int [ref: > courses.id]
}

Table testimonials_ratings_card {
  testimonial_id int
  rating_id int
}

Table ratings {
  id int [pk]
  user_id int
  rating float
}


## Models Associations
---
The models in BizTrek are set up to reflect the ERD and database relations using rails helper methods such as has_one, has_many and etc.


User snippet 

User model is tied to Course, Order, Mentor, Cart models. 

As you can see from the snippet above, I utilised helper methods to establish the associations between the models with the tables in the database. 

In order to implement a one-to-one relationship in the User model, I declared has_one :mentor and has_one :cart in the User model. The helper method establish the logic that any given user can only relate to one mentor and one cart in their respective tables. 

For a one-to-many relationship with courses, I used a has_many :courses method to reflect the relation. With this method in place, any given user can have many courses (unless restriction is imposed). The restriction can be specified in the model or in the controller/views to prevent users from taking an action that will invoke that particular has_many relation. For example, in the controller and view, I have specified that only users who have admin and mentors as true can add courses and not students. This is not to say students can't have many courses, logically, students have many courses they purchased but that is be tracked in a joint table called orders. However, different roles and different actions should have a separate table to track those actions to ensure separation of concerns is met. For instance, purchases and creation of courses are two very different actions that go through their own paths that might or might not alter the database. To keep things simple, it is imperative to have another table to track the purchases of students after they have made the checkout successfully.

Please look at the code in other models. Most of them use the same helper methods for ORM. 

## Project Management and Timeline
---
In this project, I used Notion kanban board to track my workflow. 

The board were formatted into 5 columns:

- No Status
- Next Up
- On Hold
- In Progress
- Completed

The following properties were used to track and allocate the tasks appropriately:

1. Priority 
   
    - High
    - Medium
    - Low
  
2. Due Date 

3. Type
   
    - Feature
    - Bug
    - Doc

4. Area (area of concern)
   
    - Controller
    - View
    - Model
    - Third-party Integration
    - Routes

**Overview**

**Day 1 - 2** 

1. Defined idea with wireframe and sitemap
2. Completed ERD and had it signed off
3. Wrote description part of README
4. Set up database tables and their relations
5. Set up rspec-rails
6. Routes
7. Deployed to Heroku

**Day 3 - 5**

1. Focussed on testing (model relationships, validations and sign up) using capybara and rspec 
2. Set up associations between models 
3. Worked on seed file
4. Set up and tested third-party integrations - Stripe and s3 
5. Completed CRUD for courses
6. Set up and tested webhook using ultra stripe 3000
7. Routes for courses
8. Created templates in courses views for rendering
9. Set up devise authentication and cancancan authorisation
10. Fixed Heroku deployment issue
 
**Day 6 - 8**

1. Created cart feature
2. Changed stripe checkout from individual course checkout to cart checkout
3. Created CRUD for cart 
4. Modified and tested devise authentication and cancancan authorisation
5. Created flash messages for actions in controllers 
6. Fixed admin account issue

**Day 9**

1. README
2. Slide Deck
3. Other documentations



--- THE END ---