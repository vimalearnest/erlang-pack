erlang-pack
=========

A erlang environment providing 

* Syntax highlighting
* lint
* autocomplete
* ... and much more

# Install

In your `.emacs-live.el` add this snippet:
```elisp
(live-add-packs '("/path/to/erlang-pack"))
```

# Configuration

Update your erlang installation path [here](https://github.com/vimalearnest/erlang-pack/blob/master/init.el)


# Usage

* [flycheck](https://www.masteringemacs.org/article/spotlight-flycheck-a-flymake-replacement)
* [erlang-mode](http://erlang.org/doc/apps/tools/erlang_mode_chapter.html)
* [distel](https://github.com/massemanet/distel)

  For most of the functionality provided by distel, you need to start a node and connect to that node using 'C-c C-d n'. 
  
# emacs modes (packages) used in this pack

* erlang-mode
* distel
* popup
* pos-tip
* flycheck
* flycheck-popup-tip (for terminal)
* flycheck-pos-tip (for GUI)
* distel-completion

# Acknowledgments

http://www.lambdacat.com/post-modern-emacs-setup-for-erlang/.
