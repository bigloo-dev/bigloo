
Server-side configuration
=========================

The server side (i.e., the GIT directory of the machine on which the
main GIT repository) should contain a file name hooks/post-receive
that is the script to be executed each time a new commit is pushed.

cat > .git/hooks/post-receive << EOF
#!/bin/sh

EOF

chmod a+rx .git/hooks/post-receive

