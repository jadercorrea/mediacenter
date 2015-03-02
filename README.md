## Media Center

This is a project for local use. It servers all your video files on the app, grouped by directory. Here is a preview of how it looks when used:


![alt tag](https://github.com/jadercorrea/mediacenter/blob/master/app_preview.png)

#### Steps necessary to get the application up and running:

It was tested on Mac OS and Ubuntu. Any video player set on your system will run with your default player.

###### Configuration
`Ruby 2.1.5p273` and `Rails 4.2.0` are the basic dependencies. Use `rbenv` or `rvm` to manage this and `bundle` for gems. 
Create a `Videos` directory under your `$HOME` path, copy your videos to this and have fun!

Database creation - There's no need for a database on this app. Database configurations file is on the repo just to avoyd rails breaking on bundle.
