FROM docker/compose:debian-1.29.2
LABEL maintainer="Narate Ketram <rate@dome.cloud>"
WORKDIR /actions-runner
ENV DOTNET_ROOT=/actions-runner
ENV PATH=$PATH:$DOTNET_ROOT
ENV RUNNER_ALLOW_RUNASROOT=true
RUN apt-get update && apt-get install -y curl
RUN curl -o actions-runner-linux-x64-2.280.3.tar.gz -L https://github.com/actions/runner/releases/download/v2.280.3/actions-runner-linux-x64-2.280.3.tar.gz && \
    echo "69dc323312e3c5547ba1e1cc46c127e2ca8ee7d7037e17ee6965ef6dac3c142b  actions-runner-linux-x64-2.280.3.tar.gz" | sha256sum -c && \
    tar xvzf ./actions-runner-linux-x64-2.280.3.tar.gz && \
    curl -o dotnet-install.sh https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh && \
    chmod +x dotnet-install.sh && \
    ./dotnet-install.sh -i $DOTNET_ROOT && \
    ./bin/installdependencies.sh && \
    rm -v *.tar.gz

# RUN adduser --system --shell /bin/bash github-runner
# RUN chown -R github-runner /actions-runner
# USER github-runner

ADD run-actions.sh .
CMD ["/actions-runner/run-actions.sh"]
