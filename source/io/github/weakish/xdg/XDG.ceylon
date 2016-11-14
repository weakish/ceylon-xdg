import ceylon.file {
    Path,
    home,
    parsePath
}
import ceylon.test {
    test,
    assertEquals,
    assertNull
}

"XDG base directories."
shared class XDG(String path) {
    Path xdg_base(String environment_variable, Path default) {
        Path base;
        if (exists env = process.environmentVariableValue(environment_variable)) {
            base = parsePath(env);
        } else {
            base = default;
        }
        return base.childPath(path);
    }

    Path default_data_home = home.childPath(".local").childPath("share");
    "$XDG_DATA_HOME/app"
    shared Path data = xdg_base("$XDG_DATA_HOME", default_data_home);

    Path default_config_home = home.childPath(".config");
    "$XDG_CONFIG_HOMEl/app"
    shared Path config = xdg_base("$XDG_CONFIG_HOME", default_config_home);

    "$XDG_CACHE_HOME/app"
    Path default_cache_home = home.childPath(".cache");
    shared Path cache = xdg_base("$XDG_CACHE_HOME", default_cache_home);
}


test void foo_data() {
    assertNull(process.environmentVariableValue("$XDG_DATA_HOME"));
    assertEquals(XDG("foo").data.string, "``home.string``/.local/share/foo");
}
test void foo_config() {
    assertNull(process.environmentVariableValue("$XDG_CONFIG_HOME"));
    assertEquals(XDG("foo").config.string, "``home.string``/.config/foo");
}
test void foo_cache() {
    assertNull(process.environmentVariableValue("$XDG_CACHE_HOME"));
    assertEquals(XDG("foo").cache.string, "``home.string``/.cache/foo");
}