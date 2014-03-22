module.exports = (grunt) ->

  require('time-grunt')(grunt)
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    paths:
      images: "img"
      js: "js"
      coffee: "_js"
      css: "css"
      sass: "_sass"
      bootstrap: "bower_components/bootstrap-sass/vendor/assets"

    connect:
      server:
        options:
          hostname: '0.0.0.0'
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

    coffee:
      compile:
        files: '<%= paths.coffee %>/custom.js': '<%= paths.coffee %>/custom.coffee'

    uglify:
      options:
        mangle: false
      my_target:
        files: 'js/app.js': [
          '<%= paths.bootstrap %>/javascripts/bootstrap/transition.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/alert.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/modal.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/dropdown.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/scrollspy.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/tab.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/tooltip.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/popover.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/button.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/collapse.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/carousel.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/affix.js',
          '<%= paths.bootstrap %>/javascripts/bootstrap/.js',
          '<%= paths.coffee %>/custom.js'
        ]

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
        files: ['index.html', 'location/**', 'schedule/**', 'register/**', 'sponsors/**', '_layouts/**', '_includes/**', '_posts/**', '_drafts/**']
        tasks: ['shell:jekyllBuild']
        options:
          livereload: true
      css:
        files: ['<%= paths.sass %>/**/*.scss']
        tasks: ['sass', 'shell:jekyllBuild']
        options:
          livereload: true
      js:
        files: ['<%= paths.coffee %>/*.js', '<%= paths.coffee %>/*.coffee']
        tasks: ['coffee', 'uglify', 'shell:jekyllBuild']
        options:
          livereload: true

    grunt.registerTask 'default', ['sass', 'coffee', 'uglify', 'shell', 'connect', 'watch']
