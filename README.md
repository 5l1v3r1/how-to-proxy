# HOW TO PROXY
This repo will help you setup your own proxy server.
Here's what you'll need:
- **A linux server**
- **A linux client**

## Client Setup
Install `proxychains-ng` on your client, here are the
setup instructions:

#### Arch
```
sudo pacman -S proxychains-ng
```
#### Ubuntu
```
sudo apt-get install proxychains-ng
```
#### Other
```
git clone https://github.com/rofl0r/proxychains-ng.git
cd proxychains-ng
./configure --prefix=/usr --sysconfdir=/etc
make
make install
cd .. && rm -rf proxychains-ng
```

After installing proxychains, clone this repo
`git clone https://github.com/ngn13/how-to-proxy.git`

## Server Setup
First, setup an SSH server on your server.
Then edit your `/etc/ssh/sshd_config` file as the following:
```
PermitRootLogin no
PubkeyAuthentication no
PasswordAuthentication yes
```

After saving the config, restart your SSH server: 
`systemctl reload sshd.service`

Then install `sshpass`, you can install it with your
package manager.

After that, clone this repo, `cd` into it and crate a file called 
`creds`, containing your username and password for SSH login, put
them in separate lines. Then execute the `server.sh` script 
(with root permissions).
```
git clone https://github.com/ngn13/how-to-proxy.git
cd how-to-proxy
echo username > creds
echo password >> creds
chmod +x server.sh
sudo ./server.sh
```

This script will generate a file called `start.sh` in `/howtoproxy` folder.
In order to startup the proxy server, run this script.
If you want to, you can add this file to your crontab in order to run it on startup.

## Connecting to the Proxy Server
Now, you can connect to your proxy server with your client.
Add the following line to your `/etc/proxychains.conf` file:
```
socks5 YOUR-SERVER-IP 6969
```
And you are ready to go! In order to run something with
proxychains, add proxychains in front of it, for example
if you wanna run firefox with proxychains use: `proxychains firefox`

# Troubleshooting
If you have any problems, crate an issue or contact me on discord
(ngn#4983)

*This project is under MIT license, check LICENSE.txt for more information*