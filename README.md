<h1>
  dotfiles
  <img src='https://i.postimg.cc/QCmpdSMQ/Space-Cube-Logo.png' style='background-color:transparent;' height='36px' align='right'/>
</h1>

![Static Badge](https://img.shields.io/badge/Status-Active-lightgreen)
<a href='https://dannyharris.dev/'><img src='https://img.shields.io/badge/DH-Portfolio-1d72af' /></a>

**Repository of dotfiles and an install script**

This repository includes custimized config files for various programs, as well as an install script for a wider set of tools I commonly use.

The intent is to be able to quickly and easily get up and running should I need to setup a new machine.

## Usage

Clone this repository and use the `stow` command to symlink the configs you want to use.

```bash
git clone https://github.com/Zerossive/dotfiles.git
cd dotfiles
stow bin git yazi ...
```
