READKEY
=======

Tiny tool (statically linked, amd64: 8.5KB) to read (blocking and nonblocking) keyboard input.


Usage: `readkey [-b] [-w secs] [-d [dotrate]]`

Small program to wait for a key.

    The key/modifier is printed to stdout,
    the return code is either the error code or
    a value describing the modifier keys.

~~~
    parameters:
-b             : block until a key is pressed.
-w [secs]      : wait for [secs] (default 0) seconds for input.
-d [dotrate]   : show 1 dot per second waiting, optional [dotrate] dots per second
--ret-modifier : return the pressed modifier - A value composed by these or´ed values: CTRL=1 | ALT=2 | SHIFT=4.
--only-key     : Don´t print the modifier. (Doesn´t affect --ret-modifier)
--debug        : Debug, print the full scancode

Returns 255: unknown (most possibly related to select) error
        254: timeout.
        253: Unknown Scancode
          0: Ok / No modifier
~~~

Example: key=`term_readkey -w 5`


CC-BY 4.0 
Michael Misc Myer www.github.com/michael105/readkey
