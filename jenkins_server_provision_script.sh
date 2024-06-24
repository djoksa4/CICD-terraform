#!/bin/bash

sudo yum update

# Java
sudo yum install java -y

 # Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Docker
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker

# Add the Jenkins user to the Docker group
sudo usermod -aG docker jenkins

# Git
sudo yum install git -y

# Maven
sudo yum install maven -y

# Create A4L key file with specified content
sudo mkdir /var/lib/jenkins/.ssh

echo '-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAptRorQhhNF4O4b6XEs6uZsLSZkaA5HCfvLCPYDg1gIfbvgIM
xwXbZ37ZoNRsJi0MBpyWrxkOOvznaIlBK10hRu70+kjImHqG3aLf9kVzcoXtk1w1
nhgP73UXFA4E6mURLh5joYBWqPZj9YEQ5gq77MzoRmmDqcUFomGqI48JXgqvCiD5
zMHmIbkJ+7f4viKihgSDGdfUN/Q8D66oi/8B1UTd5NuOgH/M8PcX7XrDukce6PCc
Q5PxiuIlJ7+7wYuKaAs9A4B0BFc3NZrF2xEAx3J6wXj0A5M9hKnm2mE+H6R3u579
fMhhDmrjhliNDwxytlsoA7pJtbS+428Q5O4b9wIDAQABAoIBAHob5NYp2QQ8iEYB
e5B/iTWcCeZkWnlaWgEBdqAl5DtEtblYxMNz7QjO1zoZ4WL7+95nBP/6pejVLgfc
1r+HthC2XMdJONIqdMaLLcSTRxIfJyqCBpjF4fwSRycdr8lk2nNYOPJ//m5Dkhyj
MJxAZRbJUIYhOwarOBmHxMGsM14J37ia9VIgTBLOgtyvMFVcQS3+HB7eql0E2s9z
F+gnF31lxP3uZIVpjyYMIJ30AlPpe4SSVhMtv3B05NCQ8PROm4drmeq798zPQsQT
SuUr79mB37WiOq8dSrrdMr6F/nqUoSJAkjz0+JapD2lJ47K0ksB1ALgobBfgXbzG
hErsYFkCgYEA8TLuoTgiPBeD8cSi3+9teyqcZOLR6HUBFIp1j6AaAqeE+FLxCb49
cbPpvwfwR4LZk9akKGi3ZDxmiIMAG9HoOGbJ3XwQ8h5v5HngMA87QvpI4XTZ336s
fgTNMtG+6Jclp1/LMhG92o4KiZWujvwIeER1br9iV25OhAlIkNyS4s0CgYEAsREw
FWfzmD28eXX/WBaK+shvgkTcz3vN1c6t0k3K2/FTP557blyEtf90G9aOqZRectOB
whmcwhYTn49wqLKf+ZyWRNPM2EfGRPkqYVKRc60vnLpnliykTlOt5tt8gcsaZ2ag
DUmFCfg8q1L6AcOfyHy2Aw7Jx1D0fpdVIe6j4dMCgYEAheulm1Yzi/HyjLaFSJkD
zLMoCsv1iIAOjX0jMQ/P4VFp/wbuVl6OdydRzYN24f3BGNjAZL9ftAPlWj6CPPAb
Y9WOl69fKU/FCLKyy3xphxK4jJX4sqL+2ymHVYQn37Ssb3Y8uBwpscPUDfhR54oA
meZI3ajdzXWtmpoc9HHEDLECgYB247eJZ/bjrfAzDcuZdelzYcmdimdI2TPn75I+
twUSkQL4oIz4GR7ypMdtOa8opfqU1vc1QMVEfFZIuKNIYkeP7lfndt8ACZFTFooi
NrJ7HTnu3ipXZzobbYxCifUboSflbb7hrQ+rFgaGcnxzWsqab0I242MQdYb0yN/c
nMNlCQKBgQCOv4H52xkJY42AWfaON8bK+OKGhyoy7gBiu/yQRkylZOrCbn48rdg7
4HC+++1VN9WG6akk077HqZgEH2512k5i5pF33XKyyusVAO3YFm8mh7ZlqLl/eO4S
xLqNd9DiLGk+b6sm3NqDBMeVTnIBn1JX28FXMz9EzSSz5KscxS+omA==
-----END RSA PRIVATE KEY-----' | tee /var/lib/jenkins/.ssh/A4L.pem > /dev/null

# Give Jenkins key ownership and permissions
sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh
sudo chown jenkins:jenkins /var/lib/jenkins/.ssh/A4L.pem
sudo chmod 400 /var/lib/jenkins/.ssh/A4L.pem