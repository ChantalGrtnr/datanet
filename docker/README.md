Dockerfile to create computational environment with RStudio and all necessary packages.

Build docker container by running: 
`docker build -t r_network_analysis .`

Start docker environment by running:

    docker run \
      --rm \
      -p 8787:8787 \
      -e USERID=$(id -u) \
      -e DISABLE_AUTH=true \
      -v ${PWD}:/home/rstudio/ \
       r_network_analysis

Access RStudio Server via browser at
http://localhost:8787