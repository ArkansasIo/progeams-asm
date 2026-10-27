; object.inc — native object ABI

struc ObjectHeader
    .type_id:      resq 1
    .flags:        resq 1
    .ref_count:    resq 1
    .method_table: resq 1
endstruc

%define OBJECT_FLAG_ALIVE 1
