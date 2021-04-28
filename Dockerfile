FROM registry.fedoraproject.org/fedora-minimal:34

LABEL   name="asciidoctor" \
        version="1.3" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="Open source AsciiDoc implementation in Ruby" \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave --env HOME=${HOME} \
             --workdir $(pwd) --security-opt label=disable rhjhunt/asciidoctor"

RUN microdnf -y --nodocs update && \
    microdnf -y --nodocs install ruby ruby-devel && \
    microdnf -y --nodocs install rubygem-asciidoctor rubygem-asciidoctor-pdf && \
    microdnf -y --nodocs install rubygem-rouge && \
    microdnf clean all  && \
    rm -rf /var/cache/yum && \
    gem install --no-document asciidoctor-diagram

WORKDIR /documents
VOLUME ["/documents"]

CMD ["/bin/bash"]
