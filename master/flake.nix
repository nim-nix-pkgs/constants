{
  description = ''Mathematical numerical named static constants useful for different disciplines'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-constants-master.flake = false;
  inputs.src-constants-master.owner = "juancarlospaco";
  inputs.src-constants-master.ref   = "master";
  inputs.src-constants-master.repo  = "nim-constants";
  inputs.src-constants-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-constants-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-constants-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}