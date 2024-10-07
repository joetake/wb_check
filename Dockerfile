FROM ruby:3.3

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    pkg-config \
    libtree-sitter-dev \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app

COPY . /app

RUN gem install ruby_tree_sitter

RUN git clone https://github.com/tree-sitter/tree-sitter-c \
	&& cd /app/tree-sitter-c \
	&& make

ENV PATH_TO_C99PARSER /app/tree-sitter-c/libtree-sitter-c.so

CMD ["ruby", "TreeSitter.rb"]
