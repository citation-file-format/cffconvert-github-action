#! /bin/sh

# check if CITATION.cff exists
if [ -f "CITATION.cff" ]; then
    echo "(1/7) CITATION.cff exists" ;
else
    echo "(1/7) CITATION.cff missing. You can use https://bit.ly/cffinit to create one.";
    exit 1;
fi


# check if .zenodo.json exists
if [ -f ".zenodo.json" ]; then
    echo "(2/7) .zenodo.json exists" ;
else
    echo "(2/7) .zenodo.json missing. Aborting.";
    exit 1;
fi

# check if CITATION.cff is valid YAML
echo "(3/7) Unimplemented"

# check if .zenodo.json is valid JSON
echo "(4/7) Unimplemented"


# check if CITATION.cff is valid CFF --warn if not
CFFCONVERT_VERSION=$(cffconvert --version)
echo "(5/7) Using cffconvert version ${CFFCONVERT_VERSION}."

if [ -z "$(cffconvert --validate)" ] ; then 
    echo "(6/7) CITATION.cff is valid CFF.";
else
    cffconvert --validate
    echo "(6/7) Warning: CITATION.cff is invalid CFF.";
fi


# check if CITATION.cff and .zenodo.json are equivalent
TMPFILE=$(mktemp .zenodo.json.XXXXXXXXXX)
cffconvert --outputformat zenodo --ignore-suspect-keys > ${TMPFILE}
if [ -z "$(diff .zenodo.json ${TMPFILE})" ] ; then 
    echo "(7/7) CITATION.cff and .zenodo.json are equivalent.";
else
    diff --side-by-side .zenodo.json ${TMPFILE}
    echo "(7/7) CITATION.cff and .zenodo.json are not equivalent.";
    exit 1;
fi
