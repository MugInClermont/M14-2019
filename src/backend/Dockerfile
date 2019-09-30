FROM google/dart:2.4.1

COPY ./ ./

# Install dependencies, pre-build
RUN pub get

# Optionally build generaed sources.
# RUN pub run build_runner build

# Set environment, start server
ENV ANGEL_ENV=production
EXPOSE 80
CMD dart bin/prod.dart