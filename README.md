### intro
This project so far contains a commandline tool that compresses and encodes a set of files as a PNG image. The goal is to find a way to encode encrypted data in a way that's not detectable as such. I have chosen to delay the effort of implementing a decoder, as well as adding the encryption layer, until I feel reasonably confident about having reached the goal.

### usage
The code is written in [gfoo](https://github.com/codr7/gfoo) which needs to be installed to run it. Any number of input files may be specified, the resulting PNG image is written to standard output. The files are zipped before being encoded to reduce size and preserve file names.

```
$ gfoo enojs.gf alice.txt > alice.png
```

### examples
Two examples are included in the repository, the complete texts of [Alice's Adventures in Wonderland](https://github.com/codr7/nojs/blob/master/alice.txt) by Lewis Carroll and [The Adventures of Sherlock Holmes](https://github.com/codr7/nojs/blob/master/sherlock.txt) by Arthor Conan Doyle.

alice.png
![alice](alice.png)

sherlock.png
![sherlock](sherlock.png)