if [ -z "$1" ] ; then
    echo "Authtoken is needed. './ngrok.sh \${Authtoken}'"
    echo "Please go to website and check it out."
    echo "https://dashboard.ngrok.com/auth"
    return 2> /dev/null
    exit 0
fi
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O /tmp/ngrok-stable-linux-amd64.zip
unzip -d /usr/bin /tmp/ngrok-stable-linux-amd64.zip
ngrok authtoken $1
