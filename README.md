# SBCL production

A Docker image to run Common Lisp software in production (Ubuntu LTS+SBCL+Quicklisp).

## Usage

In your Dockerfile:

`FROM lifeisfoo/sbcl-production:1.0.0`

## Inside

- Ubuntu 16.04 LTS
- sbcl >= 1.3.1 (from [ubuntu LTS packages](http://packages.ubuntu.com/xenial/sbcl))
- Quicklisp autoload (downloaded and checked from [QL website](https://www.quicklisp.org))


## Changelog

### 1.0.0
Initial release

## License
GPL v3
