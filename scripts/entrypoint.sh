#!/bin/bash

if "${LAUNCH_SSH_SERVER}"; then
    # setup private key
    mkdir -p /home/user/.ssh
    (cp -rf /tmp/authorized_keys /home/user/.ssh/authorized_keys || /bin/true)
    (cp -rf /tmp/id_rsa /home/user/.ssh/id_rsa || /bin/true)
    chown -R user:user /home/user/.ssh

    # launch openssh server
    /usr/sbin/sshd -D
fi
