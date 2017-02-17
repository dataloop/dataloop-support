# Dataloop Support and Knowledge base articles

This repository contains support and knowledge base articles that are written in Markdown.

mkdocs is used to render them into a static site that can them be served from GitHub/s3/Fastly etc.

## Quick start

Editing a document can be done straight from the rendered site. This will link you to GitHub where you can make changes in their UI and submit a Pull Request back to the parent repository.

You can also checkout the git repository, make local changes and submit them back with a Pull Request.


**WARNING** 
Commits submitted to the `master` branch of this repository will be built and may be published to production immediately.


## Documentation Layout

All raw markdown files can be found in the `/docs` directory.

There is a top level `index.md` file that is the site front page. This requires manual updating for new categories and attempting to keep end-users aware of the `new pages` or `latest updated` sections. One drawback on generating the content in this manner.

Pages have been split according to categories. Creating a new directory will create a new category.

Each category has an `index.md` home page with links to all articles. This one is manually updated and used to link into the category from the home page.

The `/img` directory is for all images and is currently flat.  
You can reference an image inline from any article with:
```
![image text](/img/<image.png>)
```

## Local Site Building

If you are writing extensive and exciting documentation, you may wish to run the site locally to make sure your markdown is top-notch and it all renders nicely.

Use the `requirements.txt` file to install the relevant pips, be that in a virtualenv or not is up to your desire. Production is being built and deployed with Python v3.6.0.

You can then use:
```
mkdocs serve
```

to build and locally serve the site. You will be given the local url to try. This will also watch as you make changes and render them on the fly.



## TODO

There may be better ways to generate the left menu of articles in categories that isn't based on the document file name.





## Links

* [Github Source]()
* [Markdown Syntax Reference]()
* [Mkdocs Documentation]()
* [Material Theme Documentation]()
