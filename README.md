Official UBUG Conference Website
================================

The official website of the annual UBUG Conference.

> UBUG = Utah Banner User Group


### About updating this website

This section is for people who are just interested in updating the content of
this website. If you classify yourself as a **Front End Developer** then skip
to the Developers section below.

**To edit this website content**

1. Clone this repository.
2. Change the html page.
3. Commit and push.

Big assumptions were made here. We assume you have permission to commit to this
repository. If not, you can fork this repo, make your changes, and submit a pull
request.

### Developers

So you want to change the look and feel of this website. Great. It is a static
website built with Jekyll and it utilizes SASS, Grunt, and Bower.

TODO: add instructions for developers.


##### Initial setup

1. Clone this repo
2. Install bower dependencies  
```
cd ubug
bower install
```
3. Install npm dependencies  
```
npm install
```

### Developing

Simply running `grunt` will compile the SASS, do a Jekyll build, run a
server locally on port 4000, and watch for any files that change while you
develop and automatically rebuild the SASS and rebuild with Jekyll.

In other words, after you start `grunt`, you just go do your thing and everything
will rebuild automatically, you just make changes to files and go to your
browser and refresh the page.

```
grunt
```
