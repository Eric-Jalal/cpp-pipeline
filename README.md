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

## Docker Key Points:
Multi-Stage Build: This Dockerfile utilizes a two-stage build process. The first stage, named builder, is based on gcc:9.5.0 and is used for compiling the application. The second stage uses a smaller base image (debian:buster-slim in this example) for running the application.

COPY --from=builder: This command copies the compiled application from the builder stage into the second stage. Adjust the source and destination paths according to where your build system outputs the compiled binaries.

Reducing Image Size: The final image does not include the C++ compiler, CMake, or source code, significantly reducing its size.

### Considerations:

Base Image for Runtime: The choice of debian:buster-slim is a balance between size and compatibility. Depending on your application's dependencies, you might opt for another image like alpine for an even smaller footprint. However, ensure that your application and its runtime dependencies are fully compatible with the chosen base image.

Runtime Dependencies: If your application requires additional runtime libraries, you may need to install these in the second stage. Use the apt-get or equivalent package manager commands to install these dependencies, and remember to clean up the cache afterwards to keep the image size small.

## CI/CD Pipeline

This project uses GitHub Actions for continuous integration and deployment. The CI/CD pipeline automates the process of building the project, running tests, generating coverage reports, and pushing the Docker image to Docker Hub.

The pipeline configuration can be found in `.github/workflows/build.yml`.

## Release process

After the merge as it is explained below, the project is getting archived and pushed to Github Release artifacts. That includes all the source codes.
This is not correct and is subjected to a change. But it is not breaking the normal flow because it does push the SHA labeled image to HUB.
Later on we better to change it so it follows a git flow and in a separate stage push the image labled as `latest` and create the release artifactt only containing the `/usr/src/app/main` .


### Workflow

- Make changes and push them into default branch `develop`
- Create a PR so `build.yml` will be triggered
- If successful, merge it into `main` branch
- Merge into main branch does automatically treigger `release-create` workflow

## License

This project uses the following license: `LICENSE`.


