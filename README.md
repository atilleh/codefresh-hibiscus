# Hibiscus

An alternative web interface for Codefresh, made with Sinatra and Bootstrap

```
warning ! This project is really in work in progress.
```

![](https://i.imgur.com/Yv1ubUS.png)

![](https://i.imgur.com/kDeJDwx.png)
## Why ?

Codefresh is a dope product, but too many things are loaded on the official front. I work on this lightweight alternative to save some memory and CPU when I have to work 8 hours per day on Codefresh.

## How ?

In a [The Old Net](https://theoldnet.com/) fashion, I thought about this project with :

- server-side rendering
- low dependencies level
- high performance web server
- API sourced

All the information are loaded throughout the (awesome) Codefresh API.

### Implemented functions

- Projects (GET)
- Pipelines (GET)
- Pipeline information (GET)
- Build tasks (GET)

### Todo

- Projects (POST, PUT)
- Pipelines (POST, PUT)
- Pipeline information (POST)
- Build tasks (POST, DELETE)
- Auto-refresh (meta-refesh!)
- Steps progress on builds
- Little bit less ugly theme
---

## Installation

1. Clone the repository
2. Create a Codefresh personal API key
3. Install Ruby (`2.6+`) and Bundler (libcurl is also required)
4. Run bundle install
5. Export your API key as `CF_TOKEN` environment variable
6. Run `app.rb`
7. Browse to [localhost:4567](`localhost:4567`)
