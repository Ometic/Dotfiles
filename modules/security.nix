{ config, ... }:

{
  security = {
    rtkit.enable = true;

    protectKernelImage = true;
  };
}
