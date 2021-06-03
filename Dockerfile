FROM registry.access.redhat.com/ubi8-minimal:latest

LABEL   name="asciidoctor" \
        version="1.3" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="Open source AsciiDoc implementation in Ruby" \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave --env HOME=${HOME} \
             --workdir $(pwd) --security-opt label=disable rhjhunt/asciidoctor"

RUN echo -e "[ruby]\nname=ruby\nstream=2.7\nprofiles=\nstate=enabled\n" > /etc/dnf/modules.d/ruby.module && \
    microdnf -y --nodocs update && \
    microdnf -y --nodocs install ruby ruby-devel && \
    microdnf clean all  && \
    rm -rf /var/cache/yum && \
    gem install --no-document asciidoctor asciidoctor-pdf rouge asciidoctor-diagram

WORKDIR /documents
VOLUME ["/documents"]

CMD ["/bin/bash"]
