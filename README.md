# HelloWorld C++ Project

This project demonstrates a basic "Hello World" application written in C++ using CMake for building, Docker for containerization, Google Test for unit testing, and gcovr/lcov for code coverage reports. The project is set up with a CI/CD pipeline using GitHub Actions to automate building, testing, and pushing the Docker image to Docker Hub.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- Docker installed on your machine.
- CMake.
- A modern C++ compiler (GCC).
- Access to Docker Hub for pushing Docker images.

## Setting Up the Project

To set up the HelloWorld project, follow these steps:

1. Clone the repository to your local machine:
`git clone https://github.com/eric-jalal/cpp-pipeline.git`

2. Navigate into the project directory:
`cd helloworld`

## Building the Project

To build the project using CMake, run the following commands:

1. Create a build directory and navigate into it:
`mkdir build && cd build`

2. Configure the project with CMake:
`cmake ..`

3. Build the project:
`cmake --build .`

The executable will be created in the `build` directory.

## Running the Project
`./main`


You should see the output:
Hello, World!


## Running Unit Tests

Unit tests are managed with Google Test. To run the tests, follow these steps after building the project:

1. From the `build` directory, run the test executable:
`./main_test`


2. Test results will be displayed in the terminal.


## Docker Container

To build and run the project inside a Docker container, use the provided `Dockerfile`:

1. Build the Docker image:
`docker build -t helloworld .`


2. Run the Docker container:
`docker run helloworld`

## CI/CD Pipeline

This project uses GitHub Actions for continuous integration and deployment. The CI/CD pipeline automates the process of building the project, running tests, generating coverage reports, and pushing the Docker image to Docker Hub.

The pipeline configuration can be found in `.github/workflows/build.yml`.

## License

This project uses the following license: `LICENSE`.


