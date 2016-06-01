FROM ubuntu:16.04
MAINTAINER Alessandro Miliucci <lifeisfoo@gmail.com>

# Install sbcl from Ubuntu repositories
RUN apt-get update && apt-get install -y sbcl curl

# Set workdir (after apt-get for faster build time after Dockerfile changes)
ENV DIR_PATH /tmp
WORKDIR $DIR_PATH

# Download quicklisp installer and related files
RUN curl -O https://beta.quicklisp.org/quicklisp.lisp
RUN curl -O https://beta.quicklisp.org/quicklisp.lisp.asc
RUN curl -O https://beta.quicklisp.org/release-key.txt

# Verify quicklisp
RUN gpg --import release-key.txt
RUN gpg --verify quicklisp.lisp.asc quicklisp.lisp

# Install quicklisp and enable autoload on sbcl startup
RUN sbcl --non-interactive --load quicklisp.lisp --eval "(quicklisp-quickstart:install)" --eval "(ql::without-prompting (ql:add-to-init-file))"

# Cleanup
RUN apt-get clean
RUN rm -rf quicklisp.lisp quicklisp.lisp.asc release-key.txt