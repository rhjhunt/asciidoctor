FROM registry.access.redhat.com/ubi9-minimal

LABEL   name="asciidoctor" \
        version="1.4" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="Open source AsciiDoc implementation in Ruby" \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave --env HOME=${HOME} \
             --workdir $(pwd) --security-opt label=disable rhjhunt/asciidoctor"

RUN microdnf install -y --setopt install_weak_deps=0 --nodocs ruby ruby-devel && \
    microdnf clean all --enablerepo='*'  && \
    gem install --no-document asciidoctor asciidoctor-pdf rouge asciidoctor-diagram

WORKDIR /documents
VOLUME ["/documents"]

CMD ["/bin/bash"]
