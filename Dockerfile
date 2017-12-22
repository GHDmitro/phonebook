# Use an official Python runtime as a parent image
#FROM python:2.7-slim
FROM openjdk:8-jdk-alpine

VOLUME /tmp
ARG JAR_FILE
ADD ${JAR_FILE} phonebook.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/phonebook.jar"]

# Set the working directory to /app
WORKDIR /phonebookapp

# Copy the current directory contents into the container at /app
ADD . /phonebookapp

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt
#RUN -it --rm dockerfile/java

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
#ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


# Run app.py when the container launches
CMD ["bash"]