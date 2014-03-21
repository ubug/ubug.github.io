module.exports = (grunt) ->

  require('time-grunt')(grunt)
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    paths:
      images: "img"
      js: "js"
      css: "css"
      sass: "_sass"

    connect:
      server:
        options:
          port: 4000
          base: '_site'

    imagemin:
      dist:
        options:
          optimizationLevel: 7
        files: [
          expand: true
          src: ['<%= paths.images %>/**/*']
        ]

    recess:
      options:
        compile: false
        noIDs: false
        noJSPrefix: false
        noUniversalSelectors: false
      files:
          src: ['<%= paths.css %>/app.css']

    sass:
      options:
        style: "compressed",
        includePaths: ['bower_components/bootstrap-sass/vendor/assets/stylesheets/bootstrap']
      dist:
        files:
          '<%= paths.css %>/app.css' : '<%= paths.sass %>/app.scss'

    shell:
      jekyllBuild:
        command: 'jekyll build --drafts',
        stdout: true

    watch:
      jekyll:
        files: ['index.html', 'about/**', '_layouts/**', '_includes/**', '_posts/**', '_drafts/**']
        tasks: ['shell:jekyllBuild']
        options:
          livereload: true
      css:
        files: ['<%= paths.sass %>/**/*.scss']
        tasks: ['sass', 'shell:jekyllBuild']
        options:
          livereload: true
      js:
        files: ['<%= paths.js %>/*.js']
        tasks: ['js', 'shell:jekyllBuild']
        options:
          livereload: true

    grunt.registerTask 'default', ['sass', 'shell', 'connect', 'watch']
