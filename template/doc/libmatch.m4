## A collection of M4 macros for producing UNIX manuals.
## Mostly intended for documenting C programs, C functions, and more.

## Configuration
define(`M4_SECTION', `SECTION_HERE')
define(`M4_CATEGORY', `CATEGORY_NAME_HERE')

## Internal utility macros-- do not modify, but feel free to use
define(`M4_FILENAME', `syscmd(echo -n __file__ | xargs basename    | \
                              tr "[[:lower:]]" "[[:upper:]]" | rev | \
                              cut -d "." -f 2- | rev | tr --delete "\n")')

define(`M4_FILENAME_ORIGINAL', `syscmd(echo -n __file__ | xargs basename | \
                                       rev | cut -d "." -f 2- | rev      | \
                                       tr --delete "\n")')

define(`M4_CURRENT_DATE', `syscmd(`date +"%B %d, %Y" | tr --delete "\n"')')

## Manual Macros-- These are intended for user
define(`M4_HEADER', `.TH "M4_FILENAME" "M4_SECTION" "M4_CURRENT_DATE" \
" " "M4_CATEGORY"')

define(`M4_BOLD', `.B "$1"')
define(`M4_REFERENCE', `.BR "$1" "($2)"')
define(`M4_ITALICS', `.I "$1"')

define(`M4_LOCAL_INCLUSION', `.B "#include ""$1"""
.br
')
define(`M4_SYSTEM_INCLUSION', `.B "#include $1"')

### Bulleted list macros
define(`M4_BULLETED_LIST_START', `')
define(`M4_BULLETED_LIST_START_ENTRY', `.IP "\[bu]" $1i')
define(`M4_BULLETED_LIST_ENTRY', `$1')
define(`M4_BULLETED_LIST_END', `.IP "" 0i')

### 'Name' section macros
define(`M4_NAME_START', `.SH NAME
M4_FILENAME_ORIGINAL - $1')

### 'Synopsis' section macros
define(`M4_SYNOPSIS_START', `.SH SYNOPSIS')
define(`M4_SYNOPSIS_FUNC_START', `.BI dnl')
define(`M4_SYNOPSIS_FUNC_TYPE', `"$1" dnl')
define(`M4_SYNOPSIS_FUNC_ARGUMENT', `"$1" dnl')
define(`M4_SYNOPSIS_FUNC_END', `");
.br dnl"')

### 'Description' sectiom macros
define(`M4_DESCRIPTION_START', `.SH DESCRIPTION')

### Table macros
define(`M4_MANUAL_TABLE_START', `.TS
tab(;);
lb l
_ _
lb l
.')
define(`M4_TABLE_ENTRY', `ifelse(`$1', `', `', `$1;M4_TABLE_ENTRY(shift($@))')')
define(`M4_TABLE_END', `.TE')

### 'See Also' section macros
define(`M4_SEE_ALSO_START', `.SH SEE ALSO')
define(`M4_SEE_ALSO_MAN', `.BR "$1" "($2),"')
define(`M4_SEE_ALSO_MAN_LAST', `.BR "$1" "($2)"')

### Parameter list macros
define(`M4_PARAMETER', `')

## Project-specific macros-- less likely to be general purpose. These are
## more intended to reduce boilerplate in some areas.

define(`M4_INCLUSIONS', `M4_LOCAL_INCLUSION(`libmatch.h')')
define(`M4_DESCRIPTION_FUNC_INTRO', `The
M4_BOLD(`M4_FILENAME_ORIGINAL')
function')
