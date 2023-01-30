## Setup

You need to have the following installed:

- [Vagrant](https://www.vagrantup.com/)
- [Parallels](https://www.parallels.com/)

  - Other hypervisors might be possible too.

## Commands

Run these commands in the `vagrant` directory.

### Make the vagrant VM with:

    make up provider=parallels

### Delete with

    make destroy

### Re-provision with

    make provision

### SSH into the container

    make ssh

## Building container

1. Make VM
   - `make up provider=parallels`
2. Export the SSH config from vagrant to the local folder

   - `make vagrant-ssh`

3. You can use this ssh file in VSCode to get into the VM for remote development
   - [VS Code Docs](https://code.visualstudio.com/docs/remote/ssh)

## Notes

- I do not know the source of [this box](https://app.vagrantup.com/jeffnoxon/boxes/ubuntu-20.04-arm64): `config.vm.box = "jeffnoxon/ubuntu-20.04-arm64"`. Before we would add any documentation to the project we need to make sure that we can build this from an official source. We might need to use packer to do this if we go down this road.

- The sync folder options may need tweaking

- The provision script is very barebones
