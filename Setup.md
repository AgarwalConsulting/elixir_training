# Setup

## Windows

- Download the installer from https://elixir-lang.org/install.html#windows

  - This includes Erlang/Beam OTP

---

## Update your path variable

### For *Nix

Add to your shell initialization scripts (`~/.bashrc` or `~/.bash_profile` or `~/.zshrc`) the following...

```bash
export PATH="</path/to/elixir/installation>/bin:$PATH"
```

P.S. You can check which shell you are using by running `echo $SHELL`.

### For Windows

You would have to Edit your "Environment Variables". Refer: [How to set environment variables](https://docs.oracle.com/en/database/oracle/machine-learning/oml4r/1.5.1/oread/creating-and-modifying-environment-variables-on-windows.html#GUID-DD6F9982-60D5-48F6-8270-A27EC53807D0)

Ensure that `</path/to/elixir/installation>/bin` is added to the `%PATH%` variable.

> Restart your `git bash` and verify the steps 1 and 2 again.
