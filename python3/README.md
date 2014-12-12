# python3

This is the default Spilgames python3 runtime. Current version is `3.4.2`.

# Example Dockerfile

Because examples speak louder than words, here's how you should use this
runtime if all you want to do is run a simple Django app:

        FROM spilgames/python3
        COPY hacking/settings.py /app/

# Building your container

On build, this runtime will copy the source tree into the container at /app/src,
install dependencies from `requirements.txt` (if it exists), and install your
application by calling its `setup.py` (again, if it exists). If you need to
install additional build dependencies (for instance, to be able to compile
certain Python C-extensions), you can add the package names to
/build/builddeps-myapp (the buildscript will include everything from
/build/builddeps*).

# ToDo

 - Investigate use of python wheels to speed up container build


