# Use the base image for the bug bounty
FROM callmedemon/bounty_builded_tools

# Set working directory to /root
WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive

# Unzip specific tarballs and clean up afterward

RUN echo "Extracting tarballs..." && \
    tar -xvzf /root/Templates.tar.gz && rm -rf /root/Templates.tar.gz && \
    tar -xvzf /root/magicrecon_env.tar.gz && rm -rf /root/magicrecon_env.tar.gz && \
    tar -xvzf /root/go.tar.gz && rm -rf /root/go.tar.gz && \
    tar -xvzf /root/tools.tar.gz && rm -rf /root/tools.tar.gz && \
    tar -xvzf /root/git_cloned.tar.gz && rm -rf /root/git_cloned.tar.gz && \
    tar -xvzf /root/nuclei-templates.tar.gz && rm -rf /root/nuclei-templates.tar.gz

  
