#!/bin/bash

# Because I like fig. It's short and sweet, literally.
if command_exists "docker-compose"; then
  alias fig="docker-compose"
fi