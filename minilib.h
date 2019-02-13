// Include this file in order to use minilib functions.
// define the names of the functions you'd like to use here,
// uncomment unwanted functions.

/// Len of buf used by read, mprintf, ..
#define mini_buf 128
#define mini_error

#define mini_start start
#define mini_write
#define mini_read
#define mini_mprints
#define mini_mprintf
#define mini_perror
//#define mini_msprintf
//#define mini_mfprintf
//#define mini_itohex
#define mini_itodec
#define mini_atoi
//#define mini_itobin
#define mini_exit
#define mini_syscall
#define mini_ioctl
#define mini_tcgetattr
#define mini_tcsetattr
#define mini_select 
#define mini_mstrcmp 
#define  mini_memcpy
//#define mini_epoll // TODO:: doesn't ork


// Whether to overwrite the standard calls to printf, ...
#define mini_overwrite





#include "minilib/include/minilib_header.h"

