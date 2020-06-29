# asciidoctor container

Container for asciidoctor built on Fedora.

## Pull

You can pull from Quay.io:

```terminal
podman pull quay.io/rhjhunt/asciidoctor

You can also build your own:

```terminal
git clone https://github.com/rhjhunt/asciidoctor.git
cd asciidoctor
buildah bud -t asciidoctor .
```

## Run

You can run the container interactively with the following command.

```terminal
podman run --rm -it --volume "${HOME}:${HOME}:rslave" --env "HOME=${HOME}" --security-opt label=disable --workdir "$(pwd)" quay.io/rhjhunt/asciidoctor:latest
```

Or create an alias in your _~/.bashrc_ file.

```bash
alias asciidoctor-pdf='podman run --rm -it \
        --volume "${HOME}:${HOME}:rslave" \
        --env "HOME=${HOME}" \
        --security-opt label=disable \
        --workdir "$(pwd)" \
        --entrypoint /usr/bin/asciidoctor-pdf \
        quay.io/rhjhunt/asciidoctor:latest'
```
