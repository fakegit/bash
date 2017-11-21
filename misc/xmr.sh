#!/bin/bash
# Ubuntu / Debian
sudo apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev
git clone https://github.com/fireice-uk/xmr-stak.git

#mv xmr-stak/xmrstak/donate-level.hpp xmr-stak/xmrstak/donate-level.hpp.old
#cat > xmr-stak/xmrstak/donate-level.hpp << EOF #pragma once
#constexpr double fDevDonationLevel = 0.0 / 100.0;
#EOF

cp xmr-stak/xmrstak/donate-level.hpp xmr-stak/xmrstak/donate-level.hpp.old
sed -i 's/constexpr double fDevDonationLevel = 2.0/constexpr double fDevDonationLevel = 0.0/g' xmr-stak/xmrstak/donate-level.hpp

mkdir xmr-stak/build
cd xmr-stak/build
cmake .. -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF
make install

sudo sysctl -w vm.nr_hugepages=128
sed -i 's/# End of file/* soft memlock 262144\n* hard memlock 262144\n# End of file/g' /etc/security/limits.conf

./bin/xmr-stak
