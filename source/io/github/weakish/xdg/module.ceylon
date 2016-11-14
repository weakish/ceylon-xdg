"""XDG base directories for application.

   Example:

   ```ceylon
   XDG xdg = XDG("foo");
   print(xdg.config); // "$XDG_CONFIG_HOME/foo" or "~/.config/foo"
   ```
   """
native("jvm") module io.github.weakish.xdg "0.0.0" {
    shared import ceylon.file "1.3.0";
    import ceylon.test "1.3.0";
}
