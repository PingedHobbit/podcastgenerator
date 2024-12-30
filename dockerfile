FROM ubuntu:latest

# Install system packages and python
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git \
    && rm -rf /var/lib/apt/lists/*

# Create and activate virtual environment
RUN python3.10 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python packages in the virtual environment
RUN pip install --no-cache-dir PyYAML

# Copy your files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make sure entrypoint is executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
