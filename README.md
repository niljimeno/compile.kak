# Compile.kak
Make shortcuts to scripts to compile your project.

This plugin has 2 commands:
- compile: compile normally
- compile-quick: compile skipping prompts

```kak
map -docstring "Compile (prompted)" \
    global normal <a-r> ':compile<ret>'

map -docstring "Compile (no prompts)" \
    global normal <c-r> ':compile-quick<ret>'
```

Previously ran commands are saved at /tmp.
