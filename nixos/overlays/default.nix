self: super:
{
  
  bat = super.callPackage ./python/bat {};
  orgparse = super.callPackage ./python/orgparse {};
  ipynb-py-convert = super.callPackage ./python/ipynb-py-convert {};
  zeek = super.callPackage ./zeek {};
#  nuclear = super.callPackage ./custom/feh-nuclear.nix {};
#  outline-client = super.callPackage ./custom/outline-client.nix {};
}
