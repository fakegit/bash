#!/bin/bash
# Detects Linux Distribution
#
# Many Distributions have lsb_release or use /etc/lsb_release
# For those that do not we have some fallback cases
#
# The goal is to report the Distribution and Version that is being used
# An icon will be display based on the first word of the distro's name.
# Example: Scientific Linux 6.1 will be Scientific.png or Scientific.gif

OS=$(uname -s)
VER=$(uname -r)

# Look for lsb_release in path
LSB_REL=$(which lsb_release 2>/dev/null)

if [[ $OS == Linux ]]; then
    # If lsb_release is executable set the DIST and VER
    if [[ -x $LSB_REL ]]; then
        DIST=$(lsb_release -is)
        VER=$(lsb_release -rs)
    elif [[ -f /etc/lsb-release ]]; then
        DIST=$(grep 'DISTRIB_ID' /etc/lsb-release | cut -d"=" -f2)
        VER=$(grep 'DISTRIB_RELEASE' /etc/lsb-release | cut -d"=" -f2)
    elif [[ -f /etc/redhat-release ]]; then
        DIST=$(sed 's/ release.*//' /etc/redhat-release)
        VER=$(sed 's/.*release\ //' /etc/redhat-release | sed 's/\ .*//')
    elif [[ -f /etc/SuSE-release ]]; then
        DIST=$(head -1 suse | awk '{print $1}')
        VER=$(awk '/VERSION/ {print $3}' /etc/SuSE-release)
    elif [[ -f /etc/debian_version ]]; then
        DIST="Debian"
        read VER < /etc/debian_version
    elif [[ -f /etc/arch-release ]]; then
        DIST="Arch Linux"
        VER=""
    else
        DIST="${OS}"
    fi

    # Exceptions
    # RHEL uses multiple strings RedHatEnterpriseWS (4.x), RedHatEnterpriseServer (5.x, 6.x)
    if [[ $DIST =~ RedHatEnterprise ]]; then
        DIST="RedHatEnterprise"
    fi

    OSSTR="${DIST} ${VER}"
else
    OSSTR="$OS $VER"
fi

echo ${OSSTR}
