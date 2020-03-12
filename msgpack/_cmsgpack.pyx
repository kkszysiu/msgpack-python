# coding: utf-8
#cython: embedsignature=True, c_string_encoding=ascii, language_level=3
from cpython.datetime cimport import_datetime, datetime_new
import_datetime()

import sys
import datetime
cdef object utc = None
cdef object epoch = None
if sys.version_info[0] == 2:
    epoch = datetime_new(1970, 1, 1, 0, 0, 0, 0, None)
else:
    utc = datetime.timezone.utc
    epoch = datetime_new(1970, 1, 1, 0, 0, 0, 0, tz=utc)

include "_packer.pyx"
include "_unpacker.pyx"
