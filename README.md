# Crontab file generator

This docker image helps you automatically generate crontab file for alpine based cron containers.

The image based on [itsziget/docker-gen-env](https://hub.docker.com/r/itsziget/docker-gen-env) which is inherited from [jwilder/docker-gen](https://hub.docker.com/r/jwilder/docker-gen).

Set labels for containers you want to start periodically. 

**Labels:**

- **&lt;DOCRON_LABEL_PREFIX&gt;.start.schedule**: Crontab row without command to start a container periodically. Ex. "0 20 &ast; &ast; &ast;" to start the container every day at 20 o'clock.
- **itsziget.docron-gen.start.pipeline**: Command which takes the started container's output as input. You can write multiline command using backslashes, but each linebreak will be replaced with one space character. Keep it in mind when you write your command. Imagine you want to send an email to yourself every time the container is started or a command executed in it by the cron.
- **itsziget.docron-gen.exec.schedule**: Crontab row without command. Ex. "0 20 &ast; &ast; &ast;" to start the container every day at 20 o'clock.
- **itsziget.docron-gen.exec.command**: Command to execute periodically in the container.
- **itsziget.docron-gen.exec.pipeline**: Command which takes the executed command's output as input. You can write multiline command using backslashes, but each linebreak will be replaced with one space character. Keep it in mind when you write your command.
- **itsziget.docron-gen.notifyme**: Set the label on a container you want to notify to reload it's configuration.

&lt;DOCRON_LABEL_PREFIX&gt; is "itsziget.docron-gen" by default. You can set the environment variable DOCRON_LABEL_PREFIX to change it. 

You can see an example in [docker-compose.example.yml](https://github.com/itsziget/docron-gen/blob/master/docker-compose.example.yml)