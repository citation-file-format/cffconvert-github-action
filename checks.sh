#! /bin/sh
# arguments:
# 1. a relative path to a directory
# 2. flip exit codes for success and failure (used in testing)

if [ -z "$2" ] || [ "$2" == "0" ] ; then
    FAILURE_EXPECTED=0
    FAILURE_CODE=1
    SUCCESS_CODE=0
elif [ "$2" == "1" ] ; then
    echo "Reversing the definition of failure and success"
    FAILURE_EXPECTED=1
    FAILURE_CODE=0
    SUCCESS_CODE=1
else
    echo "Second input argument should be empty, 0, or 1"
    exit 1;
fi

# If the user has provided a first input argument, interpret
# it as a relative path to a directory, and change into it
if [ -n "$1" ] ; then
    cd $1 || exit ${FAILURE_CODE}
    echo "Changed directory into $1"
fi

echo "Using cffconvert version $(cffconvert --version)."

# check if CITATION.cff exists
if [ -f "CITATION.cff" ]; then
    echo "(1/6) CITATION.cff exists" ;
else
    echo "(1/6) CITATION.cff missing. You can use https://bit.ly/cffinit to create one.";
    exit ${FAILURE_CODE};
fi


# check if .zenodo.json exists
if [ -f ".zenodo.json" ]; then
    echo "(2/6) .zenodo.json exists" ;
else
    echo "(2/6) .zenodo.json missing. Aborting.";
    exit ${FAILURE_CODE};
fi


# check if CITATION.cff is valid YAML
echo "(3/6) Unimplemented"


# check if .zenodo.json is valid JSON
echo "(4/6) Unimplemented"


if $(cffconvert --validate) ; then 
    echo "(5/6) CITATION.cff is valid CFF.";
else
    cffconvert --validate
    echo "(5/6) Warning: CITATION.cff is invalid CFF.";
fi


# check if CITATION.cff and .zenodo.json are equivalent
TMPFILE=$(mktemp .zenodo.json.XXXXXXXXXX)
cffconvert --outputformat zenodo --ignore-suspect-keys > ${TMPFILE}
if [ -z "$(diff .zenodo.json ${TMPFILE})" ] ; then 
    echo "(6/6) CITATION.cff and .zenodo.json are equivalent.";
else
    diff .zenodo.json ${TMPFILE}
    echo "(6/6) CITATION.cff and .zenodo.json are not equivalent.";
    exit ${FAILURE_CODE};
fi

exit ${SUCCESS_CODE};
