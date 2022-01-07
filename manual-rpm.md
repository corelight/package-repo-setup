# rpm Repo Setup

Install `pygpgme`, a package which allows yum to handle `gpg signatures`, and a package called `yum-utils` which contains the tools you need for installing `source RPMs`.

    sudo yum install pygpgme yum-utils

You may need to install the `EPEL repository` for your system to install these packages. If you do not install `pygpgme`, GPG verification will not work.

Create a file named `/etc/yum.repos.d/corelight.repo`  that contains the repository configuration below.

Make sure to replace `el` and `8` in the config below with your `Linux distribution and version`:

    [corelight]
    name=corelight
    baseurl=https://packagecloud.io/corelight/stable/el/8/$basearch
    repo_gpgcheck=1
    gpgcheck=0
    enabled=1
    gpgkey=https://packagecloud.io/corelight/stable/gpgkey
    sslverify=1
    sslcacert=/etc/pki/tls/certs/ca-bundle.crt
    metadata_expire=300

    [corelight-source]
    name=corelight-source
    baseurl=https://packagecloud.io/corelight/stable/el/8/SRPMS
    repo_gpgcheck=1
    gpgcheck=0
    enabled=1
    gpgkey=https://packagecloud.io/corelight/stable/gpgkey
    sslverify=1
    sslcacert=/etc/pki/tls/certs/ca-bundle.crt
    metadata_expire=300

Valid options for os and dist parameters can be found in our supported OS list in the docs.

Update your local yum cache by running

    sudo yum -q makecache -y --disablerepo='*' --enablerepo='corelight_stable'

You can now install packages from your repository.
