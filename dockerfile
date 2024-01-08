FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app
RUN update-ca-certificates

# Copy the requirements file to the container
COPY requirements.txt .

RUN python -m venv challenge_venv
ENV PATH="/app/challenge_venv/bin:$PATH"

# Install dependencies
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt

# Copy the application code into the container
COPY app .

# Set environment variables
ENV FLASK_APP=app/main.py

ENV FLASK_ENV=development

# Optional - Turn on the debugger
# ENV FLASK_DEBUG=1

# Expose the port the app runs on
EXPOSE 5000

# Run the application

# CMD ["python", "app/main.py"]

CMD ["flask", "run", "--host=0.0.0.0"]
