Create Fake Swap in OpenVZ VPS if you get swapon failed: Operation not permitted Error

[root@server] chmod +x fakeswap.sh
[root@server] sh fakeswap.sh
[root@server] free -m
 total       used       free
Mem:          4096        104       3991
-/+ buffers/cache:        104       3991
Swap:          512          0        512

to create 1024MB Swap run like below
[root@server] sh fakeswap.sh 1024
[root@server] free -m
 total       used       free
Mem:          4096        104       3991
-/+ buffers/cache:        104       3991
Swap:          1024          0        1024
