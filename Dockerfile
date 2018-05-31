FROM norionomura/swift:411
LABEL maintainer "Steffen Matthischke <steffen.matthischke@gmail.com>"

ENV BRANCH="docker"

RUN git clone --branch docker https://github.com/HeEAaD/xcprojectlint.git && \
    cd xcprojectlint && \
    swift package update && \
    swift build --configuration debug && \
    mv `swift build --configuration debug --show-bin-path`/xcprojectlint /usr/bin && \
    cd .. && \
    rm -rf xcprojectlint

# Print Installed xcprojectlint Version
RUN xcprojectlint --version
CMD ["xcprojectlint"]
