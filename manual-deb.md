# deb Repo Setup

Begin by refreshing your package cache by running

    sudo apt-get update

If you are running Debian, install debian-archive-keyring so that official Debian repositories will be verified (Ubuntu users can skip this)

    sudo apt-get install debian-archive-keyring

Ensure the required tools (curl, gpg, apt-transport-https) are installed before proceeding:

    sudo apt-get install curl gnupg apt-transport-https

In order to install a deb repo, first you need to install the GPG key that used to `sign repository metadata`. You do that using a utility called `apt-key`.

    curl -L https://packagecloud.io/corelight/stable/gpgkey | sudo apt-key add -

Create a file named `/etc/apt/sources.list.d/corelight.list` that contains the repository configuration below.

Make sure to replace `ubuntu` and `focal` in the config below with your Linux distribution and version:

    deb https://packagecloud.io/corelight/stable/ubuntu/ focal main
    deb-src https://packagecloud.io/corelight/stable/ubuntu/ focal main

Run this command update your local APT cache:

    sudo apt-get update

You can now install packages from your repository.
