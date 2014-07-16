#!/bin/sh

cd acceptance

echo "##############################"
echo "   Running Acceptance Specs   "
echo "##############################"

bundle exec rspec spec --format documentation

echo "##############################"
echo "   Done Running Specs   "
echo "##############################"

cd - > /dev/null
