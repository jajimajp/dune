  $ . ../helpers.sh

These opam variables are known as "switch variables" in opam, but since in Dune we don't
have switches, we consider them glboal variables. To keep inline with opam we consider
there to be a single switch named "dune" and all the installation locations should be in
the package building directories.

Note that misc is not supported in dune and a test for it can be found in
opam-var-unsupported.t
  $ mkrepo
  $ mkpkg testpkg <<EOF
  > build: [
  >   [ "echo" switch ]
  >   [ "echo" build ]
  >   [ "echo" prefix ]
  >   [ "echo" lib ]
  >   [ "echo" libexec ]
  >   [ "echo" bin ]
  >   [ "echo" sbin ]
  >   [ "echo" share ]
  >   [ "echo" doc ]
  >   [ "echo" etc ]
  >   [ "echo" man ]
  >   [ "echo" toplevel ]
  >   [ "echo" stublibs ]
  > ]
  > EOF
  > solve testpkg
  Solution for dune.lock:
  testpkg.0.0.1
  
  $ cat dune.lock/testpkg.pkg
  (version 0.0.1)
  
  (build
   (progn
    (run echo %{switch})
    (run echo %{build})
    (run echo %{prefix})
    (run echo %{lib})
    (run echo %{libexec})
    (run echo %{bin})
    (run echo %{sbin})
    (run echo %{share})
    (run echo %{doc})
    (run echo %{etc})
    (run echo %{man})
    (run echo %{toplevel})
    (run echo %{stublibs})))

  $ build_pkg testpkg
  dune
  .
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/lib
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/lib
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/bin
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/sbin
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/share
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/doc
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/etc
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/man
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/lib/toplevel
  $TESTCASE_ROOT/_build/_private/default/.pkg/testpkg/target/lib/stublibs
