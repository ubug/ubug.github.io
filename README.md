Official UBUG Conference Website
================================

The official website of the annual UBUG Conference.

> UBUG = Utah Banner User Group


## Editing Guide

Every year, the UBUG conference needs a place to host the conference registration,
schedule, and general information about the conference. We built this website
in an effort to stop re-inventing the wheel every year.

We designed this website to be simple to maintain and easy to hand off to the
next host of the UBUG conference. Out of all the files and folders you see here,
there are really only a few files that you need to modify.

Here are the files you need to worry about:

```
├── _config.yml
├── _includes
|   ├── site_header.html
├── accommodations
|   ├── index.md
├── location
|   ├── index.md
├── register
|   ├── index.html
├── schedule
|   └── index.md
├── sponsors
|   └── index.md
└── index.html
```

**An overview of what each of these files does:**

`_config.yml` This is the most important file. It contains information unique to
the host of the conference. This is where you change the year of the conference,
the city it's in, the event dates, the registration form link, and more.

`_includes/site_header.html` Controls the main banner across the top of the site.
The details are all configured in `_config.yml`.

`accommodations/index.md` A page to list information about accommodations.
This page is a simple Markdown file.

`location/index.md` A page to list information specific to the conference venu such
as parking, building/room info, etc.

`schedule/index.md` The conference schedule. This is a simple Markdown file.

`sponsors/index.md` A page to list details about our sponsors. It is a simple Markdown file.

`index.html` The home page. Many details are pulled from `_config.yml`. You may
need to update the sponsors listed on this page.
