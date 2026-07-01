docker run --rm --net=host -t -v `pwd`/pdf:/slides astefanutti/decktape http://localhost:8000/$1.html $1.pdf
