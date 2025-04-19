# wb_check - Write You a Barrier! -
## About Tool
The tool is for checking/inserting Write Barrier inside C extension code.

Tools seek C structure pointer wrapped by T_DATA objects.

If you want to treat T_DATA object as 'WB_PROTECTED', 
you need to call Write Barrier when VALUE field inside the C structure was changed.

Tool helps to search such a point within code, or insert write barrier directly to code.

More details on: [Session on RubyKaigi2025](https://rubykaigi.org/2025/presentations/duerst.html#day2)


## How to use
1. preprocess target C extension code by `gcc -E - P` with include file specified.

2. 
```
gem install tree-sitter
```

3. run wb_check.rb with target preprocessed code.
```
ruby wb_check.rb TARGET_CODE.c
```

## LICENSE
“Licensed under the MIT License – see LICENSE for details.”
