typedef __builtin_va_list __gnuc_va_list;
typedef __gnuc_va_list va_list;

typedef long unsigned int size_t;
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;
typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;
typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
typedef long int __suseconds64_t;
typedef int __daddr_t;
typedef int __key_t;
typedef int __clockid_t;
typedef void * __timer_t;
typedef long int __blksize_t;
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;
typedef long int __fsword_t;
typedef long int __ssize_t;
typedef long int __syscall_slong_t;
typedef unsigned long int __syscall_ulong_t;
typedef __off64_t __loff_t;
typedef char *__caddr_t;
typedef long int __intptr_t;
typedef unsigned int __socklen_t;
typedef int __sig_atomic_t;
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
struct _IO_FILE;
typedef struct _IO_FILE __FILE;
struct _IO_FILE;
typedef struct _IO_FILE FILE;
struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;
typedef void _IO_lock_t;
struct _IO_FILE
{
  int _flags;
  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;
  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;
  struct _IO_marker *_markers;
  struct _IO_FILE *_chain;
  int _fileno;
  int _flags2;
  __off_t _old_offset;
  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];
  _IO_lock_t *_lock;
  __off64_t _offset;
  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  size_t __pad5;
  int _mode;
  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
typedef __ssize_t cookie_read_function_t (void *__cookie, char *__buf,
                                          size_t __nbytes);
typedef __ssize_t cookie_write_function_t (void *__cookie, const char *__buf,
                                           size_t __nbytes);
typedef int cookie_seek_function_t (void *__cookie, __off64_t *__pos, int __w);
typedef int cookie_close_function_t (void *__cookie);
typedef struct _IO_cookie_io_functions_t
{
  cookie_read_function_t *read;
  cookie_write_function_t *write;
  cookie_seek_function_t *seek;
  cookie_close_function_t *close;
} cookie_io_functions_t;
typedef __off_t off_t;
typedef __off64_t off64_t;
typedef __ssize_t ssize_t;
typedef __fpos_t fpos_t;
typedef __fpos64_t fpos64_t;
extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;
extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));
extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));
extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));
extern int renameat2 (int __oldfd, const char *__old, int __newfd,
        const char *__new, unsigned int __flags) __attribute__ ((__nothrow__ , __leaf__));
extern int fclose (FILE *__stream);
extern FILE *tmpfile (void)
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
extern FILE *tmpfile64 (void)
   __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
extern char *tmpnam (char[20]) __attribute__ ((__nothrow__ , __leaf__)) ;
extern char *tmpnam_r (char __s[20]) __attribute__ ((__nothrow__ , __leaf__)) ;
extern char *tempnam (const char *__dir, const char *__pfx)
   __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (__builtin_free, 1)));
extern int fflush (FILE *__stream);
extern int fflush_unlocked (FILE *__stream);
extern int fcloseall (void);
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes)
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes)
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (fclose, 1))) ;
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));
extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);
extern int printf (const char *__restrict __format, ...);
extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));
extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);
extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);
extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));
extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));
extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));
extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));
extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;
extern int scanf (const char *__restrict __format, ...) ;
extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf") ;
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf") ;
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__));
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__format__ (__scanf__, 2, 0)));
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);
extern int getchar (void);
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
extern int fgetc_unlocked (FILE *__stream);
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);
extern int putchar (int __c);
extern int fputc_unlocked (int __c, FILE *__stream);
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);
extern int getw (FILE *__stream);
extern int putw (int __w, FILE *__stream);
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     __attribute__ ((__access__ (__write_only__, 1, 2)));
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream)
    __attribute__ ((__access__ (__write_only__, 1, 2)));
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) ;
extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) ;
extern int fputs (const char *__restrict __s, FILE *__restrict __stream);
extern int puts (const char *__s);
extern int ungetc (int __c, FILE *__stream);
extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);
extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);
extern int fseek (FILE *__stream, long int __off, int __whence);
extern long int ftell (FILE *__stream) ;
extern void rewind (FILE *__stream);
extern int fseeko (FILE *__stream, __off_t __off, int __whence);
extern __off_t ftello (FILE *__stream) ;
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);
extern int fsetpos (FILE *__stream, const fpos_t *__pos);
extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void perror (const char *__s);
extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int pclose (FILE *__stream);
extern FILE *popen (const char *__command, const char *__modes)
  __attribute__ ((__malloc__)) __attribute__ ((__malloc__ (pclose, 1))) ;
extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__access__ (__write_only__, 1)));
extern char *cuserid (char *__s)
  __attribute__ ((__access__ (__write_only__, 1)));
struct obstack;
extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0)));
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);


typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
typedef __loff_t loff_t;
typedef __ino_t ino_t;
typedef __ino64_t ino64_t;
typedef __dev_t dev_t;
typedef __gid_t gid_t;
typedef __mode_t mode_t;
typedef __nlink_t nlink_t;
typedef __uid_t uid_t;
typedef __pid_t pid_t;
typedef __id_t id_t;
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
typedef __key_t key_t;
typedef __clock_t clock_t;
typedef __clockid_t clockid_t;
typedef __time_t time_t;
typedef __timer_t timer_t;
typedef __useconds_t useconds_t;
typedef __suseconds_t suseconds_t;
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
typedef __uint8_t u_int8_t;
typedef __uint16_t u_int16_t;
typedef __uint32_t u_int32_t;
typedef __uint64_t u_int64_t;
typedef int register_t __attribute__ ((__mode__ (__word__)));
static __inline __uint16_t
__bswap_16 (__uint16_t __bsx)
{
  return __builtin_bswap16 (__bsx);
}
static __inline __uint32_t
__bswap_32 (__uint32_t __bsx)
{
  return __builtin_bswap32 (__bsx);
}
__extension__ static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}
static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}
static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}
typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
typedef __sigset_t sigset_t;
struct timeval
{
  __time_t tv_sec;
  __suseconds_t tv_usec;
};
struct timespec
{
  __time_t tv_sec;
  __syscall_slong_t tv_nsec;
};
typedef long int __fd_mask;
typedef struct
  {
    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];
  } fd_set;
typedef __fd_mask fd_mask;

extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);

typedef __blksize_t blksize_t;
typedef __blkcnt_t blkcnt_t;
typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;
typedef union
{
  __extension__ unsigned long long int __value64;
  struct
  {
    unsigned int __low;
    unsigned int __high;
  } __value32;
} __atomic_wide_counter;
typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;
struct __pthread_mutex_s
{
  int __lock;
  unsigned int __count;
  int __owner;
  unsigned int __nusers;
  int __kind;
  short __spins;
  short __elision;
  __pthread_list_t __list;
};
struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;
  int __cur_writer;
  int __shared;
  signed char __rwelision;
  unsigned char __pad1[7];
  unsigned long int __pad2;
  unsigned int __flags;
};
struct __pthread_cond_s
{
  __atomic_wide_counter __wseq;
  __atomic_wide_counter __g1_start;
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};
typedef unsigned int __tss_t;
typedef unsigned long int __thrd_t;
typedef struct
{
  int __data ;
} __once_flag;
typedef unsigned long int pthread_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;
typedef unsigned int pthread_key_t;
typedef int pthread_once_t;
union pthread_attr_t
{
  char __size[56];
  long int __align;
};
typedef union pthread_attr_t pthread_attr_t;
typedef union
{
  struct __pthread_mutex_s __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;
typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;
typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;
typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;
typedef volatile int pthread_spinlock_t;
typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;
typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;


struct stat
  {
    __dev_t st_dev;
    __ino_t st_ino;
    __nlink_t st_nlink;
    __mode_t st_mode;
    __uid_t st_uid;
    __gid_t st_gid;
    int __pad0;
    __dev_t st_rdev;
    __off_t st_size;
    __blksize_t st_blksize;
    __blkcnt_t st_blocks;
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
    __syscall_slong_t __glibc_reserved[3];
  };
struct stat64
  {
    __dev_t st_dev;
    __ino64_t st_ino;
    __nlink_t st_nlink;
    __mode_t st_mode;
    __uid_t st_uid;
    __gid_t st_gid;
    int __pad0;
    __dev_t st_rdev;
    __off_t st_size;
    __blksize_t st_blksize;
    __blkcnt64_t st_blocks;
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
    __syscall_slong_t __glibc_reserved[3];
  };
extern int stat (const char *__restrict __file,
   struct stat *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int fstat (int __fd, struct stat *__buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int stat64 (const char *__restrict __file,
     struct stat64 *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int fstat64 (int __fd, struct stat64 *__buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int fstatat (int __fd, const char *__restrict __file,
      struct stat *__restrict __buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int fstatat64 (int __fd, const char *__restrict __file,
        struct stat64 *__restrict __buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int lstat (const char *__restrict __file,
    struct stat *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int lstat64 (const char *__restrict __file,
      struct stat64 *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int chmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int lchmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int fchmod (int __fd, __mode_t __mode) __attribute__ ((__nothrow__ , __leaf__));
extern int fchmodat (int __fd, const char *__file, __mode_t __mode,
       int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;
extern __mode_t umask (__mode_t __mask) __attribute__ ((__nothrow__ , __leaf__));
extern __mode_t getumask (void) __attribute__ ((__nothrow__ , __leaf__));
extern int mkdir (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int mkdirat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int mknod (const char *__path, __mode_t __mode, __dev_t __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int mknodat (int __fd, const char *__path, __mode_t __mode,
      __dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int mkfifo (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int mkfifoat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int utimensat (int __fd, const char *__path,
        const struct timespec __times[2],
        int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int futimens (int __fd, const struct timespec __times[2]) __attribute__ ((__nothrow__ , __leaf__));
typedef __signed__ char __s8;
typedef unsigned char __u8;
typedef __signed__ short __s16;
typedef unsigned short __u16;
typedef __signed__ int __s32;
typedef unsigned int __u32;
__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;
typedef void (*__kernel_sighandler_t)(int);
typedef int __kernel_key_t;
typedef int __kernel_mqd_t;
typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;
typedef unsigned long __kernel_old_dev_t;
typedef long __kernel_long_t;
typedef unsigned long __kernel_ulong_t;
typedef __kernel_ulong_t __kernel_ino_t;
typedef unsigned int __kernel_mode_t;
typedef int __kernel_pid_t;
typedef int __kernel_ipc_pid_t;
typedef unsigned int __kernel_uid_t;
typedef unsigned int __kernel_gid_t;
typedef __kernel_long_t __kernel_suseconds_t;
typedef int __kernel_daddr_t;
typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
typedef __kernel_ulong_t __kernel_size_t;
typedef __kernel_long_t __kernel_ssize_t;
typedef __kernel_long_t __kernel_ptrdiff_t;
typedef struct {
 int val[2];
} __kernel_fsid_t;
typedef __kernel_long_t __kernel_off_t;
typedef long long __kernel_loff_t;
typedef __kernel_long_t __kernel_old_time_t;
typedef __kernel_long_t __kernel_time_t;
typedef long long __kernel_time64_t;
typedef __kernel_long_t __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;
typedef __u16 __sum16;
typedef __u32 __wsum;
typedef unsigned __poll_t;
struct statx_timestamp {
 __s64 tv_sec;
 __u32 tv_nsec;
 __s32 __reserved;
};
struct statx {
 __u32 stx_mask;
 __u32 stx_blksize;
 __u64 stx_attributes;
 __u32 stx_nlink;
 __u32 stx_uid;
 __u32 stx_gid;
 __u16 stx_mode;
 __u16 __spare0[1];
 __u64 stx_ino;
 __u64 stx_size;
 __u64 stx_blocks;
 __u64 stx_attributes_mask;
 struct statx_timestamp stx_atime;
 struct statx_timestamp stx_btime;
 struct statx_timestamp stx_ctime;
 struct statx_timestamp stx_mtime;
 __u32 stx_rdev_major;
 __u32 stx_rdev_minor;
 __u32 stx_dev_major;
 __u32 stx_dev_minor;
 __u64 stx_mnt_id;
 __u64 __spare2;
 __u64 __spare3[12];
};

int statx (int __dirfd, const char *__restrict __path, int __flags,
           unsigned int __mask, struct statx *__restrict __buf)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 5)));


typedef int wchar_t;

typedef struct
  {
    int quot;
    int rem;
  } div_t;
typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;
__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;
extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern _Float32 strtof32 (const char *__restrict __nptr,
     char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern _Float64 strtof64 (const char *__restrict __nptr,
     char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern _Float128 strtof128 (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern _Float32x strtof32x (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern _Float64x strtof64x (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int strfromd (char *__dest, size_t __size, const char *__format,
       double __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int strfromf (char *__dest, size_t __size, const char *__format,
       float __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int strfroml (char *__dest, size_t __size, const char *__format,
       long double __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int strfromf32 (char *__dest, size_t __size, const char * __format,
         _Float32 __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int strfromf64 (char *__dest, size_t __size, const char * __format,
         _Float64 __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int strfromf128 (char *__dest, size_t __size, const char * __format,
   _Float128 __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int strfromf32x (char *__dest, size_t __size, const char * __format,
   _Float32x __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int strfromf64x (char *__dest, size_t __size, const char * __format,
   _Float64x __f)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
struct __locale_struct
{
  struct __locale_data *__locales[13];
  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;
  const char *__names[13];
};
typedef struct __locale_struct *__locale_t;
typedef __locale_t locale_t;
extern long int strtol_l (const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     locale_t __loc) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));
extern unsigned long int strtoul_l (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));
__extension__
extern long long int strtoll_l (const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));
__extension__
extern unsigned long long int strtoull_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4)));
extern double strtod_l (const char *__restrict __nptr,
   char **__restrict __endptr, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
extern float strtof_l (const char *__restrict __nptr,
         char **__restrict __endptr, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
extern long double strtold_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
extern _Float32 strtof32_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
extern _Float64 strtof64_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
extern _Float128 strtof128_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
extern _Float32x strtof32x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
extern _Float64x strtof64x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) ;
extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));
extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));
extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };
extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));
extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));
extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));
extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));
extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;
  };
extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__))
     __attribute__ ((__alloc_size__ (1))) ;
extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (1, 2))) ;
extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__)) __attribute__ ((__alloc_size__ (2)));
extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));
extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__))
     __attribute__ ((__alloc_size__ (2, 3)))
    __attribute__ ((__malloc__ (__builtin_free, 1)));
extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__ (reallocarray, 1)));

extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));

extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__))
     __attribute__ ((__alloc_size__ (1))) ;
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_align__ (1)))
     __attribute__ ((__alloc_size__ (2))) ;
extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern char *secure_getenv (const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int mkostemp (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
extern int system (const char *__command) ;
extern char *canonicalize_file_name (const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__malloc__))
     __attribute__ ((__malloc__ (__builtin_free, 1))) ;
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) ;
typedef int (*__compar_fn_t) (const void *, const void *);
typedef __compar_fn_t comparison_fn_t;
typedef int (*__compar_d_fn_t) (const void *, const void *, void *);
extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;
extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;
extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;
extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));
extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__))
    __attribute__ ((__access__ (__read_only__, 2)));
extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__access__ (__write_only__, 1, 3)))
  __attribute__ ((__access__ (__read_only__, 2)));
extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;
extern int posix_openpt (int __oflag) ;
extern int grantpt (int __fd) __attribute__ ((__nothrow__ , __leaf__));
extern int unlockpt (int __fd) __attribute__ ((__nothrow__ , __leaf__));
extern char *ptsname (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__access__ (__write_only__, 2, 3)));
extern int getpt (void);
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

typedef long int ptrdiff_t;
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
} max_align_t;

extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__access__ (__write_only__, 1, 4)));
extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int __memcmpeq (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern void *rawmemchr (const void *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern void *memrchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)))
      __attribute__ ((__access__ (__read_only__, 1, 3)));
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__access__ (__write_only__, 1, 3)));
extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)))
     __attribute__ ((__access__ (__write_only__, 1, 3)));
extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strchrnul (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern char *strcasestr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)))
    __attribute__ ((__access__ (__read_only__, 1, 2)))
    __attribute__ ((__access__ (__read_only__, 3, 4)));
extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) __attribute__ ((__access__ (__write_only__, 2, 3)));
extern const char *strerrordesc_np (int __err) __attribute__ ((__nothrow__ , __leaf__));
extern const char *strerrorname_np (int __err) __attribute__ ((__nothrow__ , __leaf__));
extern char *strerror_l (int __errnum, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));

extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void bcopy (const void *__src, void *__dest, size_t __n)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int ffsl (long int __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));

extern void explicit_bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)))
    __attribute__ ((__access__ (__write_only__, 1, 2)));
extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));
extern const char *sigabbrev_np (int __sig) __attribute__ ((__nothrow__ , __leaf__));
extern const char *sigdescr_np (int __sig) __attribute__ ((__nothrow__ , __leaf__));
extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strverscmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strfry (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void *memfrob (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)))
    __attribute__ ((__access__ (__read_write__, 1, 2)));
extern char *basename (const char *__filename) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;
typedef __int_least8_t int_least8_t;
typedef __int_least16_t int_least16_t;
typedef __int_least32_t int_least32_t;
typedef __int_least64_t int_least64_t;
typedef __uint_least8_t uint_least8_t;
typedef __uint_least16_t uint_least16_t;
typedef __uint_least32_t uint_least32_t;
typedef __uint_least64_t uint_least64_t;
typedef signed char int_fast8_t;
typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
typedef unsigned char uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
typedef long int intptr_t;
typedef unsigned long int uintptr_t;
typedef __intmax_t intmax_t;
typedef __uintmax_t uintmax_t;
typedef int __gwchar_t;

typedef struct
  {
    long int quot;
    long int rem;
  } imaxdiv_t;
extern intmax_t imaxabs (intmax_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern imaxdiv_t imaxdiv (intmax_t __numer, intmax_t __denom)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern intmax_t strtoimax (const char *__restrict __nptr,
      char **__restrict __endptr, int __base) __attribute__ ((__nothrow__ , __leaf__));
extern uintmax_t strtoumax (const char *__restrict __nptr,
       char ** __restrict __endptr, int __base) __attribute__ ((__nothrow__ , __leaf__));
extern intmax_t wcstoimax (const __gwchar_t *__restrict __nptr,
      __gwchar_t **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__));
extern uintmax_t wcstoumax (const __gwchar_t *__restrict __nptr,
       __gwchar_t ** __restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__));


typedef __socklen_t socklen_t;
extern int access (const char *__name, int __type) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int euidaccess (const char *__name, int __type)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int eaccess (const char *__name, int __type)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int execveat (int __fd, const char *__path, char *const __argv[],
                     char *const __envp[], int __flags)
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;
extern __off_t lseek (int __fd, __off_t __offset, int __whence) __attribute__ ((__nothrow__ , __leaf__));
extern __off64_t lseek64 (int __fd, __off64_t __offset, int __whence)
     __attribute__ ((__nothrow__ , __leaf__));
extern int close (int __fd);
extern void closefrom (int __lowfd) __attribute__ ((__nothrow__ , __leaf__));
extern ssize_t read (int __fd, void *__buf, size_t __nbytes)
    __attribute__ ((__access__ (__write_only__, 2, 3)));
extern ssize_t write (int __fd, const void *__buf, size_t __n)
    __attribute__ ((__access__ (__read_only__, 2, 3)));
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,
        __off_t __offset)
    __attribute__ ((__access__ (__write_only__, 2, 3)));
extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
         __off_t __offset)
    __attribute__ ((__access__ (__read_only__, 2, 3)));
extern ssize_t pread64 (int __fd, void *__buf, size_t __nbytes,
   __off64_t __offset)
    __attribute__ ((__access__ (__write_only__, 2, 3)));
extern ssize_t pwrite64 (int __fd, const void *__buf, size_t __n,
    __off64_t __offset)
    __attribute__ ((__access__ (__read_only__, 2, 3)));
extern int pipe (int __pipedes[2]) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int pipe2 (int __pipedes[2], int __flags) __attribute__ ((__nothrow__ , __leaf__)) ;
extern unsigned int alarm (unsigned int __seconds) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned int sleep (unsigned int __seconds);
extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     __attribute__ ((__nothrow__ , __leaf__));
extern int usleep (__useconds_t __useconds);
extern int pause (void);
extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int fchown (int __fd, __uid_t __owner, __gid_t __group) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int fchownat (int __fd, const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;
extern int chdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int fchdir (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;
extern char *getcwd (char *__buf, size_t __size) __attribute__ ((__nothrow__ , __leaf__)) ;
extern char *get_current_dir_name (void) __attribute__ ((__nothrow__ , __leaf__));
extern char *getwd (char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__))
    __attribute__ ((__access__ (__write_only__, 1)));
extern int dup (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int dup2 (int __fd, int __fd2) __attribute__ ((__nothrow__ , __leaf__));
extern int dup3 (int __fd, int __fd2, int __flags) __attribute__ ((__nothrow__ , __leaf__));
extern char **__environ;
extern char **environ;
extern int execve (const char *__path, char *const __argv[],
     char *const __envp[]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int execv (const char *__path, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int execle (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int execl (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int execvp (const char *__file, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int execlp (const char *__file, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int execvpe (const char *__file, char *const __argv[],
      char *const __envp[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nice (int __inc) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void _exit (int __status) __attribute__ ((__noreturn__));
enum
  {
    _PC_LINK_MAX,
    _PC_MAX_CANON,
    _PC_MAX_INPUT,
    _PC_NAME_MAX,
    _PC_PATH_MAX,
    _PC_PIPE_BUF,
    _PC_CHOWN_RESTRICTED,
    _PC_NO_TRUNC,
    _PC_VDISABLE,
    _PC_SYNC_IO,
    _PC_ASYNC_IO,
    _PC_PRIO_IO,
    _PC_SOCK_MAXBUF,
    _PC_FILESIZEBITS,
    _PC_REC_INCR_XFER_SIZE,
    _PC_REC_MAX_XFER_SIZE,
    _PC_REC_MIN_XFER_SIZE,
    _PC_REC_XFER_ALIGN,
    _PC_ALLOC_SIZE_MIN,
    _PC_SYMLINK_MAX,
    _PC_2_SYMLINKS
  };
enum
  {
    _SC_ARG_MAX,
    _SC_CHILD_MAX,
    _SC_CLK_TCK,
    _SC_NGROUPS_MAX,
    _SC_OPEN_MAX,
    _SC_STREAM_MAX,
    _SC_TZNAME_MAX,
    _SC_JOB_CONTROL,
    _SC_SAVED_IDS,
    _SC_REALTIME_SIGNALS,
    _SC_PRIORITY_SCHEDULING,
    _SC_TIMERS,
    _SC_ASYNCHRONOUS_IO,
    _SC_PRIORITIZED_IO,
    _SC_SYNCHRONIZED_IO,
    _SC_FSYNC,
    _SC_MAPPED_FILES,
    _SC_MEMLOCK,
    _SC_MEMLOCK_RANGE,
    _SC_MEMORY_PROTECTION,
    _SC_MESSAGE_PASSING,
    _SC_SEMAPHORES,
    _SC_SHARED_MEMORY_OBJECTS,
    _SC_AIO_LISTIO_MAX,
    _SC_AIO_MAX,
    _SC_AIO_PRIO_DELTA_MAX,
    _SC_DELAYTIMER_MAX,
    _SC_MQ_OPEN_MAX,
    _SC_MQ_PRIO_MAX,
    _SC_VERSION,
    _SC_PAGESIZE,
    _SC_RTSIG_MAX,
    _SC_SEM_NSEMS_MAX,
    _SC_SEM_VALUE_MAX,
    _SC_SIGQUEUE_MAX,
    _SC_TIMER_MAX,
    _SC_BC_BASE_MAX,
    _SC_BC_DIM_MAX,
    _SC_BC_SCALE_MAX,
    _SC_BC_STRING_MAX,
    _SC_COLL_WEIGHTS_MAX,
    _SC_EQUIV_CLASS_MAX,
    _SC_EXPR_NEST_MAX,
    _SC_LINE_MAX,
    _SC_RE_DUP_MAX,
    _SC_CHARCLASS_NAME_MAX,
    _SC_2_VERSION,
    _SC_2_C_BIND,
    _SC_2_C_DEV,
    _SC_2_FORT_DEV,
    _SC_2_FORT_RUN,
    _SC_2_SW_DEV,
    _SC_2_LOCALEDEF,
    _SC_PII,
    _SC_PII_XTI,
    _SC_PII_SOCKET,
    _SC_PII_INTERNET,
    _SC_PII_OSI,
    _SC_POLL,
    _SC_SELECT,
    _SC_UIO_MAXIOV,
    _SC_IOV_MAX = _SC_UIO_MAXIOV,
    _SC_PII_INTERNET_STREAM,
    _SC_PII_INTERNET_DGRAM,
    _SC_PII_OSI_COTS,
    _SC_PII_OSI_CLTS,
    _SC_PII_OSI_M,
    _SC_T_IOV_MAX,
    _SC_THREADS,
    _SC_THREAD_SAFE_FUNCTIONS,
    _SC_GETGR_R_SIZE_MAX,
    _SC_GETPW_R_SIZE_MAX,
    _SC_LOGIN_NAME_MAX,
    _SC_TTY_NAME_MAX,
    _SC_THREAD_DESTRUCTOR_ITERATIONS,
    _SC_THREAD_KEYS_MAX,
    _SC_THREAD_STACK_MIN,
    _SC_THREAD_THREADS_MAX,
    _SC_THREAD_ATTR_STACKADDR,
    _SC_THREAD_ATTR_STACKSIZE,
    _SC_THREAD_PRIORITY_SCHEDULING,
    _SC_THREAD_PRIO_INHERIT,
    _SC_THREAD_PRIO_PROTECT,
    _SC_THREAD_PROCESS_SHARED,
    _SC_NPROCESSORS_CONF,
    _SC_NPROCESSORS_ONLN,
    _SC_PHYS_PAGES,
    _SC_AVPHYS_PAGES,
    _SC_ATEXIT_MAX,
    _SC_PASS_MAX,
    _SC_XOPEN_VERSION,
    _SC_XOPEN_XCU_VERSION,
    _SC_XOPEN_UNIX,
    _SC_XOPEN_CRYPT,
    _SC_XOPEN_ENH_I18N,
    _SC_XOPEN_SHM,
    _SC_2_CHAR_TERM,
    _SC_2_C_VERSION,
    _SC_2_UPE,
    _SC_XOPEN_XPG2,
    _SC_XOPEN_XPG3,
    _SC_XOPEN_XPG4,
    _SC_CHAR_BIT,
    _SC_CHAR_MAX,
    _SC_CHAR_MIN,
    _SC_INT_MAX,
    _SC_INT_MIN,
    _SC_LONG_BIT,
    _SC_WORD_BIT,
    _SC_MB_LEN_MAX,
    _SC_NZERO,
    _SC_SSIZE_MAX,
    _SC_SCHAR_MAX,
    _SC_SCHAR_MIN,
    _SC_SHRT_MAX,
    _SC_SHRT_MIN,
    _SC_UCHAR_MAX,
    _SC_UINT_MAX,
    _SC_ULONG_MAX,
    _SC_USHRT_MAX,
    _SC_NL_ARGMAX,
    _SC_NL_LANGMAX,
    _SC_NL_MSGMAX,
    _SC_NL_NMAX,
    _SC_NL_SETMAX,
    _SC_NL_TEXTMAX,
    _SC_XBS5_ILP32_OFF32,
    _SC_XBS5_ILP32_OFFBIG,
    _SC_XBS5_LP64_OFF64,
    _SC_XBS5_LPBIG_OFFBIG,
    _SC_XOPEN_LEGACY,
    _SC_XOPEN_REALTIME,
    _SC_XOPEN_REALTIME_THREADS,
    _SC_ADVISORY_INFO,
    _SC_BARRIERS,
    _SC_BASE,
    _SC_C_LANG_SUPPORT,
    _SC_C_LANG_SUPPORT_R,
    _SC_CLOCK_SELECTION,
    _SC_CPUTIME,
    _SC_THREAD_CPUTIME,
    _SC_DEVICE_IO,
    _SC_DEVICE_SPECIFIC,
    _SC_DEVICE_SPECIFIC_R,
    _SC_FD_MGMT,
    _SC_FIFO,
    _SC_PIPE,
    _SC_FILE_ATTRIBUTES,
    _SC_FILE_LOCKING,
    _SC_FILE_SYSTEM,
    _SC_MONOTONIC_CLOCK,
    _SC_MULTI_PROCESS,
    _SC_SINGLE_PROCESS,
    _SC_NETWORKING,
    _SC_READER_WRITER_LOCKS,
    _SC_SPIN_LOCKS,
    _SC_REGEXP,
    _SC_REGEX_VERSION,
    _SC_SHELL,
    _SC_SIGNALS,
    _SC_SPAWN,
    _SC_SPORADIC_SERVER,
    _SC_THREAD_SPORADIC_SERVER,
    _SC_SYSTEM_DATABASE,
    _SC_SYSTEM_DATABASE_R,
    _SC_TIMEOUTS,
    _SC_TYPED_MEMORY_OBJECTS,
    _SC_USER_GROUPS,
    _SC_USER_GROUPS_R,
    _SC_2_PBS,
    _SC_2_PBS_ACCOUNTING,
    _SC_2_PBS_LOCATE,
    _SC_2_PBS_MESSAGE,
    _SC_2_PBS_TRACK,
    _SC_SYMLOOP_MAX,
    _SC_STREAMS,
    _SC_2_PBS_CHECKPOINT,
    _SC_V6_ILP32_OFF32,
    _SC_V6_ILP32_OFFBIG,
    _SC_V6_LP64_OFF64,
    _SC_V6_LPBIG_OFFBIG,
    _SC_HOST_NAME_MAX,
    _SC_TRACE,
    _SC_TRACE_EVENT_FILTER,
    _SC_TRACE_INHERIT,
    _SC_TRACE_LOG,
    _SC_LEVEL1_ICACHE_SIZE,
    _SC_LEVEL1_ICACHE_ASSOC,
    _SC_LEVEL1_ICACHE_LINESIZE,
    _SC_LEVEL1_DCACHE_SIZE,
    _SC_LEVEL1_DCACHE_ASSOC,
    _SC_LEVEL1_DCACHE_LINESIZE,
    _SC_LEVEL2_CACHE_SIZE,
    _SC_LEVEL2_CACHE_ASSOC,
    _SC_LEVEL2_CACHE_LINESIZE,
    _SC_LEVEL3_CACHE_SIZE,
    _SC_LEVEL3_CACHE_ASSOC,
    _SC_LEVEL3_CACHE_LINESIZE,
    _SC_LEVEL4_CACHE_SIZE,
    _SC_LEVEL4_CACHE_ASSOC,
    _SC_LEVEL4_CACHE_LINESIZE,
    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,
    _SC_RAW_SOCKETS,
    _SC_V7_ILP32_OFF32,
    _SC_V7_ILP32_OFFBIG,
    _SC_V7_LP64_OFF64,
    _SC_V7_LPBIG_OFFBIG,
    _SC_SS_REPL_MAX,
    _SC_TRACE_EVENT_NAME_MAX,
    _SC_TRACE_NAME_MAX,
    _SC_TRACE_SYS_MAX,
    _SC_TRACE_USER_EVENT_MAX,
    _SC_XOPEN_STREAMS,
    _SC_THREAD_ROBUST_PRIO_INHERIT,
    _SC_THREAD_ROBUST_PRIO_PROTECT,
    _SC_MINSIGSTKSZ,
    _SC_SIGSTKSZ
  };
enum
  {
    _CS_PATH,
    _CS_V6_WIDTH_RESTRICTED_ENVS,
    _CS_GNU_LIBC_VERSION,
    _CS_GNU_LIBPTHREAD_VERSION,
    _CS_V5_WIDTH_RESTRICTED_ENVS,
    _CS_V7_WIDTH_RESTRICTED_ENVS,
    _CS_LFS_CFLAGS = 1000,
    _CS_LFS_LDFLAGS,
    _CS_LFS_LIBS,
    _CS_LFS_LINTFLAGS,
    _CS_LFS64_CFLAGS,
    _CS_LFS64_LDFLAGS,
    _CS_LFS64_LIBS,
    _CS_LFS64_LINTFLAGS,
    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,
    _CS_XBS5_ILP32_OFF32_LDFLAGS,
    _CS_XBS5_ILP32_OFF32_LIBS,
    _CS_XBS5_ILP32_OFF32_LINTFLAGS,
    _CS_XBS5_ILP32_OFFBIG_CFLAGS,
    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,
    _CS_XBS5_ILP32_OFFBIG_LIBS,
    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,
    _CS_XBS5_LP64_OFF64_CFLAGS,
    _CS_XBS5_LP64_OFF64_LDFLAGS,
    _CS_XBS5_LP64_OFF64_LIBS,
    _CS_XBS5_LP64_OFF64_LINTFLAGS,
    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,
    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,
    _CS_XBS5_LPBIG_OFFBIG_LIBS,
    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,
    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,
    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,
    _CS_POSIX_V6_ILP32_OFF32_LIBS,
    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,
    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,
    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,
    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,
    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,
    _CS_POSIX_V6_LP64_OFF64_CFLAGS,
    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,
    _CS_POSIX_V6_LP64_OFF64_LIBS,
    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,
    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,
    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,
    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,
    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,
    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,
    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,
    _CS_POSIX_V7_ILP32_OFF32_LIBS,
    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,
    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,
    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,
    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,
    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,
    _CS_POSIX_V7_LP64_OFF64_CFLAGS,
    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,
    _CS_POSIX_V7_LP64_OFF64_LIBS,
    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,
    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,
    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,
    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,
    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,
    _CS_V6_ENV,
    _CS_V7_ENV
  };
extern long int pathconf (const char *__path, int __name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long int fpathconf (int __fd, int __name) __attribute__ ((__nothrow__ , __leaf__));
extern long int sysconf (int __name) __attribute__ ((__nothrow__ , __leaf__));
extern size_t confstr (int __name, char *__buf, size_t __len) __attribute__ ((__nothrow__ , __leaf__))
    __attribute__ ((__access__ (__write_only__, 2, 3)));
extern __pid_t getpid (void) __attribute__ ((__nothrow__ , __leaf__));
extern __pid_t getppid (void) __attribute__ ((__nothrow__ , __leaf__));
extern __pid_t getpgrp (void) __attribute__ ((__nothrow__ , __leaf__));
extern __pid_t __getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));
extern __pid_t getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));
extern int setpgid (__pid_t __pid, __pid_t __pgid) __attribute__ ((__nothrow__ , __leaf__));
extern int setpgrp (void) __attribute__ ((__nothrow__ , __leaf__));
extern __pid_t setsid (void) __attribute__ ((__nothrow__ , __leaf__));
extern __pid_t getsid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));
extern __uid_t getuid (void) __attribute__ ((__nothrow__ , __leaf__));
extern __uid_t geteuid (void) __attribute__ ((__nothrow__ , __leaf__));
extern __gid_t getgid (void) __attribute__ ((__nothrow__ , __leaf__));
extern __gid_t getegid (void) __attribute__ ((__nothrow__ , __leaf__));
extern int getgroups (int __size, __gid_t __list[]) __attribute__ ((__nothrow__ , __leaf__))
    __attribute__ ((__access__ (__write_only__, 2, 1)));
extern int group_member (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__));
extern int setuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int setreuid (__uid_t __ruid, __uid_t __euid) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int seteuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int setgid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int setregid (__gid_t __rgid, __gid_t __egid) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int setegid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int getresuid (__uid_t *__ruid, __uid_t *__euid, __uid_t *__suid)
     __attribute__ ((__nothrow__ , __leaf__));
extern int getresgid (__gid_t *__rgid, __gid_t *__egid, __gid_t *__sgid)
     __attribute__ ((__nothrow__ , __leaf__));
extern int setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid)
     __attribute__ ((__nothrow__ , __leaf__)) ;
extern int setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid)
     __attribute__ ((__nothrow__ , __leaf__)) ;
extern __pid_t fork (void) __attribute__ ((__nothrow__));
extern __pid_t vfork (void) __attribute__ ((__nothrow__ , __leaf__));
extern __pid_t _Fork (void) __attribute__ ((__nothrow__ , __leaf__));
extern char *ttyname (int __fd) __attribute__ ((__nothrow__ , __leaf__));
extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)))
     __attribute__ ((__access__ (__write_only__, 2, 3)));
extern int isatty (int __fd) __attribute__ ((__nothrow__ , __leaf__));
extern int ttyslot (void) __attribute__ ((__nothrow__ , __leaf__));
extern int link (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;
extern int linkat (int __fromfd, const char *__from, int __tofd,
     const char *__to, int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4))) ;
extern int symlink (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;
extern ssize_t readlink (const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)))
     __attribute__ ((__access__ (__write_only__, 2, 3)));
extern int symlinkat (const char *__from, int __tofd,
        const char *__to) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3))) ;
extern ssize_t readlinkat (int __fd, const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)))
     __attribute__ ((__access__ (__write_only__, 3, 4)));
extern int unlink (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int unlinkat (int __fd, const char *__name, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int rmdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern __pid_t tcgetpgrp (int __fd) __attribute__ ((__nothrow__ , __leaf__));
extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) __attribute__ ((__nothrow__ , __leaf__));
extern char *getlogin (void);
extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)))
    __attribute__ ((__access__ (__write_only__, 1, 2)));
extern int setlogin (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern char *optarg;
extern int optind;
extern int opterr;
extern int optopt;
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));



extern int gethostname (char *__name, size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)))
    __attribute__ ((__access__ (__write_only__, 1, 2)));
extern int sethostname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__access__ (__read_only__, 1, 2)));
extern int sethostid (long int __id) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int getdomainname (char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)))
     __attribute__ ((__access__ (__write_only__, 1, 2)));
extern int setdomainname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__access__ (__read_only__, 1, 2)));
extern int vhangup (void) __attribute__ ((__nothrow__ , __leaf__));
extern int revoke (const char *__file) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int acct (const char *__name) __attribute__ ((__nothrow__ , __leaf__));
extern char *getusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void endusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void setusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern int daemon (int __nochdir, int __noclose) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int chroot (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern char *getpass (const char *__prompt) __attribute__ ((__nonnull__ (1)));
extern int fsync (int __fd);
extern int syncfs (int __fd) __attribute__ ((__nothrow__ , __leaf__));
extern long int gethostid (void);
extern void sync (void) __attribute__ ((__nothrow__ , __leaf__));
extern int getpagesize (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int getdtablesize (void) __attribute__ ((__nothrow__ , __leaf__));
extern int truncate (const char *__file, __off_t __length)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int truncate64 (const char *__file, __off64_t __length)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int ftruncate (int __fd, __off_t __length) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ftruncate64 (int __fd, __off64_t __length) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int brk (void *__addr) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void *sbrk (intptr_t __delta) __attribute__ ((__nothrow__ , __leaf__));
extern long int syscall (long int __sysno, ...) __attribute__ ((__nothrow__ , __leaf__));
extern int lockf (int __fd, int __cmd, __off_t __len) ;
extern int lockf64 (int __fd, int __cmd, __off64_t __len) ;
ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
    int __outfd, __off64_t *__poutoff,
    size_t __length, unsigned int __flags);
extern int fdatasync (int __fildes);
extern char *crypt (const char *__key, const char *__salt)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void swab (const void *__restrict __from, void *__restrict __to,
    ssize_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)))
    __attribute__ ((__access__ (__read_only__, 1, 3)))
    __attribute__ ((__access__ (__write_only__, 2, 3)));
int getentropy (void *__buffer, size_t __length)
    __attribute__ ((__access__ (__write_only__, 1, 2)));
extern int close_range (unsigned int __fd, unsigned int __max_fd,
   int __flags) __attribute__ ((__nothrow__ , __leaf__));
extern __pid_t gettid (void) __attribute__ ((__nothrow__ , __leaf__));


#pragma GCC visibility push(default)

[[nodiscard]]
__attribute__((__malloc__))
__attribute__((__returns_nonnull__))
__attribute__((__alloc_size__ (1)))
void *ruby_xmalloc(size_t size)

;
[[nodiscard]]
__attribute__((__malloc__))
__attribute__((__returns_nonnull__))
__attribute__((__alloc_size__ (1,2)))
void *ruby_xmalloc2(size_t nelems, size_t elemsiz)

;
[[nodiscard]]
__attribute__((__malloc__))
__attribute__((__returns_nonnull__))
__attribute__((__alloc_size__ (1,2)))
void *ruby_xcalloc(size_t nelems, size_t elemsiz)

;
[[nodiscard]]
__attribute__((__returns_nonnull__))
__attribute__((__alloc_size__ (2)))
void *ruby_xrealloc(void *ptr, size_t newsiz)

;
[[nodiscard]]
__attribute__((__returns_nonnull__))
__attribute__((__alloc_size__ (2,3)))
void *ruby_xrealloc2(void *ptr, size_t newelems, size_t newsiz)

;
void ruby_xfree(void *ptr)

;

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__noreturn__))
__attribute__((__cold__))
void rb_assert_failure(const char *file, int line, const char *name, const char *expr);

#pragma GCC visibility pop


typedef float float_t;
typedef double double_t;
enum
  {
    FP_INT_UPWARD =
      0,
    FP_INT_DOWNWARD =
      1,
    FP_INT_TOWARDZERO =
      2,
    FP_INT_TONEARESTFROMZERO =
      3,
    FP_INT_TONEAREST =
      4,
  };
extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __iseqsig (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __issignaling (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
 extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern void sincos (double __x, double *__sinx, double *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincos (double __x, double *__sinx, double *__cosx) __attribute__ ((__nothrow__ , __leaf__));
 extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
 extern double exp10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp10 (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
 extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));
 extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
 extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));
extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));
extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double nextdown (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextdown (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double nextup (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nextup (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int llogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogb (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));
extern double roundeven (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __roundeven (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __intmax_t fromfp (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfp (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfp (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfp (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __intmax_t fromfpx (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpx (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpx (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpx (double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern int canonicalize (double *__cx, const double *__x) __attribute__ ((__nothrow__ , __leaf__));
extern double fmaxmag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmaxmag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fminmag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fminmag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmaximum (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmaximum (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fminimum (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fminimum (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmaximum_num (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmaximum_num (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fminimum_num (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fminimum_num (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmaximum_mag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmaximum_mag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fminimum_mag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fminimum_mag (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmaximum_mag_num (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmaximum_mag_num (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fminimum_mag_num (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fminimum_mag_num (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int totalorder (const double *__x, const double *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern int totalordermag (const double *__x, const double *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern double getpayload (const double *__x) __attribute__ ((__nothrow__ , __leaf__)); extern double __getpayload (const double *__x) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayload (double *__x, double __payload) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadsig (double *__x, double __payload) __attribute__ ((__nothrow__ , __leaf__));
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __iseqsigf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __issignalingf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
 extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern void sincosf (float __x, float *__sinx, float *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf (float __x, float *__sinx, float *__cosx) __attribute__ ((__nothrow__ , __leaf__));
 extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
 extern float exp10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp10f (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
 extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));
 extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
 extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern float nextdownf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextdownf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float nextupf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nextupf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int llogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));
extern float roundevenf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundevenf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __intmax_t fromfpf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __intmax_t fromfpxf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpxf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf (float __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern int canonicalizef (float *__cx, const float *__x) __attribute__ ((__nothrow__ , __leaf__));
extern float fmaxmagf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxmagf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fminmagf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminmagf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fmaximumf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaximumf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fminimumf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminimumf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fmaximum_numf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaximum_numf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fminimum_numf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminimum_numf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fmaximum_magf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaximum_magf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fminimum_magf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminimum_magf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fmaximum_mag_numf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaximum_mag_numf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fminimum_mag_numf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminimum_mag_numf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int totalorderf (const float *__x, const float *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern int totalordermagf (const float *__x, const float *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern float getpayloadf (const float *__x) __attribute__ ((__nothrow__ , __leaf__)); extern float __getpayloadf (const float *__x) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadf (float *__x, float __payload) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadsigf (float *__x, float __payload) __attribute__ ((__nothrow__ , __leaf__));
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __iseqsigl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __issignalingl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
 extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern void sincosl (long double __x, long double *__sinx, long double *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosl (long double __x, long double *__sinx, long double *__cosx) __attribute__ ((__nothrow__ , __leaf__));
 extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
 extern long double exp10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
 extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
 extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
 extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double nextdownl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextdownl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double nextupl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nextupl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int llogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));
extern long double roundevenl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundevenl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __intmax_t fromfpl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __intmax_t fromfpxl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpxl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxl (long double __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern int canonicalizel (long double *__cx, const long double *__x) __attribute__ ((__nothrow__ , __leaf__));
extern long double fmaxmagl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxmagl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fminmagl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminmagl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fmaximuml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaximuml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fminimuml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminimuml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fmaximum_numl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaximum_numl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fminimum_numl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminimum_numl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fmaximum_magl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaximum_magl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fminimum_magl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminimum_magl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fmaximum_mag_numl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaximum_mag_numl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fminimum_mag_numl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminimum_mag_numl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int totalorderl (const long double *__x, const long double *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern int totalordermagl (const long double *__x, const long double *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern long double getpayloadl (const long double *__x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __getpayloadl (const long double *__x) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadl (long double *__x, long double __payload) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadsigl (long double *__x, long double __payload) __attribute__ ((__nothrow__ , __leaf__));
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 acosf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __acosf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 asinf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __asinf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 atanf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __atanf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 atan2f32 (_Float32 __y, _Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __atan2f32 (_Float32 __y, _Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 cosf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __cosf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 sinf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __sinf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 tanf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __tanf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 coshf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __coshf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 sinhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __sinhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 tanhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __tanhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern void sincosf32 (_Float32 __x, _Float32 *__sinx, _Float32 *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf32 (_Float32 __x, _Float32 *__sinx, _Float32 *__cosx) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 acoshf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __acoshf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 asinhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __asinhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 atanhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __atanhf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 expf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __expf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 frexpf32 (_Float32 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __frexpf32 (_Float32 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 ldexpf32 (_Float32 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __ldexpf32 (_Float32 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 logf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __logf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 log10f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __log10f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 modff32 (_Float32 __x, _Float32 *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __modff32 (_Float32 __x, _Float32 *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
 extern _Float32 exp10f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __exp10f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 expm1f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __expm1f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 log1pf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __log1pf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 logbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __logbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 exp2f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __exp2f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 log2f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __log2f32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 powf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __powf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 sqrtf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __sqrtf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 hypotf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __hypotf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 cbrtf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __cbrtf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 ceilf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __ceilf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fabsf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fabsf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 floorf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __floorf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fmodf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __fmodf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 copysignf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __copysignf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 nanf32 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __nanf32 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 j0f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __j0f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 j1f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __j1f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 jnf32 (int, _Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __jnf32 (int, _Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 y0f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __y0f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 y1f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __y1f32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 ynf32 (int, _Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __ynf32 (int, _Float32) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 erff32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __erff32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32 erfcf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __erfcf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 lgammaf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __lgammaf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 tgammaf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __tgammaf32 (_Float32) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 lgammaf32_r (_Float32, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __lgammaf32_r (_Float32, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 rintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __rintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 nextafterf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __nextafterf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 nextdownf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __nextdownf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 nextupf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __nextupf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 remainderf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __remainderf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 scalbnf32 (_Float32 __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __scalbnf32 (_Float32 __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int llogbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 scalblnf32 (_Float32 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __scalblnf32 (_Float32 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 nearbyintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __nearbyintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 roundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __roundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 truncf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __truncf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 remquof32 (_Float32 __x, _Float32 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __remquof32 (_Float32 __x, _Float32 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 fdimf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __fdimf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 fmaxf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fmaxf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fminf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fminf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fmaf32 (_Float32 __x, _Float32 __y, _Float32 __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __fmaf32 (_Float32 __x, _Float32 __y, _Float32 __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 roundevenf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __roundevenf32 (_Float32 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __intmax_t fromfpf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __intmax_t fromfpxf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpxf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf32 (_Float32 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern int canonicalizef32 (_Float32 *__cx, const _Float32 *__x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 fmaxmagf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fmaxmagf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fminmagf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fminmagf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fmaximumf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fmaximumf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fminimumf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fminimumf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fmaximum_numf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fmaximum_numf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fminimum_numf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fminimum_numf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fmaximum_magf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fmaximum_magf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fminimum_magf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fminimum_magf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fmaximum_mag_numf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fmaximum_mag_numf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32 fminimum_mag_numf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32 __fminimum_mag_numf32 (_Float32 __x, _Float32 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int totalorderf32 (const _Float32 *__x, const _Float32 *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern int totalordermagf32 (const _Float32 *__x, const _Float32 *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern _Float32 getpayloadf32 (const _Float32 *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32 __getpayloadf32 (const _Float32 *__x) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadf32 (_Float32 *__x, _Float32 __payload) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadsigf32 (_Float32 *__x, _Float32 __payload) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 acosf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __acosf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 asinf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __asinf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 atanf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __atanf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 atan2f64 (_Float64 __y, _Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __atan2f64 (_Float64 __y, _Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 cosf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __cosf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 sinf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __sinf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 tanf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __tanf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 coshf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __coshf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 sinhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __sinhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 tanhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __tanhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern void sincosf64 (_Float64 __x, _Float64 *__sinx, _Float64 *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf64 (_Float64 __x, _Float64 *__sinx, _Float64 *__cosx) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 acoshf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __acoshf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 asinhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __asinhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 atanhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __atanhf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 expf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __expf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 frexpf64 (_Float64 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __frexpf64 (_Float64 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 ldexpf64 (_Float64 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __ldexpf64 (_Float64 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 logf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __logf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 log10f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __log10f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 modff64 (_Float64 __x, _Float64 *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __modff64 (_Float64 __x, _Float64 *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
 extern _Float64 exp10f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __exp10f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 expm1f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __expm1f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 log1pf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __log1pf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 logbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __logbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 exp2f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __exp2f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 log2f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __log2f64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 powf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __powf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 sqrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __sqrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 hypotf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __hypotf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 cbrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __cbrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 ceilf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __ceilf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fabsf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fabsf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 floorf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __floorf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fmodf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __fmodf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 copysignf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __copysignf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 nanf64 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __nanf64 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 j0f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __j0f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 j1f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __j1f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 jnf64 (int, _Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __jnf64 (int, _Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 y0f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __y0f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 y1f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __y1f64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 ynf64 (int, _Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __ynf64 (int, _Float64) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 erff64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __erff64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64 erfcf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __erfcf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 lgammaf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __lgammaf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 tgammaf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __tgammaf64 (_Float64) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 lgammaf64_r (_Float64, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __lgammaf64_r (_Float64, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 rintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __rintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 nextafterf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __nextafterf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 nextdownf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __nextdownf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 nextupf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __nextupf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 remainderf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __remainderf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 scalbnf64 (_Float64 __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __scalbnf64 (_Float64 __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int llogbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 scalblnf64 (_Float64 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __scalblnf64 (_Float64 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 nearbyintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __nearbyintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 roundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __roundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 truncf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __truncf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 remquof64 (_Float64 __x, _Float64 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __remquof64 (_Float64 __x, _Float64 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 fdimf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __fdimf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 fmaxf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fmaxf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fminf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fminf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fmaf64 (_Float64 __x, _Float64 __y, _Float64 __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __fmaf64 (_Float64 __x, _Float64 __y, _Float64 __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 roundevenf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __roundevenf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __intmax_t fromfpf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __intmax_t fromfpxf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpxf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf64 (_Float64 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern int canonicalizef64 (_Float64 *__cx, const _Float64 *__x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 fmaxmagf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fmaxmagf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fminmagf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fminmagf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fmaximumf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fmaximumf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fminimumf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fminimumf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fmaximum_numf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fmaximum_numf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fminimum_numf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fminimum_numf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fmaximum_magf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fmaximum_magf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fminimum_magf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fminimum_magf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fmaximum_mag_numf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fmaximum_mag_numf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64 fminimum_mag_numf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64 __fminimum_mag_numf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int totalorderf64 (const _Float64 *__x, const _Float64 *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern int totalordermagf64 (const _Float64 *__x, const _Float64 *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern _Float64 getpayloadf64 (const _Float64 *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64 __getpayloadf64 (const _Float64 *__x) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadf64 (_Float64 *__x, _Float64 __payload) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadsigf64 (_Float64 *__x, _Float64 __payload) __attribute__ ((__nothrow__ , __leaf__));
extern int __fpclassifyf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __signbitf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
extern int __isinff128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __finitef128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __isnanf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
  __attribute__ ((__const__));
extern int __iseqsigf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __issignalingf128 (_Float128 __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));
 extern _Float128 acosf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __acosf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 asinf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __asinf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 atanf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __atanf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 atan2f128 (_Float128 __y, _Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __atan2f128 (_Float128 __y, _Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 cosf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __cosf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 sinf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __sinf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 tanf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __tanf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 coshf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __coshf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 sinhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __sinhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 tanhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __tanhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern void sincosf128 (_Float128 __x, _Float128 *__sinx, _Float128 *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf128 (_Float128 __x, _Float128 *__sinx, _Float128 *__cosx) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 acoshf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __acoshf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 asinhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __asinhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 atanhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __atanhf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 expf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __expf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 frexpf128 (_Float128 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __frexpf128 (_Float128 __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 ldexpf128 (_Float128 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __ldexpf128 (_Float128 __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 logf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __logf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 log10f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __log10f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 modff128 (_Float128 __x, _Float128 *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __modff128 (_Float128 __x, _Float128 *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
 extern _Float128 exp10f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __exp10f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 expm1f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __expm1f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 log1pf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __log1pf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 logbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __logbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 exp2f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __exp2f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 log2f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __log2f128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 powf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __powf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 sqrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __sqrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 hypotf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __hypotf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 cbrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __cbrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 ceilf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __ceilf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fabsf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fabsf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 floorf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __floorf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fmodf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __fmodf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 copysignf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __copysignf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 nanf128 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __nanf128 (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 j0f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __j0f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 j1f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __j1f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 jnf128 (int, _Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __jnf128 (int, _Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 y0f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __y0f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 y1f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __y1f128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 ynf128 (int, _Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __ynf128 (int, _Float128) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 erff128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __erff128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float128 erfcf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __erfcf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 lgammaf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __lgammaf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 tgammaf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __tgammaf128 (_Float128) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 lgammaf128_r (_Float128, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __lgammaf128_r (_Float128, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 rintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __rintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 nextafterf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __nextafterf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 nextdownf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __nextdownf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 nextupf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __nextupf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 remainderf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __remainderf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 scalbnf128 (_Float128 __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __scalbnf128 (_Float128 __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int llogbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 scalblnf128 (_Float128 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __scalblnf128 (_Float128 __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 nearbyintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __nearbyintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 roundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __roundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 truncf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __truncf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 remquof128 (_Float128 __x, _Float128 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __remquof128 (_Float128 __x, _Float128 __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 fdimf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __fdimf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 fmaxf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fmaxf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fminf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fminf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __fmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 roundevenf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __roundevenf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __intmax_t fromfpf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __intmax_t fromfpxf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpxf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf128 (_Float128 __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern int canonicalizef128 (_Float128 *__cx, const _Float128 *__x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float128 fmaxmagf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fmaxmagf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fminmagf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fminmagf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fmaximumf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fmaximumf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fminimumf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fminimumf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fmaximum_numf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fmaximum_numf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fminimum_numf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fminimum_numf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fmaximum_magf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fmaximum_magf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fminimum_magf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fminimum_magf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fmaximum_mag_numf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fmaximum_mag_numf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float128 fminimum_mag_numf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float128 __fminimum_mag_numf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int totalorderf128 (const _Float128 *__x, const _Float128 *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern int totalordermagf128 (const _Float128 *__x, const _Float128 *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern _Float128 getpayloadf128 (const _Float128 *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float128 __getpayloadf128 (const _Float128 *__x) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadf128 (_Float128 *__x, _Float128 __payload) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadsigf128 (_Float128 *__x, _Float128 __payload) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x acosf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __acosf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x asinf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __asinf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x atanf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __atanf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x atan2f32x (_Float32x __y, _Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __atan2f32x (_Float32x __y, _Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x cosf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __cosf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x sinf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __sinf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x tanf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __tanf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x coshf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __coshf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x sinhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __sinhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x tanhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __tanhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern void sincosf32x (_Float32x __x, _Float32x *__sinx, _Float32x *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf32x (_Float32x __x, _Float32x *__sinx, _Float32x *__cosx) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x acoshf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __acoshf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x asinhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __asinhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x atanhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __atanhf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x expf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __expf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x frexpf32x (_Float32x __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __frexpf32x (_Float32x __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x ldexpf32x (_Float32x __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __ldexpf32x (_Float32x __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x logf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __logf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x log10f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __log10f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x modff32x (_Float32x __x, _Float32x *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __modff32x (_Float32x __x, _Float32x *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
 extern _Float32x exp10f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __exp10f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x expm1f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __expm1f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x log1pf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __log1pf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x logbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __logbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x exp2f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __exp2f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x log2f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __log2f32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x powf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __powf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x sqrtf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __sqrtf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x hypotf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __hypotf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x cbrtf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __cbrtf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x ceilf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __ceilf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fabsf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fabsf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x floorf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __floorf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fmodf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __fmodf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x copysignf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __copysignf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x nanf32x (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __nanf32x (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x j0f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __j0f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x j1f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __j1f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x jnf32x (int, _Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __jnf32x (int, _Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x y0f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __y0f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x y1f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __y1f32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x ynf32x (int, _Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __ynf32x (int, _Float32x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x erff32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __erff32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float32x erfcf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __erfcf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x lgammaf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __lgammaf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x tgammaf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __tgammaf32x (_Float32x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x lgammaf32x_r (_Float32x, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __lgammaf32x_r (_Float32x, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x rintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __rintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x nextafterf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __nextafterf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x nextdownf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __nextdownf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x nextupf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __nextupf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x remainderf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __remainderf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x scalbnf32x (_Float32x __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __scalbnf32x (_Float32x __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int llogbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x scalblnf32x (_Float32x __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __scalblnf32x (_Float32x __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x nearbyintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __nearbyintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x roundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __roundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x truncf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __truncf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x remquof32x (_Float32x __x, _Float32x __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __remquof32x (_Float32x __x, _Float32x __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x fdimf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __fdimf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x fmaxf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fmaxf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fminf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fminf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fmaf32x (_Float32x __x, _Float32x __y, _Float32x __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __fmaf32x (_Float32x __x, _Float32x __y, _Float32x __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x roundevenf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __roundevenf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __intmax_t fromfpf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __intmax_t fromfpxf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpxf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf32x (_Float32x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern int canonicalizef32x (_Float32x *__cx, const _Float32x *__x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x fmaxmagf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fmaxmagf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fminmagf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fminmagf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fmaximumf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fmaximumf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fminimumf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fminimumf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fmaximum_numf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fmaximum_numf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fminimum_numf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fminimum_numf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fmaximum_magf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fmaximum_magf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fminimum_magf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fminimum_magf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fmaximum_mag_numf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fmaximum_mag_numf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float32x fminimum_mag_numf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float32x __fminimum_mag_numf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int totalorderf32x (const _Float32x *__x, const _Float32x *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern int totalordermagf32x (const _Float32x *__x, const _Float32x *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern _Float32x getpayloadf32x (const _Float32x *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float32x __getpayloadf32x (const _Float32x *__x) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadf32x (_Float32x *__x, _Float32x __payload) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadsigf32x (_Float32x *__x, _Float32x __payload) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x acosf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __acosf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x asinf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __asinf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x atanf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __atanf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x atan2f64x (_Float64x __y, _Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __atan2f64x (_Float64x __y, _Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x cosf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __cosf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x sinf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __sinf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x tanf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __tanf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x coshf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __coshf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x sinhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __sinhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x tanhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __tanhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern void sincosf64x (_Float64x __x, _Float64x *__sinx, _Float64x *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincosf64x (_Float64x __x, _Float64x *__sinx, _Float64x *__cosx) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x acoshf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __acoshf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x asinhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __asinhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x atanhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __atanhf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x expf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __expf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x frexpf64x (_Float64x __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __frexpf64x (_Float64x __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x ldexpf64x (_Float64x __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __ldexpf64x (_Float64x __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x logf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __logf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x log10f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __log10f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x modff64x (_Float64x __x, _Float64x *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __modff64x (_Float64x __x, _Float64x *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
 extern _Float64x exp10f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __exp10f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x expm1f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __expm1f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x log1pf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __log1pf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x logbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __logbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x exp2f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __exp2f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x log2f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __log2f64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x powf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __powf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x sqrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __sqrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x hypotf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __hypotf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x cbrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __cbrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x ceilf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __ceilf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fabsf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fabsf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x floorf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __floorf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fmodf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __fmodf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x copysignf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __copysignf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x nanf64x (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __nanf64x (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x j0f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __j0f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x j1f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __j1f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x jnf64x (int, _Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __jnf64x (int, _Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x y0f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __y0f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x y1f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __y1f64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x ynf64x (int, _Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __ynf64x (int, _Float64x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x erff64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __erff64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
 extern _Float64x erfcf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __erfcf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x lgammaf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __lgammaf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x tgammaf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __tgammaf64x (_Float64x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x lgammaf64x_r (_Float64x, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __lgammaf64x_r (_Float64x, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x rintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __rintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x nextafterf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __nextafterf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x nextdownf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __nextdownf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x nextupf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __nextupf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x remainderf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __remainderf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x scalbnf64x (_Float64x __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __scalbnf64x (_Float64x __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int llogbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __llogbf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x scalblnf64x (_Float64x __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __scalblnf64x (_Float64x __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x nearbyintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __nearbyintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x roundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __roundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x truncf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __truncf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x remquof64x (_Float64x __x, _Float64x __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __remquof64x (_Float64x __x, _Float64x __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x fdimf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __fdimf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x fmaxf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fmaxf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fminf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fminf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fmaf64x (_Float64x __x, _Float64x __y, _Float64x __z) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __fmaf64x (_Float64x __x, _Float64x __y, _Float64x __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x roundevenf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __roundevenf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern __intmax_t fromfpf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __intmax_t fromfpxf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __intmax_t __fromfpxf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern __uintmax_t ufromfpxf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__)); extern __uintmax_t __ufromfpxf64x (_Float64x __x, int __round, unsigned int __width) __attribute__ ((__nothrow__ , __leaf__));
extern int canonicalizef64x (_Float64x *__cx, const _Float64x *__x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x fmaxmagf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fmaxmagf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fminmagf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fminmagf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fmaximumf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fmaximumf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fminimumf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fminimumf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fmaximum_numf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fmaximum_numf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fminimum_numf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fminimum_numf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fmaximum_magf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fmaximum_magf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fminimum_magf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fminimum_magf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fmaximum_mag_numf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fmaximum_mag_numf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern _Float64x fminimum_mag_numf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern _Float64x __fminimum_mag_numf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int totalorderf64x (const _Float64x *__x, const _Float64x *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern int totalordermagf64x (const _Float64x *__x, const _Float64x *__y) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__pure__));
extern _Float64x getpayloadf64x (const _Float64x *__x) __attribute__ ((__nothrow__ , __leaf__)); extern _Float64x __getpayloadf64x (const _Float64x *__x) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadf64x (_Float64x *__x, _Float64x __payload) __attribute__ ((__nothrow__ , __leaf__));
extern int setpayloadsigf64x (_Float64x *__x, _Float64x __payload) __attribute__ ((__nothrow__ , __leaf__));
extern float fadd (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern float fdiv (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern float ffma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));
extern float fmul (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern float fsqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern float fsub (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern float faddl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern float fdivl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern float ffmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));
extern float fmull (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern float fsqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern float fsubl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double daddl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double ddivl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double dfmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));
extern double dmull (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double dsqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double dsubl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32addf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32divf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32fmaf32x (_Float32x __x, _Float32x __y, _Float32x __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32mulf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32sqrtf32x (_Float32x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32subf32x (_Float32x __x, _Float32x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32addf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32divf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32fmaf64 (_Float64 __x, _Float64 __y, _Float64 __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32mulf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32sqrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32subf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32addf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32divf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32fmaf64x (_Float64x __x, _Float64x __y, _Float64x __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32mulf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32sqrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32subf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32addf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32divf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32fmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32mulf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32sqrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32 f32subf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xaddf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xdivf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xfmaf64 (_Float64 __x, _Float64 __y, _Float64 __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xmulf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xsqrtf64 (_Float64 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xsubf64 (_Float64 __x, _Float64 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xaddf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xdivf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xfmaf64x (_Float64x __x, _Float64x __y, _Float64x __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xmulf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xsqrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xsubf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xaddf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xdivf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xfmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xmulf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xsqrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float32x f32xsubf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64addf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64divf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64fmaf64x (_Float64x __x, _Float64x __y, _Float64x __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64mulf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64sqrtf64x (_Float64x __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64subf64x (_Float64x __x, _Float64x __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64addf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64divf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64fmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64mulf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64sqrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64 f64subf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x f64xaddf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x f64xdivf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x f64xfmaf128 (_Float128 __x, _Float128 __y, _Float128 __z) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x f64xmulf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x f64xsqrtf128 (_Float128 __x) __attribute__ ((__nothrow__ , __leaf__));
extern _Float64x f64xsubf128 (_Float128 __x, _Float128 __y) __attribute__ ((__nothrow__ , __leaf__));
extern int signgam;
enum
  {
    FP_NAN =
      0,
    FP_INFINITE =
      1,
    FP_ZERO =
      2,
    FP_SUBNORMAL =
      3,
    FP_NORMAL =
      4
  };
extern int __iscanonicall (long double __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

struct timex
{
  unsigned int modes;
  __syscall_slong_t offset;
  __syscall_slong_t freq;
  __syscall_slong_t maxerror;
  __syscall_slong_t esterror;
  int status;
  __syscall_slong_t constant;
  __syscall_slong_t precision;
  __syscall_slong_t tolerance;
  struct timeval time;
  __syscall_slong_t tick;
  __syscall_slong_t ppsfreq;
  __syscall_slong_t jitter;
  int shift;
  __syscall_slong_t stabil;
  __syscall_slong_t jitcnt;
  __syscall_slong_t calcnt;
  __syscall_slong_t errcnt;
  __syscall_slong_t stbcnt;
  int tai;
  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32; int :32;
  int :32; int :32; int :32;
};

extern int clock_adjtime (__clockid_t __clock_id, struct timex *__utx) __attribute__ ((__nothrow__ , __leaf__));

struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;
  long int tm_gmtoff;
  const char *tm_zone;
};
struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };
struct sigevent;

extern clock_t clock (void) __attribute__ ((__nothrow__ , __leaf__));
extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));
extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));
extern char *strptime (const char *__restrict __s,
         const char *__restrict __fmt, struct tm *__tp)
     __attribute__ ((__nothrow__ , __leaf__));
extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));
extern char *strptime_l (const char *__restrict __s,
    const char *__restrict __fmt, struct tm *__tp,
    locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));
extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));
extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));
extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));
extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));
extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));
extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));
extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));
extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;
extern char *tzname[2];
extern void tzset (void) __attribute__ ((__nothrow__ , __leaf__));
extern int daylight;
extern long int timezone;
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern int dysize (int __year) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);
extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__ , __leaf__));
extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     __attribute__ ((__nothrow__ , __leaf__));
extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);
extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__ , __leaf__));
extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__ , __leaf__));
extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));
extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ , __leaf__));
extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__ , __leaf__));
extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));
extern int timespec_get (struct timespec *__ts, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int timespec_getres (struct timespec *__ts, int __base)
     __attribute__ ((__nothrow__ , __leaf__));
extern int getdate_err;
extern struct tm *getdate (const char *__string);
extern int getdate_r (const char *__restrict __string,
        struct tm *__restrict __resbufp);


struct timezone
  {
    int tz_minuteswest;
    int tz_dsttime;
  };
extern int gettimeofday (struct timeval *__restrict __tv,
    void *__restrict __tz) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int settimeofday (const struct timeval *__tv,
    const struct timezone *__tz)
     __attribute__ ((__nothrow__ , __leaf__));
extern int adjtime (const struct timeval *__delta,
      struct timeval *__olddelta) __attribute__ ((__nothrow__ , __leaf__));
enum __itimer_which
  {
    ITIMER_REAL = 0,
    ITIMER_VIRTUAL = 1,
    ITIMER_PROF = 2
  };
struct itimerval
  {
    struct timeval it_interval;
    struct timeval it_value;
  };
typedef enum __itimer_which __itimer_which_t;
extern int getitimer (__itimer_which_t __which,
        struct itimerval *__value) __attribute__ ((__nothrow__ , __leaf__));
extern int setitimer (__itimer_which_t __which,
        const struct itimerval *__restrict __new,
        struct itimerval *__restrict __old) __attribute__ ((__nothrow__ , __leaf__));
extern int utimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int lutimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int futimes (int __fd, const struct timeval __tvp[2]) __attribute__ ((__nothrow__ , __leaf__));
extern int futimesat (int __fd, const char *__file,
        const struct timeval __tvp[2]) __attribute__ ((__nothrow__ , __leaf__));


#pragma GCC visibility push(default)

extern size_t strlcpy(char *, const char*, size_t);
extern size_t strlcat(char *, const char*, size_t);
__attribute__((__format__(__printf__, 1, 2)))
extern void setproctitle(const char *fmt, ...);

#pragma GCC visibility pop


extern long int __sysconf (int __name) __attribute__ ((__nothrow__ , __leaf__));

typedef unsigned long VALUE;
typedef unsigned long ID;
__extension__ _Static_assert(4 == sizeof(int), "sizeof_int" ": " "SIZEOF_INT == sizeof(int)");
__extension__ _Static_assert(8 == sizeof(long), "sizeof_long" ": " "SIZEOF_LONG == sizeof(long)");
__extension__ _Static_assert(8 == sizeof(long long), "sizeof_long_long" ": " "SIZEOF_LONG_LONG == sizeof(LONG_LONG)");
__extension__ _Static_assert(8 == sizeof(void *), "sizeof_voidp" ": " "SIZEOF_VOIDP == sizeof(void *)");

#pragma GCC visibility push(default)

VALUE rb_class_new(VALUE super);
VALUE rb_mod_init_copy(VALUE clone, VALUE orig);
void rb_check_inheritable(VALUE super);
VALUE rb_define_class_id(ID id, VALUE super);
VALUE rb_define_class_id_under(VALUE outer, ID id, VALUE super);
VALUE rb_module_new(void);
VALUE rb_refinement_new(void);
VALUE rb_define_module_id(ID id);
VALUE rb_define_module_id_under(VALUE outer, ID id);
VALUE rb_mod_included_modules(VALUE mod);
VALUE rb_mod_include_p(VALUE child, VALUE parent);
VALUE rb_mod_ancestors(VALUE mod);
VALUE rb_class_descendants(VALUE klass);
VALUE rb_class_subclasses(VALUE klass);
VALUE rb_class_attached_object(VALUE klass);
VALUE rb_class_instance_methods(int argc, const VALUE *argv, VALUE mod);
VALUE rb_class_public_instance_methods(int argc, const VALUE *argv, VALUE mod);
VALUE rb_class_protected_instance_methods(int argc, const VALUE *argv, VALUE mod);
VALUE rb_class_private_instance_methods(int argc, const VALUE *argv, VALUE mod);
VALUE rb_obj_singleton_methods(int argc, const VALUE *argv, VALUE obj);
void rb_define_method_id(VALUE klass, ID mid, VALUE (*func)(), int arity);
void rb_undef(VALUE mod, ID mid);
__attribute__((__nonnull__ ()))
void rb_define_protected_method(VALUE klass, const char *mid, VALUE (*func)(), int arity);
__attribute__((__nonnull__ ()))
void rb_define_private_method(VALUE klass, const char *mid, VALUE (*func)(), int arity);
__attribute__((__nonnull__ ()))
void rb_define_singleton_method(VALUE obj, const char *mid, VALUE(*func)(), int arity);
VALUE rb_singleton_class(VALUE obj);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

int rb_sourceline(void);
const char *rb_sourcefile(void);
int rb_frame_method_id_and_class(ID *idp, VALUE *klassp);
VALUE rb_check_funcall(VALUE recv, ID mid, int argc, const VALUE *argv);
VALUE rb_check_funcall_kw(VALUE recv, ID mid, int argc, const VALUE *argv, int kw_splat);
VALUE rb_eval_cmd_kw(VALUE cmd, VALUE arg, int kw_splat);
VALUE rb_apply(VALUE recv, ID mid, VALUE args);
VALUE rb_obj_instance_eval(int argc, const VALUE *argv, VALUE recv);
VALUE rb_obj_instance_exec(int argc, const VALUE *argv, VALUE recv);
VALUE rb_mod_module_eval(int argc, const VALUE *argv, VALUE mod);
VALUE rb_mod_module_exec(int argc, const VALUE *argv, VALUE mod);
typedef VALUE (*rb_alloc_func_t)(VALUE klass);
void rb_define_alloc_func(VALUE klass, rb_alloc_func_t func);
void rb_undef_alloc_func(VALUE klass);
rb_alloc_func_t rb_get_alloc_func(VALUE klass);
void rb_clear_constant_cache_for_id(ID id);
void rb_alias(VALUE klass, ID dst, ID src);
void rb_attr(VALUE klass, ID name, int need_reader, int need_writer, int honour_visibility);
__attribute__((__nonnull__ ()))
void rb_remove_method(VALUE klass, const char *name);
void rb_remove_method_id(VALUE klass, ID mid);
int rb_method_boundp(VALUE klass, ID id, int ex);
int rb_method_basic_definition_p(VALUE klass, ID mid);
int rb_obj_respond_to(VALUE obj, ID mid, int private_p);
int rb_respond_to(VALUE obj, ID mid);
__attribute__((__noreturn__))
VALUE rb_f_notimplement(int argc, const VALUE *argv, VALUE obj, VALUE marker);
void rb_backtrace(void);
VALUE rb_make_backtrace(void);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
void rb_define_method(VALUE klass, const char *mid, VALUE (*func)(), int arity);
__attribute__((__nonnull__ ()))
void rb_define_module_function(VALUE klass, const char *mid, VALUE (*func)(), int arity);
__attribute__((__nonnull__ ()))
void rb_define_global_function(const char *mid, VALUE (*func)(), int arity);
__attribute__((__nonnull__ ()))
void rb_undef_method(VALUE klass, const char *name);
__attribute__((__nonnull__ ()))
void rb_define_alias(VALUE klass, const char *dst, const char *src);
__attribute__((__nonnull__ ()))
void rb_define_attr(VALUE klass, const char *name, int read, int write);

#pragma GCC visibility pop

[[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_notimpl(VALUE, const char *, VALUE(*)(int, const VALUE *, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_m3(VALUE, const char *, VALUE(*)(), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_m2(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_m1(VALUE, const char *, VALUE(*)(int, union { VALUE *x; const VALUE *y; } __attribute__((__transparent_union__)), VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_00(VALUE, const char *, VALUE(*)(VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_01(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_02(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_03(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_04(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_05(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_06(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_07(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_08(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_09(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_10(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_11(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_12(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_13(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_14(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_singleton_method"))) static void rb_define_singleton_method_15(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int);
[[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_notimpl(VALUE, const char *, VALUE(*)(int, const VALUE *, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_m3(VALUE, const char *, VALUE(*)(), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_m2(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_m1(VALUE, const char *, VALUE(*)(int, union { VALUE *x; const VALUE *y; } __attribute__((__transparent_union__)), VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_00(VALUE, const char *, VALUE(*)(VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_01(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_02(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_03(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_04(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_05(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_06(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_07(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_08(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_09(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_10(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_11(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_12(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_13(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_14(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_protected_method"))) static void rb_define_protected_method_15(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int);
[[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_notimpl(VALUE, const char *, VALUE(*)(int, const VALUE *, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_m3(VALUE, const char *, VALUE(*)(), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_m2(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_m1(VALUE, const char *, VALUE(*)(int, union { VALUE *x; const VALUE *y; } __attribute__((__transparent_union__)), VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_00(VALUE, const char *, VALUE(*)(VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_01(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_02(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_03(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_04(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_05(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_06(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_07(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_08(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_09(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_10(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_11(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_12(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_13(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_14(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_private_method"))) static void rb_define_private_method_15(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int);
[[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_notimpl(VALUE, const char *, VALUE(*)(int, const VALUE *, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_m3(VALUE, const char *, VALUE(*)(), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_m2(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_m1(VALUE, const char *, VALUE(*)(int, union { VALUE *x; const VALUE *y; } __attribute__((__transparent_union__)), VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_00(VALUE, const char *, VALUE(*)(VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_01(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_02(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_03(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_04(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_05(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_06(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_07(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_08(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_09(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_10(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_11(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_12(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_13(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_14(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_module_function"))) static void rb_define_module_function_15(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int);
[[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_notimpl(const char *, VALUE(*)(int, const VALUE *, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_m3(const char *, VALUE(*)(), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_m2(const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_m1(const char *, VALUE(*)(int, union { VALUE *x; const VALUE *y; } __attribute__((__transparent_union__)), VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_00(const char *, VALUE(*)(VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_01(const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_02(const char *, VALUE(*)(VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_03(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_04(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_05(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_06(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_07(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_08(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_09(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_10(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_11(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_12(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_13(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_14(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_global_function"))) static void rb_define_global_function_15(const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int);
[[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_notimpl(VALUE, ID, VALUE(*)(int, const VALUE *, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_m3(VALUE, ID, VALUE(*)(), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_m2(VALUE, ID, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_m1(VALUE, ID, VALUE(*)(int, union { VALUE *x; const VALUE *y; } __attribute__((__transparent_union__)), VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_00(VALUE, ID, VALUE(*)(VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_01(VALUE, ID, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_02(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_03(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_04(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_05(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_06(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_07(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_08(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_09(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_10(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_11(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_12(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_13(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_14(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method_id"))) static void rb_define_method_id_15(VALUE, ID, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int);
[[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_notimpl(VALUE, const char *, VALUE(*)(int, const VALUE *, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_m3(VALUE, const char *, VALUE(*)(), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_m2(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_m1(VALUE, const char *, VALUE(*)(int, union { VALUE *x; const VALUE *y; } __attribute__((__transparent_union__)), VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_00(VALUE, const char *, VALUE(*)(VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_01(VALUE, const char *, VALUE(*)(VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_02(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_03(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_04(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_05(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_06(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_07(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_08(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_09(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_10(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_11(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_12(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_13(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_14(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int); [[maybe_unused]] __attribute__((__nonnull__ ())) __attribute__((__weakref__("rb_define_method"))) static void rb_define_method_15(VALUE, const char *, VALUE(*)(VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE, VALUE), int);

#pragma GCC visibility push(default)

VALUE rb_int2big(intptr_t i);
VALUE rb_int2inum(intptr_t i);
VALUE rb_uint2big(uintptr_t i);
VALUE rb_uint2inum(uintptr_t i);

#pragma GCC visibility pop

enum

ruby_special_consts {
    RUBY_Qfalse = 0x00,
    RUBY_Qnil = 0x04,
    RUBY_Qtrue = 0x14,
    RUBY_Qundef = 0x24,
    RUBY_IMMEDIATE_MASK = 0x07,
    RUBY_FIXNUM_FLAG = 0x01,
    RUBY_FLONUM_MASK = 0x03,
    RUBY_FLONUM_FLAG = 0x02,
    RUBY_SYMBOL_FLAG = 0x0c,
    RUBY_SPECIAL_SHIFT = 8
};
__attribute__((__const__))

__attribute__((__artificial__))
static inline _Bool
RB_TEST(VALUE obj)
{
    return obj & ~RUBY_Qnil;
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline _Bool
RB_NIL_P(VALUE obj)
{
    return obj == RUBY_Qnil;
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline _Bool
RB_UNDEF_P(VALUE obj)
{
    return obj == RUBY_Qundef;
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline _Bool
RB_NIL_OR_UNDEF_P(VALUE obj)
{
    const VALUE mask = ~(RUBY_Qundef ^ RUBY_Qnil);
    const VALUE common_bits = RUBY_Qundef & RUBY_Qnil;
    return (obj & mask) == common_bits;
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline _Bool
RB_FIXNUM_P(VALUE obj)
{
    return obj & RUBY_FIXNUM_FLAG;
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline _Bool
RB_STATIC_SYM_P(VALUE obj)
{
   
    const VALUE mask = ~((0x7fffffffffffffffL * 2UL + 1UL) << RUBY_SPECIAL_SHIFT);
    return (obj & mask) == RUBY_SYMBOL_FLAG;
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline _Bool
RB_FLONUM_P(VALUE obj)
{
    return (obj & RUBY_FLONUM_MASK) == RUBY_FLONUM_FLAG;
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline _Bool
RB_IMMEDIATE_P(VALUE obj)
{
    return obj & RUBY_IMMEDIATE_MASK;
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline _Bool
RB_SPECIAL_CONST_P(VALUE obj)
{
    return RB_IMMEDIATE_P(obj) || obj == RUBY_Qfalse;
}
__attribute__((__const__))

static inline VALUE
rb_special_const_p(VALUE obj)
{
    return RB_SPECIAL_CONST_P(obj) * RUBY_Qtrue;
}

#pragma GCC visibility push(default)

__attribute__((__noreturn__))
__attribute__((__cold__))
void rb_out_of_int(long num);
long rb_num2long(VALUE num);
unsigned long rb_num2ulong(VALUE num);

#pragma GCC visibility pop

__attribute__((__const__))

__attribute__((__artificial__))
static inline VALUE
RB_INT2FIX(long i)
{
    ((void)0);
    const unsigned long j = i;
    const unsigned long k = (j << 1) + RUBY_FIXNUM_FLAG;
    const long l = k;
    const long m = l;
    const VALUE n = m;
    ((void)0);
    return n;
}
static inline int
rb_long2int_inline(long n)
{
    int i = ((int)n);
    if (sizeof(long) <= sizeof(int)) {
        ((__builtin_expect(!!(!!(i == n)), 1)) ? ((void)0) : __builtin_unreachable());
    }
    if (i != n)
        rb_out_of_int(n);
    return i;
}
__attribute__((__const__))

static inline long
rbimpl_fix2long_by_idiv(VALUE x)
{
    ((void)0);
    const long y = x - RUBY_FIXNUM_FLAG;
    const long z = y / 2;
    const long w = ((long)z);
    ((void)0);
    return w;
}
__attribute__((__const__))

static inline long
rbimpl_fix2long_by_shift(VALUE x)
{
    ((void)0);
    const long y = x;
    const long z = y >> 1;
    const long w = ((long)z);
    ((void)0);
    return w;
}
__attribute__((__const__))

static inline _Bool
rbimpl_right_shift_is_arithmetic_p(void)
{
    return (-1 >> 1) == -1;
}
__attribute__((__const__))

static inline long
rb_fix2long(VALUE x)
{
    if (rbimpl_right_shift_is_arithmetic_p()) {
        return rbimpl_fix2long_by_shift(x);
    }
    else {
        return rbimpl_fix2long_by_idiv(x);
    }
}
__attribute__((__const__))

static inline unsigned long
rb_fix2ulong(VALUE x)
{
    ((void)0);
    return rb_fix2long(x);
}
static inline long
rb_num2long_inline(VALUE x)
{
    if (RB_FIXNUM_P(x))
        return rb_fix2long(x);
    else
        return rb_num2long(x);
}
static inline unsigned long
rb_num2ulong_inline(VALUE x)
{
    if (RB_FIXNUM_P(x))
        return rb_fix2ulong(x);
    else
        return rb_num2ulong(x);
}
static inline VALUE
rb_long2num_inline(long v)
{
    if ((((v) < (0x7fffffffffffffffL / 2) + 1) && ((v) >= ((-0x7fffffffffffffffL - 1L) / 2))))
        return RB_INT2FIX(v);
    else
        return rb_int2big(v);
}
static inline VALUE
rb_ulong2num_inline(unsigned long v)
{
    if (((v) < (0x7fffffffffffffffL / 2) + 1))
        return RB_INT2FIX(v);
    else
        return rb_uint2big(v);
}

#pragma GCC visibility push(default)

long rb_num2int(VALUE num);
long rb_fix2int(VALUE num);
unsigned long rb_num2uint(VALUE num);
unsigned long rb_fix2uint(VALUE num);

#pragma GCC visibility pop

__attribute__((__artificial__))
static inline int
RB_FIX2INT(VALUE x)
{
    long ret;
    if (sizeof(int) < sizeof(long)) {
        ret = rb_fix2int(x);
    }
    else {
        ret = rb_fix2long(x);
    }
    return ((int)ret);
}
static inline int
rb_num2int_inline(VALUE x)
{
    long ret;
    if (sizeof(int) == sizeof(long)) {
        ret = rb_num2long_inline(x);
    }
    else if (RB_FIXNUM_P(x)) {
        ret = rb_fix2int(x);
    }
    else {
        ret = rb_num2int(x);
    }
    return ((int)ret);
}
__attribute__((__artificial__))
static inline unsigned int
RB_NUM2UINT(VALUE x)
{
    unsigned long ret;
    if (sizeof(int) < sizeof(long)) {
        ret = rb_num2uint(x);
    }
    else {
        ret = rb_num2ulong_inline(x);
    }
    return ((unsigned int)ret);
}
__attribute__((__artificial__))
static inline unsigned int
RB_FIX2UINT(VALUE x)
{
    unsigned long ret;
    if (sizeof(int) < sizeof(long)) {
        ret = rb_fix2uint(x);
    }
    else {
        ret = rb_fix2ulong(x);
    }
    return ((unsigned int)ret);
}

#pragma GCC diagnostic push


#pragma GCC diagnostic ignored "-Wtype-limits"

static inline VALUE
rb_int2num_inline(int v)
{
    if ((((v) < (0x7fffffffffffffffL / 2) + 1) && ((v) >= ((-0x7fffffffffffffffL - 1L) / 2))))
        return RB_INT2FIX(v);
    else
        return rb_int2big(v);
}
static inline VALUE
rb_uint2num_inline(unsigned int v)
{
    if (((v) < (0x7fffffffffffffffL / 2) + 1))
        return RB_INT2FIX(v);
    else
        return rb_uint2big(v);
}

#pragma GCC diagnostic pop

enum ruby_rvalue_flags {
    RVALUE_EMBED_LEN_MAX = 3
};
struct
__attribute__((__aligned__(8)))
RBasic {
    VALUE flags;
    const VALUE klass;
};

#pragma GCC visibility push(default)

VALUE rb_obj_hide(VALUE obj);
VALUE rb_obj_reveal(VALUE obj, VALUE klass);

#pragma GCC visibility pop

__attribute__((__pure__))
__attribute__((__artificial__))
static inline VALUE
RBASIC_CLASS(VALUE obj)
{
    ((void)0);
    return ((struct RBasic *)(obj))->klass;
}
typedef enum {
    RB_WARN_CATEGORY_NONE,
    RB_WARN_CATEGORY_DEPRECATED,
    RB_WARN_CATEGORY_EXPERIMENTAL,
    RB_WARN_CATEGORY_PERFORMANCE,
    RB_WARN_CATEGORY_DEFAULT_BITS = (
        (1U << RB_WARN_CATEGORY_DEPRECATED) |
        (1U << RB_WARN_CATEGORY_EXPERIMENTAL) |
        0),
    RB_WARN_CATEGORY_ALL_BITS = (
        (1U << RB_WARN_CATEGORY_DEPRECATED) |
        (1U << RB_WARN_CATEGORY_EXPERIMENTAL) |
        (1U << RB_WARN_CATEGORY_PERFORMANCE) |
        0)
} rb_warning_category_t;
enum rb_io_wait_readwrite {RB_IO_WAIT_READABLE, RB_IO_WAIT_WRITABLE};

#pragma GCC visibility push(default)

VALUE rb_errinfo(void);
void rb_set_errinfo(VALUE err);
__attribute__((__noreturn__))
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 3)))
void rb_raise(VALUE exc, const char *fmt, ...);
__attribute__((__noreturn__))
__attribute__((__nonnull__ (1)))
__attribute__((__format__(__printf__, 1, 2)))
void rb_fatal(const char *fmt, ...);
__attribute__((__cold__))
__attribute__((__noreturn__))
__attribute__((__nonnull__ (1)))
__attribute__((__format__(__printf__, 1, 2)))
void rb_bug(const char *fmt, ...);
__attribute__((__noreturn__))
__attribute__((__nonnull__ ()))
void rb_bug_errno(const char *msg, int err);
__attribute__((__noreturn__))
void rb_sys_fail(const char *msg);
__attribute__((__noreturn__))
void rb_sys_fail_str(VALUE msg);
__attribute__((__noreturn__))
__attribute__((__nonnull__ (2)))
void rb_mod_sys_fail(VALUE mod, const char *msg);
__attribute__((__noreturn__))
void rb_mod_sys_fail_str(VALUE mod, VALUE msg);
__attribute__((__noreturn__))
void rb_readwrite_sys_fail(enum rb_io_wait_readwrite waiting, const char *msg);
__attribute__((__noreturn__))
void rb_iter_break(void);
__attribute__((__noreturn__))
void rb_iter_break_value(VALUE val);
__attribute__((__noreturn__))
void rb_exit(int status);
__attribute__((__noreturn__))
void rb_notimplement(void);
VALUE rb_syserr_new(int err, const char * msg);
VALUE rb_syserr_new_str(int n, VALUE arg);
__attribute__((__noreturn__))
void rb_syserr_fail(int err, const char *msg);
__attribute__((__noreturn__))
void rb_syserr_fail_str(int err, VALUE msg);
__attribute__((__noreturn__))
__attribute__((__nonnull__ ()))
void rb_mod_syserr_fail(VALUE mod, int err, const char *msg);
__attribute__((__noreturn__))
void rb_mod_syserr_fail_str(VALUE mod, int err, VALUE msg);
__attribute__((__noreturn__))
void rb_readwrite_syserr_fail(enum rb_io_wait_readwrite waiting, int err, const char *msg);
__attribute__((__cold__))
__attribute__((__noreturn__))
void rb_unexpected_type(VALUE self, int t);
VALUE *rb_ruby_verbose_ptr(void);
VALUE *rb_ruby_debug_ptr(void);
__attribute__((__nonnull__ (1)))
__attribute__((__format__(__printf__, 1, 2)))
void rb_warning(const char *fmt, ...);
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 3)))
void rb_category_warning(rb_warning_category_t cat, const char *fmt, ...);
__attribute__((__nonnull__ (1, 3)))
__attribute__((__format__(__printf__, 3, 4)))
void rb_compile_warning(const char *file, int line, const char *fmt, ...);
__attribute__((__nonnull__ (1)))
__attribute__((__format__(__printf__, 1, 2)))
void rb_sys_warning(const char *fmt, ...);
__attribute__((__cold__))
__attribute__((__nonnull__ (1)))
__attribute__((__format__(__printf__, 1, 2)))
void rb_warn(const char *fmt, ...);
__attribute__((__cold__))
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 3)))
void rb_category_warn(rb_warning_category_t cat, const char *fmt, ...);
__attribute__((__nonnull__ (1, 3)))
__attribute__((__format__(__printf__, 3, 4)))
void rb_compile_warn(const char *file, int line, const char *fmt, ...);
__attribute__((__nonnull__ (2, 4)))
__attribute__((__format__(__printf__, 4, 5)))
void rb_category_compile_warn(rb_warning_category_t cat, const char *file, int line, const char *fmt, ...);

#pragma GCC visibility pop

enum

ruby_value_type {
    RUBY_T_NONE = 0x00,
    RUBY_T_OBJECT = 0x01,
    RUBY_T_CLASS = 0x02,
    RUBY_T_MODULE = 0x03,
    RUBY_T_FLOAT = 0x04,
    RUBY_T_STRING = 0x05,
    RUBY_T_REGEXP = 0x06,
    RUBY_T_ARRAY = 0x07,
    RUBY_T_HASH = 0x08,
    RUBY_T_STRUCT = 0x09,
    RUBY_T_BIGNUM = 0x0a,
    RUBY_T_FILE = 0x0b,
    RUBY_T_DATA = 0x0c,
    RUBY_T_MATCH = 0x0d,
    RUBY_T_COMPLEX = 0x0e,
    RUBY_T_RATIONAL = 0x0f,
    RUBY_T_NIL = 0x11,
    RUBY_T_TRUE = 0x12,
    RUBY_T_FALSE = 0x13,
    RUBY_T_SYMBOL = 0x14,
    RUBY_T_FIXNUM = 0x15,
    RUBY_T_UNDEF = 0x16,
    RUBY_T_IMEMO = 0x1a,
    RUBY_T_NODE = 0x1b,
    RUBY_T_ICLASS = 0x1c,
    RUBY_T_ZOMBIE = 0x1d,
    RUBY_T_MOVED = 0x1e,
    RUBY_T_MASK = 0x1f
};

#pragma GCC visibility push(default)

__attribute__((__cold__))
void rb_check_type(VALUE obj, int t);

#pragma GCC visibility pop

__attribute__((__pure__))
__attribute__((__artificial__))
static inline enum ruby_value_type
RB_BUILTIN_TYPE(VALUE obj)
{
    ((void)0);
    VALUE ret = ((struct RBasic *)(obj))->flags & RUBY_T_MASK;
    return ((enum ruby_value_type)ret);
}
__attribute__((__pure__))
static inline _Bool
rb_integer_type_p(VALUE obj)
{
    if (RB_FIXNUM_P(obj)) {
        return 1;
    }
    else if (RB_SPECIAL_CONST_P(obj)) {
        return 0;
    }
    else {
        return RB_BUILTIN_TYPE(obj) == RUBY_T_BIGNUM;
    }
}
__attribute__((__pure__))
static inline enum ruby_value_type
rb_type(VALUE obj)
{
    if (! RB_SPECIAL_CONST_P(obj)) {
        return RB_BUILTIN_TYPE(obj);
    }
    else if (obj == ((VALUE)RUBY_Qfalse)) {
        return RUBY_T_FALSE;
    }
    else if (obj == ((VALUE)RUBY_Qnil)) {
        return RUBY_T_NIL;
    }
    else if (obj == ((VALUE)RUBY_Qtrue)) {
        return RUBY_T_TRUE;
    }
    else if (obj == ((VALUE)RUBY_Qundef)) {
        return RUBY_T_UNDEF;
    }
    else if (RB_FIXNUM_P(obj)) {
        return RUBY_T_FIXNUM;
    }
    else if (RB_STATIC_SYM_P(obj)) {
        return RUBY_T_SYMBOL;
    }
    else {
        ((__builtin_expect(!!(!!(RB_FLONUM_P(obj))), 1)) ? ((void)0) : __builtin_unreachable());
        return RUBY_T_FLOAT;
    }
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_FLOAT_TYPE_P(VALUE obj)
{
    if (RB_FLONUM_P(obj)) {
        return 1;
    }
    else if (RB_SPECIAL_CONST_P(obj)) {
        return 0;
    }
    else {
        return RB_BUILTIN_TYPE(obj) == RUBY_T_FLOAT;
    }
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_DYNAMIC_SYM_P(VALUE obj)
{
    if (RB_SPECIAL_CONST_P(obj)) {
        return 0;
    }
    else {
        return RB_BUILTIN_TYPE(obj) == RUBY_T_SYMBOL;
    }
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_SYMBOL_P(VALUE obj)
{
    return RB_STATIC_SYM_P(obj) || RB_DYNAMIC_SYM_P(obj);
}
__attribute__((__pure__))
__attribute__((__artificial__))
__attribute__((__always_inline__)) inline
static _Bool
rbimpl_RB_TYPE_P_fastpath(VALUE obj, enum ruby_value_type t)
{
    if (t == RUBY_T_TRUE) {
        return obj == ((VALUE)RUBY_Qtrue);
    }
    else if (t == RUBY_T_FALSE) {
        return obj == ((VALUE)RUBY_Qfalse);
    }
    else if (t == RUBY_T_NIL) {
        return obj == ((VALUE)RUBY_Qnil);
    }
    else if (t == RUBY_T_UNDEF) {
        return obj == ((VALUE)RUBY_Qundef);
    }
    else if (t == RUBY_T_FIXNUM) {
        return RB_FIXNUM_P(obj);
    }
    else if (t == RUBY_T_SYMBOL) {
        return RB_SYMBOL_P(obj);
    }
    else if (t == RUBY_T_FLOAT) {
        return RB_FLOAT_TYPE_P(obj);
    }
    else if (RB_SPECIAL_CONST_P(obj)) {
        return 0;
    }
    else if (t == RB_BUILTIN_TYPE(obj)) {
        return 1;
    }
    else {
        return 0;
    }
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_TYPE_P(VALUE obj, enum ruby_value_type t)
{
    if (__builtin_constant_p(t)) {
        return rbimpl_RB_TYPE_P_fastpath(obj, t);
    }
    else {
        return t == rb_type(obj);
    }
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool rbimpl_rtypeddata_p(VALUE obj);
__attribute__((__artificial__))
static inline void
Check_Type(VALUE v, enum ruby_value_type t)
{
    if ((__builtin_expect(!!(! RB_TYPE_P(v, t)), 0))) {
        goto unexpected_type;
    }
    else if (t == RUBY_T_DATA && rbimpl_rtypeddata_p(v)) {
        goto unexpected_type;
    }
    else {
        return;
    }
  unexpected_type:
    rb_unexpected_type(v, t);
}
enum ruby_fl_ushift {
    RUBY_FL_USHIFT = 12
};
__extension__
enum

ruby_fl_type {
    RUBY_FL_WB_PROTECTED = (1<<5),
    RUBY_FL_PROMOTED = (1<<5),
    RUBY_FL_UNUSED6 = (1<<6),
    RUBY_FL_FINALIZE = (1<<7),
    RUBY_FL_TAINT
    __attribute__((__deprecated__ ("taintedness turned out to be a wrong idea.")))
                         = 0,
    RUBY_FL_SHAREABLE = (1<<8),
    RUBY_FL_UNTRUSTED
    __attribute__((__deprecated__ ("trustedness turned out to be a wrong idea.")))
                         = 0,
    RUBY_FL_SEEN_OBJ_ID = (1<<9),
    RUBY_FL_EXIVAR = (1<<10),
    RUBY_FL_FREEZE = (1<<11),
    RUBY_FL_USER0 = (1<<(RUBY_FL_USHIFT+0)),
    RUBY_FL_USER1 = (1<<(RUBY_FL_USHIFT+1)),
    RUBY_FL_USER2 = (1<<(RUBY_FL_USHIFT+2)),
    RUBY_FL_USER3 = (1<<(RUBY_FL_USHIFT+3)),
    RUBY_FL_USER4 = (1<<(RUBY_FL_USHIFT+4)),
    RUBY_FL_USER5 = (1<<(RUBY_FL_USHIFT+5)),
    RUBY_FL_USER6 = (1<<(RUBY_FL_USHIFT+6)),
    RUBY_FL_USER7 = (1<<(RUBY_FL_USHIFT+7)),
    RUBY_FL_USER8 = (1<<(RUBY_FL_USHIFT+8)),
    RUBY_FL_USER9 = (1<<(RUBY_FL_USHIFT+9)),
    RUBY_FL_USER10 = (1<<(RUBY_FL_USHIFT+10)),
    RUBY_FL_USER11 = (1<<(RUBY_FL_USHIFT+11)),
    RUBY_FL_USER12 = (1<<(RUBY_FL_USHIFT+12)),
    RUBY_FL_USER13 = (1<<(RUBY_FL_USHIFT+13)),
    RUBY_FL_USER14 = (1<<(RUBY_FL_USHIFT+14)),
    RUBY_FL_USER15 = (1<<(RUBY_FL_USHIFT+15)),
    RUBY_FL_USER16 = (1<<(RUBY_FL_USHIFT+16)),
    RUBY_FL_USER17 = (1<<(RUBY_FL_USHIFT+17)),
    RUBY_FL_USER18 = (1<<(RUBY_FL_USHIFT+18)),
    RUBY_FL_USER19 = (1<<(RUBY_FL_USHIFT+19)),
    RUBY_ELTS_SHARED = RUBY_FL_USER2,
    RUBY_FL_SINGLETON = RUBY_FL_USER0,
};
enum {
    RUBY_FL_DUPPED
    __attribute__((__deprecated__ ("It seems there is no actual usage of this enum.")))
    = (int)RUBY_T_MASK | (int)RUBY_FL_EXIVAR
};

#pragma GCC visibility push(default)

void rb_freeze_singleton_class(VALUE klass);

#pragma GCC visibility pop

__attribute__((__pure__))
__attribute__((__artificial__))
__attribute__((__always_inline__)) inline
static _Bool
RB_FL_ABLE(VALUE obj)
{
    if (RB_SPECIAL_CONST_P(obj)) {
        return 0;
    }
    else if (RB_TYPE_P(obj, RUBY_T_NODE)) {
        return 0;
    }
    else {
        return 1;
    }
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline VALUE
RB_FL_TEST_RAW(VALUE obj, VALUE flags)
{
    ((void)0);
    return ((struct RBasic *)(obj))->flags & flags;
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline VALUE
RB_FL_TEST(VALUE obj, VALUE flags)
{
    if (RB_FL_ABLE(obj)) {
        return RB_FL_TEST_RAW(obj, flags);
    }
    else {
        return 0UL;
    }
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_FL_ANY_RAW(VALUE obj, VALUE flags)
{
    return RB_FL_TEST_RAW(obj, flags);
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_FL_ANY(VALUE obj, VALUE flags)
{
    return RB_FL_TEST(obj, flags);
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_FL_ALL_RAW(VALUE obj, VALUE flags)
{
    return RB_FL_TEST_RAW(obj, flags) == flags;
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_FL_ALL(VALUE obj, VALUE flags)
{
    return RB_FL_TEST(obj, flags) == flags;
}

__attribute__((__artificial__))
static inline void
rbimpl_fl_set_raw_raw(struct RBasic *obj, VALUE flags)
{
    obj->flags |= flags;
}
__attribute__((__artificial__))
static inline void
RB_FL_SET_RAW(VALUE obj, VALUE flags)
{
    ((void)0);
    rbimpl_fl_set_raw_raw(((struct RBasic *)(obj)), flags);
}
__attribute__((__artificial__))
static inline void
RB_FL_SET(VALUE obj, VALUE flags)
{
    if (RB_FL_ABLE(obj)) {
        RB_FL_SET_RAW(obj, flags);
    }
}

__attribute__((__artificial__))
static inline void
rbimpl_fl_unset_raw_raw(struct RBasic *obj, VALUE flags)
{
    obj->flags &= ~flags;
}
__attribute__((__artificial__))
static inline void
RB_FL_UNSET_RAW(VALUE obj, VALUE flags)
{
    ((void)0);
    rbimpl_fl_unset_raw_raw(((struct RBasic *)(obj)), flags);
}
__attribute__((__artificial__))
static inline void
RB_FL_UNSET(VALUE obj, VALUE flags)
{
    if (RB_FL_ABLE(obj)) {
        RB_FL_UNSET_RAW(obj, flags);
    }
}

__attribute__((__artificial__))
static inline void
rbimpl_fl_reverse_raw_raw(struct RBasic *obj, VALUE flags)
{
    obj->flags ^= flags;
}
__attribute__((__artificial__))
static inline void
RB_FL_REVERSE_RAW(VALUE obj, VALUE flags)
{
    ((void)0);
    rbimpl_fl_reverse_raw_raw(((struct RBasic *)(obj)), flags);
}
__attribute__((__artificial__))
static inline void
RB_FL_REVERSE(VALUE obj, VALUE flags)
{
    if (RB_FL_ABLE(obj)) {
        RB_FL_REVERSE_RAW(obj, flags);
    }
}
__attribute__((__pure__))
__attribute__((__artificial__))
__attribute__((__deprecated__ ("taintedness turned out to be a wrong idea.")))
static inline _Bool
RB_OBJ_TAINTABLE(VALUE obj)
{
    (void)obj;
    return 0;
}
__attribute__((__pure__))
__attribute__((__artificial__))
__attribute__((__deprecated__ ("taintedness turned out to be a wrong idea.")))
static inline VALUE
RB_OBJ_TAINTED_RAW(VALUE obj)
{
    (void)obj;
    return 0;
}
__attribute__((__pure__))
__attribute__((__artificial__))
__attribute__((__deprecated__ ("taintedness turned out to be a wrong idea.")))
static inline _Bool
RB_OBJ_TAINTED(VALUE obj)
{
    (void)obj;
    return 0;
}
__attribute__((__artificial__))
__attribute__((__deprecated__ ("taintedness turned out to be a wrong idea.")))
static inline void
RB_OBJ_TAINT_RAW(VALUE obj)
{
    (void)obj;
    return;
}
__attribute__((__artificial__))
__attribute__((__deprecated__ ("taintedness turned out to be a wrong idea.")))
static inline void
RB_OBJ_TAINT(VALUE obj)
{
    (void)obj;
    return;
}
__attribute__((__artificial__))
__attribute__((__deprecated__ ("taintedness turned out to be a wrong idea.")))
static inline void
RB_OBJ_INFECT_RAW(VALUE dst, VALUE src)
{
    (void)dst;
    (void)src;
    return;
}
__attribute__((__artificial__))
__attribute__((__deprecated__ ("taintedness turned out to be a wrong idea.")))
static inline void
RB_OBJ_INFECT(VALUE dst, VALUE src)
{
    (void)dst;
    (void)src;
    return;
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline VALUE
RB_OBJ_FROZEN_RAW(VALUE obj)
{
    return RB_FL_TEST_RAW(obj, RUBY_FL_FREEZE);
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_OBJ_FROZEN(VALUE obj)
{
    if (! RB_FL_ABLE(obj)) {
        return 1;
    }
    else {
        return RB_OBJ_FROZEN_RAW(obj);
    }
}
__attribute__((__artificial__))
static inline void
RB_OBJ_FREEZE_RAW(VALUE obj)
{
    RB_FL_SET_RAW(obj, RUBY_FL_FREEZE);
}

#pragma GCC visibility push(default)

void rb_obj_freeze_inline(VALUE obj);

#pragma GCC visibility pop

enum ruby_rstring_flags {
    RSTRING_NOEMBED = RUBY_FL_USER1,
    RSTRING_FSTR = RUBY_FL_USER17
};
struct RString {
    struct RBasic basic;
    long len;
    union {
        struct {
            char *ptr;
            union {
                long capa;
                VALUE shared;
            } aux;
        } heap;
        struct {
            char ary[1];
        } embed;
    } as;
};

#pragma GCC visibility push(default)

VALUE rb_str_to_str(VALUE obj);
VALUE rb_string_value(volatile VALUE *ptr);
char *rb_string_value_ptr(volatile VALUE *ptr);
char *rb_string_value_cstr(volatile VALUE *ptr);
VALUE rb_str_export(VALUE obj);
VALUE rb_str_export_locale(VALUE obj);
__attribute__((__error__ ("rb_check_safe_str() and Check_SafeStr() are obsolete; use StringValue() instead")))
void rb_check_safe_str(VALUE);
void rb_debug_rstring_null_ptr(const char *func);

#pragma GCC visibility pop

__attribute__((__pure__))
__attribute__((__artificial__))
static inline long
RSTRING_LEN(VALUE str)
{
    return ((struct RString *)(str))->len;
}

#pragma GCC diagnostic push

__attribute__((__pure__))
__attribute__((__artificial__))
static inline struct RString
rbimpl_rstring_getmem(VALUE str)
{
    ((void)0);
    if (RB_FL_ANY_RAW(str, RSTRING_NOEMBED)) {
        return *((struct RString *)(str));
    }
    else {
        struct RString retval;
        retval.len = RSTRING_LEN(str);
        retval.as.heap.ptr = ((struct RString *)(str))->as.embed.ary;
        return retval;
    }
}

#pragma GCC diagnostic pop

__attribute__((__artificial__))
static inline char *
RSTRING_PTR(VALUE str)
{
    char *ptr = rbimpl_rstring_getmem(str).as.heap.ptr;
    if (0 && (__builtin_expect(!!(! ptr), 0))) {
        rb_debug_rstring_null_ptr("RSTRING_PTR");
    }
    return ptr;
}
__attribute__((__artificial__))
static inline char *
RSTRING_END(VALUE str)
{
    struct RString buf = rbimpl_rstring_getmem(str);
    if (0 && (__builtin_expect(!!(! buf.as.heap.ptr), 0))) {
        rb_debug_rstring_null_ptr("RSTRING_END");
    }
    return &buf.as.heap.ptr[buf.len];
}
__attribute__((__artificial__))
static inline int
RSTRING_LENINT(VALUE str)
{
    return rb_long2int_inline(RSTRING_LEN(str));
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline VALUE
RB_CHR2FIX(unsigned char c)
{
    return RB_INT2FIX(c);
}
static inline char
rb_num2char_inline(VALUE x)
{
    if (RB_TYPE_P(x, RUBY_T_STRING) && (RSTRING_LEN(x)>=1))
        return RSTRING_PTR(x)[0];
    else
        return ((char)rb_num2int_inline(x));
}

#pragma GCC visibility push(default)

double rb_num2dbl(VALUE num);
__attribute__((__pure__))
double rb_float_value(VALUE num);
VALUE rb_float_new(double d);
VALUE rb_float_new_in_heap(double d);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_ll2inum(long long num);
VALUE rb_ull2inum(unsigned long long num);
long long rb_num2ll(VALUE num);
unsigned long long rb_num2ull(VALUE num);

#pragma GCC visibility pop

static inline VALUE
rb_ll2num_inline(long long n)
{
    if ((((n) < (0x7fffffffffffffffL / 2) + 1) && ((n) >= ((-0x7fffffffffffffffL - 1L) / 2)))) return RB_INT2FIX((long)n);
    return rb_ll2inum(n);
}
static inline VALUE
rb_ull2num_inline(unsigned long long n)
{
    if (((n) < (0x7fffffffffffffffL / 2) + 1)) return RB_INT2FIX((long)n);
    return rb_ull2inum(n);
}
static inline long long
rb_num2ll_inline(VALUE x)
{
    if (RB_FIXNUM_P(x))
        return rb_fix2long(x);
    else
        return rb_num2ll(x);
}
static inline unsigned long long
rb_num2ull_inline(VALUE x)
{
    if (RB_FIXNUM_P(x))
        return rb_fix2long(x);
    else
        return rb_num2ull(x);
}

#pragma GCC visibility push(default)

short rb_num2short(VALUE num);
unsigned short rb_num2ushort(VALUE num);
short rb_fix2short(VALUE num);
unsigned short rb_fix2ushort(VALUE num);

#pragma GCC visibility pop

static inline short
rb_num2short_inline(VALUE x)
{
    if (RB_FIXNUM_P(x))
        return rb_fix2short(x);
    else
        return rb_num2short(x);
}

#pragma GCC visibility push(default)

typedef unsigned long st_data_t;
typedef struct st_table st_table;
typedef st_data_t st_index_t;
typedef int st_compare_func(st_data_t, st_data_t);
typedef st_index_t st_hash_func(st_data_t);
typedef char st_check_for_sizeof_st_index_t[8 == (int)sizeof(st_index_t) ? 1 : -1];
struct st_hash_type {
    int (*compare)(st_data_t, st_data_t);
    st_index_t (*hash)(st_data_t);
};
typedef struct st_table_entry st_table_entry;
struct st_table_entry;
struct st_table {
    unsigned char entry_power, bin_power, size_ind;
    unsigned int rebuilds_num;
    const struct st_hash_type *type;
    st_index_t num_entries;
    st_index_t *bins;
    st_index_t entries_start, entries_bound;
    st_table_entry *entries;
};
enum st_retval {ST_CONTINUE, ST_STOP, ST_DELETE, ST_CHECK, ST_REPLACE};
size_t rb_st_table_size(const struct st_table *tbl);
st_table *rb_st_init_table(const struct st_hash_type *);
st_table *rb_st_init_table_with_size(const struct st_hash_type *, st_index_t);
st_table *rb_st_init_existing_table_with_size(st_table *tab, const struct st_hash_type *type, st_index_t size);
st_table *rb_st_init_numtable(void);
st_table *rb_st_init_numtable_with_size(st_index_t);
st_table *rb_st_init_strtable(void);
st_table *rb_st_init_strtable_with_size(st_index_t);
st_table *rb_st_init_strcasetable(void);
st_table *rb_st_init_strcasetable_with_size(st_index_t);
int rb_st_delete(st_table *, st_data_t *, st_data_t *);
int rb_st_delete_safe(st_table *, st_data_t *, st_data_t *, st_data_t);
int rb_st_shift(st_table *, st_data_t *, st_data_t *);
int rb_st_insert(st_table *, st_data_t, st_data_t);
int rb_st_insert2(st_table *, st_data_t, st_data_t, st_data_t (*)(st_data_t));
int rb_st_lookup(st_table *, st_data_t, st_data_t *);
int rb_st_get_key(st_table *, st_data_t, st_data_t *);
typedef int st_update_callback_func(st_data_t *key, st_data_t *value, st_data_t arg, int existing);
int rb_st_update(st_table *table, st_data_t key, st_update_callback_func *func, st_data_t arg);
typedef int st_foreach_callback_func(st_data_t, st_data_t, st_data_t);
typedef int st_foreach_check_callback_func(st_data_t, st_data_t, st_data_t, int);
int rb_st_foreach_with_replace(st_table *tab, st_foreach_check_callback_func *func, st_update_callback_func *replace, st_data_t arg);
int rb_st_foreach(st_table *, st_foreach_callback_func *, st_data_t);
int rb_st_foreach_check(st_table *, st_foreach_check_callback_func *, st_data_t, st_data_t);
st_index_t rb_st_keys(st_table *table, st_data_t *keys, st_index_t size);
st_index_t rb_st_keys_check(st_table *table, st_data_t *keys, st_index_t size, st_data_t never);
st_index_t rb_st_values(st_table *table, st_data_t *values, st_index_t size);
st_index_t rb_st_values_check(st_table *table, st_data_t *values, st_index_t size, st_data_t never);
void rb_st_add_direct(st_table *, st_data_t, st_data_t);
void rb_st_free_table(st_table *);
void rb_st_cleanup_safe(st_table *, st_data_t);
void rb_st_clear(st_table *);
st_table *rb_st_replace(st_table *new_tab, st_table *old_tab);
st_table *rb_st_copy(st_table *);
__attribute__((__const__)) int rb_st_numcmp(st_data_t, st_data_t);
__attribute__((__const__)) st_index_t rb_st_numhash(st_data_t);
__attribute__((__pure__)) int rb_st_locale_insensitive_strcasecmp(const char *s1, const char *s2);
__attribute__((__pure__)) int rb_st_locale_insensitive_strncasecmp(const char *s1, const char *s2, size_t n);
__attribute__((__pure__)) size_t rb_st_memsize(const st_table *);
__attribute__((__pure__)) st_index_t rb_st_hash(const void *ptr, size_t len, st_index_t h);
__attribute__((__const__)) st_index_t rb_st_hash_uint32(st_index_t h, uint32_t i);
__attribute__((__const__)) st_index_t rb_st_hash_uint(st_index_t h, st_index_t i);
__attribute__((__const__)) st_index_t rb_st_hash_end(st_index_t h);
__attribute__((__const__)) st_index_t rb_st_hash_start(st_index_t h);
void rb_hash_bulk_insert_into_st_table(long, const VALUE *, VALUE);

#pragma GCC visibility pop

__attribute__((__const__))

__attribute__((__artificial__))
static inline VALUE
RB_ST2FIX(st_data_t i)
{
    long x = i;
    if (x >= 0) {
        x &= (0x7fffffffffffffffL / 2);
    }
    else {
        x |= ((-0x7fffffffffffffffL - 1L) / 2);
    }
    ((void)0);
    unsigned long y = ((unsigned long)x);
    return RB_INT2FIX(y);
}

#pragma GCC visibility push(default)

__attribute__((__cold__))
__attribute__((__noreturn__))
void rb_memerror(void);
__attribute__((__pure__))
int rb_during_gc(void);
__attribute__((__nonnull__ (1)))
void rb_gc_mark_locations(const VALUE *start, const VALUE *end);
void rb_mark_tbl(struct st_table *tbl);
void rb_mark_tbl_no_pin(struct st_table *tbl);
void rb_mark_set(struct st_table *tbl);
void rb_mark_hash(struct st_table *tbl);
void rb_gc_update_tbl_refs(st_table *ptr);
void rb_gc_mark_maybe(VALUE obj);
void rb_gc_mark(VALUE obj);
void rb_gc_mark_movable(VALUE obj);
VALUE rb_gc_location(VALUE obj);
__attribute__((__deprecated__ ("this is now a no-op function")))
void rb_gc_force_recycle(VALUE obj);
void rb_gc(void);
void rb_gc_copy_finalizer(VALUE dst, VALUE src);
VALUE rb_gc_enable(void);
VALUE rb_gc_disable(void);
VALUE rb_gc_start(void);
VALUE rb_define_finalizer(VALUE obj, VALUE block);
VALUE rb_undefine_finalizer(VALUE obj);
size_t rb_gc_count(void);
size_t rb_gc_stat(VALUE key_or_buf);
VALUE rb_gc_latest_gc_info(VALUE key_or_buf);
void rb_gc_adjust_memory_usage(ssize_t diff);
void rb_gc_register_address(VALUE *valptr);
void rb_global_variable(VALUE *);
void rb_gc_unregister_address(VALUE *valptr);
void rb_gc_register_mark_object(VALUE object);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

void rb_gc_writebarrier(VALUE old, VALUE young);
void rb_gc_writebarrier_unprotect(VALUE obj);

#pragma GCC visibility pop

__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_OBJ_PROMOTED_RAW(VALUE obj)
{
    ((void)0);
    return RB_FL_ANY_RAW(obj, RUBY_FL_PROMOTED);
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RB_OBJ_PROMOTED(VALUE obj)
{
    if (! RB_FL_ABLE(obj)) {
        return 0;
    }
    else {
        return RB_OBJ_PROMOTED_RAW(obj);
    }
}
static inline VALUE
rb_obj_wb_unprotect(
    VALUE x,
    [[maybe_unused]]
    const char *filename,
    [[maybe_unused]]
    int line)
{
    rb_gc_writebarrier_unprotect(x);
    return x;
}
static inline VALUE
rb_obj_written(
    VALUE a,
    [[maybe_unused]]
    VALUE oldv,
    VALUE b,
    [[maybe_unused]]
    const char *filename,
    [[maybe_unused]]
    int line)
{
    if (!RB_SPECIAL_CONST_P(b)) {
        rb_gc_writebarrier(a, b);
    }
    return a;
}
static inline VALUE
rb_obj_write(
    VALUE a, VALUE *slot, VALUE b,
    [[maybe_unused]]
    const char *filename,
    [[maybe_unused]]
    int line)
{
    *slot = b;
    rb_obj_written(a, ((VALUE)RUBY_Qundef) , b, filename, line);
    return a;
}
enum ruby_rarray_flags {
    RARRAY_EMBED_FLAG = RUBY_FL_USER1,
    RARRAY_EMBED_LEN_MASK = RUBY_FL_USER9 | RUBY_FL_USER8 | RUBY_FL_USER7 | RUBY_FL_USER6 |
                                 RUBY_FL_USER5 | RUBY_FL_USER4 | RUBY_FL_USER3
};
enum ruby_rarray_consts {
    RARRAY_EMBED_LEN_SHIFT = RUBY_FL_USHIFT + 3
};
struct RArray {
    struct RBasic basic;
    union {
        struct {
            long len;
            union {
                long capa;
                const
                VALUE shared_root;
            } aux;
            const VALUE *ptr;
        } heap;
        const VALUE ary[1];
    } as;
};

#pragma GCC visibility push(default)

VALUE *rb_ary_ptr_use_start(VALUE ary);
void rb_ary_ptr_use_end(VALUE a);

#pragma GCC visibility pop

__attribute__((__pure__))
__attribute__((__artificial__))
static inline long
RARRAY_EMBED_LEN(VALUE ary)
{
    ((void)0);
    ((void)0);
    VALUE f = ((struct RBasic *)(ary))->flags;
    f &= RARRAY_EMBED_LEN_MASK;
    f >>= RARRAY_EMBED_LEN_SHIFT;
    return ((long)f);
}
__attribute__((__pure__))
static inline long
rb_array_len(VALUE a)
{
    ((void)0);
    if (RB_FL_ANY_RAW(a, RARRAY_EMBED_FLAG)) {
        return RARRAY_EMBED_LEN(a);
    }
    else {
        return ((struct RArray *)(a))->as.heap.len;
    }
}
__attribute__((__artificial__))
static inline int
RARRAY_LENINT(VALUE ary)
{
    return rb_long2int_inline(rb_array_len(ary));
}
__attribute__((__pure__))
static inline const VALUE *
rb_array_const_ptr(VALUE a)
{
    ((void)0);
    if (RB_FL_ANY_RAW(a, RARRAY_EMBED_FLAG)) {
        return (((struct RArray *)(a))->as.ary);
    }
    else {
        return (((struct RArray *)(a))->as.heap.ptr);
    }
}
static inline VALUE *
RARRAY_PTR(VALUE ary)
{
    ((void)0);
    VALUE tmp = (1 ? rb_obj_wb_unprotect(ary, "/home/joe/.rbenv/versions/3.3.0/include/ruby-3.3.0/ruby/internal/core/rarray.h", 370) : ary);
    return ((VALUE *)rb_array_const_ptr(tmp));
}
static inline void
RARRAY_ASET(VALUE ary, long i, VALUE v)
{
    do { ((void)0); const VALUE rbimpl_ary = (ary); VALUE *ptr = rb_ary_ptr_use_start(rbimpl_ary); (rb_obj_write((VALUE)(ary), (VALUE *)(&ptr[i]), (VALUE)(v), "/home/joe/.rbenv/versions/3.3.0/include/ruby-3.3.0/ruby/internal/core/rarray.h", 389)); rb_ary_ptr_use_end(rbimpl_ary); } while (0);
}

#pragma GCC visibility push(default)

int rb_big_sign(VALUE num);

#pragma GCC visibility pop

static inline _Bool
RBIGNUM_POSITIVE_P(VALUE b)
{
    ((void)0);
    return rb_big_sign(b);
}
static inline _Bool
RBIGNUM_NEGATIVE_P(VALUE b)
{
    ((void)0);
    return ! RBIGNUM_POSITIVE_P(b);
}
enum ruby_rmodule_flags {
    RMODULE_IS_REFINEMENT = RUBY_FL_USER3
};
struct RClass;

#pragma GCC visibility push(default)

VALUE rb_class_get_superclass(VALUE klass);

#pragma GCC visibility pop

typedef void (*RUBY_DATA_FUNC)(void*);
struct RData {
    struct RBasic basic;
    RUBY_DATA_FUNC dmark;
    RUBY_DATA_FUNC dfree;
    void *data;
};

#pragma GCC visibility push(default)

VALUE rb_data_object_wrap(VALUE klass, void *datap, RUBY_DATA_FUNC dmark, RUBY_DATA_FUNC dfree);
VALUE rb_data_object_zalloc(VALUE klass, size_t size, RUBY_DATA_FUNC dmark, RUBY_DATA_FUNC dfree);
extern VALUE rb_cObject;

#pragma GCC visibility pop

__attribute__((__warning__ ("untyped Data is unsafe; use TypedData instead"))) __attribute__((__deprecated__ ("by TypedData")))
static inline VALUE
rb_data_object_wrap_warning(VALUE klass, void *ptr, RUBY_DATA_FUNC mark, RUBY_DATA_FUNC free)
{
    return rb_data_object_wrap(klass, ptr, mark, free);
}
static inline void *
rb_data_object_get(VALUE obj)
{
    Check_Type(obj, RUBY_T_DATA);
    return ((struct RData *)(obj))->data;
}
__attribute__((__warning__ ("untyped Data is unsafe; use TypedData instead"))) __attribute__((__deprecated__ ("by TypedData")))
static inline void *
rb_data_object_get_warning(VALUE obj)
{
    return rb_data_object_get(obj);
}
static inline VALUE
rb_data_object_make(VALUE klass, RUBY_DATA_FUNC mark_func, RUBY_DATA_FUNC free_func, void **datap, size_t size)
{
    VALUE result = rb_data_object_zalloc( (klass), (size), ((void (*)(void *))(mark_func)), ((void (*)(void *))(free_func))); (*datap) = ((void *)((struct RData *)(result))->data); ((void)(*datap));
    return result;
}
__attribute__((__deprecated__ ("by: rb_data_object_wrap")))
static inline VALUE
rb_data_object_alloc(VALUE klass, void *data, RUBY_DATA_FUNC dmark, RUBY_DATA_FUNC dfree)
{
    return rb_data_object_wrap(klass, data, dmark, dfree);
}
struct rb_io;
struct RFile {
    struct RBasic basic;
    struct rb_io *fptr;
};

#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
void ruby_sysinit(int *argc, char ***argv);
void ruby_init(void);
void* ruby_options(int argc, char** argv);
int ruby_executable_node(void *n, int *status);
int ruby_run_node(void *n);
void ruby_show_version(void);
void ruby_show_copyright(void);
void ruby_init_stack(volatile VALUE *addr);
int ruby_setup(void);
int ruby_cleanup(int ex);
void ruby_finalize(void);
__attribute__((__noreturn__))
void ruby_stop(int);
int ruby_stack_check(void);
size_t ruby_stack_length(VALUE **topnotch);
int ruby_exec_node(void *n);
void ruby_script(const char* name);
void ruby_set_script_name(VALUE name);
void ruby_prog_init(void);
void ruby_set_argv(int argc, char **argv);
void *ruby_process_options(int argc, char **argv);
void ruby_init_loadpath(void);
void ruby_incpush(const char *path);
void ruby_sig_finalize(void);

#pragma GCC visibility pop

__attribute__((__deprecated__ ("only for internal use"))) void rb_clear_constant_cache(void);
struct st_table;

#pragma GCC visibility push(default)

size_t rb_hash_size_num(VALUE hash);
struct st_table *rb_hash_tbl(VALUE hash, const char *file, int line);
VALUE rb_hash_set_ifnone(VALUE hash, VALUE ifnone);

#pragma GCC visibility pop

enum ruby_robject_flags {
    ROBJECT_EMBED = RUBY_FL_USER1
};
struct st_table;
struct RObject {
    struct RBasic basic;
    union {
        struct {
            VALUE *ivptr;
            struct rb_id_table *iv_index_tbl;
        } heap;
        VALUE ary[1];
    } as;
};
__attribute__((__pure__))
__attribute__((__artificial__))
static inline VALUE *
ROBJECT_IVPTR(VALUE obj)
{
    ((void)0);
    struct RObject *const ptr = ((struct RObject *)(obj));
    if (RB_FL_ANY_RAW(obj, ROBJECT_EMBED)) {
        return ptr->as.ary;
    }
    else {
        return ptr->as.heap.ivptr;
    }
}
struct re_patter_buffer;
struct RRegexp {
    struct RBasic basic;
    struct re_pattern_buffer *ptr;
    const VALUE src;
    unsigned long usecnt;
};
__attribute__((__pure__))
__attribute__((__artificial__))
static inline VALUE
RREGEXP_SRC(VALUE rexp)
{
    ((void)0);
    VALUE ret = ((struct RRegexp *)(rexp))->src;
    ((void)0);
    return ret;
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline char *
RREGEXP_SRC_PTR(VALUE rexp)
{
    return RSTRING_PTR(RREGEXP_SRC(rexp));
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline long
RREGEXP_SRC_LEN(VALUE rexp)
{
    return RSTRING_LEN(RREGEXP_SRC(rexp));
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline char *
RREGEXP_SRC_END(VALUE rexp)
{
    return RSTRING_END(RREGEXP_SRC(rexp));
}

#pragma GCC visibility push(default)

VALUE rb_struct_size(VALUE st);
VALUE rb_struct_aref(VALUE st, VALUE k);
VALUE rb_struct_aset(VALUE st, VALUE k, VALUE v);

#pragma GCC visibility pop

__attribute__((__artificial__))
static inline long
RSTRUCT_LEN(VALUE st)
{
    ((void)0);
    return rb_num2long_inline(rb_struct_size(st));
}
__attribute__((__artificial__))
static inline VALUE
RSTRUCT_SET(VALUE st, int k, VALUE v)
{
    ((void)0);
    return rb_struct_aset(st, rb_int2num_inline(k), (v));
}
__attribute__((__artificial__))
static inline VALUE
RSTRUCT_GET(VALUE st, int k)
{
    ((void)0);
    return rb_struct_aref(st, rb_int2num_inline(k));
}
enum

rbimpl_typeddata_flags {
    RUBY_TYPED_FREE_IMMEDIATELY = 1,
    RUBY_TYPED_EMBEDDABLE = 2,
    RUBY_TYPED_FROZEN_SHAREABLE = RUBY_FL_SHAREABLE,
    RUBY_TYPED_WB_PROTECTED = RUBY_FL_WB_PROTECTED,
    RUBY_TYPED_UNUSED = RUBY_FL_UNUSED6,
    RUBY_TYPED_DECL_MARKING = RUBY_FL_USER2
};
typedef struct rb_data_type_struct rb_data_type_t;
struct rb_data_type_struct {
    const char *wrap_struct_name;
    struct {
        RUBY_DATA_FUNC dmark;
        RUBY_DATA_FUNC dfree;
        size_t (*dsize)(const void *);
        RUBY_DATA_FUNC dcompact;
        void *reserved[1];
    } function;
    const rb_data_type_t *parent;
    void *data;
    VALUE flags;
};
struct RTypedData {
    struct RBasic basic;
    const rb_data_type_t *const type;
    const VALUE typed_flag;
    void *data;
};

#pragma GCC visibility push(default)

__attribute__((__nonnull__ (3)))
VALUE rb_data_typed_object_wrap(VALUE klass, void *datap, const rb_data_type_t *type);
VALUE rb_data_typed_object_zalloc(VALUE klass, size_t size, const rb_data_type_t *type);
int rb_typeddata_inherited_p(const rb_data_type_t *child, const rb_data_type_t *parent);
int rb_typeddata_is_kind_of(VALUE obj, const rb_data_type_t *data_type);
void *rb_check_typeddata(VALUE obj, const rb_data_type_t *data_type);

#pragma GCC visibility pop

static inline _Bool
RTYPEDDATA_EMBEDDED_P(VALUE obj)
{
    return ((struct RTypedData *)(obj))->typed_flag & 2;
}
static inline void *
RTYPEDDATA_GET_DATA(VALUE obj)
{
    const size_t embedded_typed_data_size = sizeof(struct RTypedData) - sizeof(void *);
    return RTYPEDDATA_EMBEDDED_P(obj) ? (char *)obj + embedded_typed_data_size : ((struct RTypedData *)(obj))->data;
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
rbimpl_rtypeddata_p(VALUE obj)
{
    VALUE typed_flag = ((struct RTypedData *)(obj))->typed_flag;
    return typed_flag != 0 && typed_flag <= 3;
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline _Bool
RTYPEDDATA_P(VALUE obj)
{
    return rbimpl_rtypeddata_p(obj);
}
__attribute__((__pure__))
__attribute__((__artificial__))
static inline const struct rb_data_type_struct *
RTYPEDDATA_TYPE(VALUE obj)
{
    return ((struct RTypedData *)(obj))->type;
}
static inline VALUE
rb_data_typed_object_make(VALUE klass, const rb_data_type_t *type, void **datap, size_t size)
{
    VALUE result = rb_data_typed_object_zalloc(klass, size, type); (*datap) = (void *)RTYPEDDATA_GET_DATA(result); ((void)(*datap));
    return result;
}
__attribute__((__deprecated__ ("by: rb_data_typed_object_wrap")))
static inline VALUE
rb_data_typed_object_alloc(VALUE klass, void *datap, const rb_data_type_t *type)
{
    return rb_data_typed_object_wrap(klass, datap, type);
}

enum
{
  _ISupper = ((0) < 8 ? ((1 << (0)) << 8) : ((1 << (0)) >> 8)),
  _ISlower = ((1) < 8 ? ((1 << (1)) << 8) : ((1 << (1)) >> 8)),
  _ISalpha = ((2) < 8 ? ((1 << (2)) << 8) : ((1 << (2)) >> 8)),
  _ISdigit = ((3) < 8 ? ((1 << (3)) << 8) : ((1 << (3)) >> 8)),
  _ISxdigit = ((4) < 8 ? ((1 << (4)) << 8) : ((1 << (4)) >> 8)),
  _ISspace = ((5) < 8 ? ((1 << (5)) << 8) : ((1 << (5)) >> 8)),
  _ISprint = ((6) < 8 ? ((1 << (6)) << 8) : ((1 << (6)) >> 8)),
  _ISgraph = ((7) < 8 ? ((1 << (7)) << 8) : ((1 << (7)) >> 8)),
  _ISblank = ((8) < 8 ? ((1 << (8)) << 8) : ((1 << (8)) >> 8)),
  _IScntrl = ((9) < 8 ? ((1 << (9)) << 8) : ((1 << (9)) >> 8)),
  _ISpunct = ((10) < 8 ? ((1 << (10)) << 8) : ((1 << (10)) >> 8)),
  _ISalnum = ((11) < 8 ? ((1 << (11)) << 8) : ((1 << (11)) >> 8))
};
extern const unsigned short int **__ctype_b_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_tolower_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_toupper_loc (void)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int isalnum (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha (int) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit (int) __attribute__ ((__nothrow__ , __leaf__));
extern int islower (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint (int) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit (int) __attribute__ ((__nothrow__ , __leaf__));
extern int tolower (int __c) __attribute__ ((__nothrow__ , __leaf__));
extern int toupper (int __c) __attribute__ ((__nothrow__ , __leaf__));
extern int isblank (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isctype (int __c, int __mask) __attribute__ ((__nothrow__ , __leaf__));
extern int isascii (int __c) __attribute__ ((__nothrow__ , __leaf__));
extern int toascii (int __c) __attribute__ ((__nothrow__ , __leaf__));
extern int _toupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int _tolower (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isalnum_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int islower_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isblank_l (int, locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int __tolower_l (int __c, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int tolower_l (int __c, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int __toupper_l (int __c, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int toupper_l (int __c, locale_t __l) __attribute__ ((__nothrow__ , __leaf__));


#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
int rb_st_locale_insensitive_strcasecmp(const char *s1, const char *s2);
__attribute__((__nonnull__ ()))
int rb_st_locale_insensitive_strncasecmp(const char *s1, const char *s2, size_t n);
__attribute__((__nonnull__ (1)))
unsigned long ruby_strtoul(const char *str, char **endptr, int base);

#pragma GCC visibility pop

__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isascii(int c)
{
    return '\0' <= c && c <= '\x7f';
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isupper(int c)
{
    return 'A' <= c && c <= 'Z';
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_islower(int c)
{
    return 'a' <= c && c <= 'z';
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isalpha(int c)
{
    return rb_isupper(c) || rb_islower(c);
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isdigit(int c)
{
    return '0' <= c && c <= '9';
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isalnum(int c)
{
    return rb_isalpha(c) || rb_isdigit(c);
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isxdigit(int c)
{
    return rb_isdigit(c) || ('A' <= c && c <= 'F') || ('a' <= c && c <= 'f');
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isblank(int c)
{
    return c == ' ' || c == '\t';
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isspace(int c)
{
    return c == ' ' || ('\t' <= c && c <= '\r');
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_iscntrl(int c)
{
    return ('\0' <= c && c < ' ') || c == '\x7f';
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isprint(int c)
{
    return ' ' <= c && c <= '\x7e';
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_ispunct(int c)
{
    return !rb_isalnum(c);
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_isgraph(int c)
{
    return '!' <= c && c <= '\x7e';
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_tolower(int c)
{
    return rb_isupper(c) ? (c|0x20) : c;
}
__attribute__((__const__))

__attribute__((__artificial__))
static inline int
rb_toupper(int c)
{
    return rb_islower(c) ? (c&0x5f) : c;
}

#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
VALUE rb_eval_string(const char *str);
__attribute__((__nonnull__ (1)))
VALUE rb_eval_string_protect(const char *str, int *state);
__attribute__((__nonnull__ (1)))
VALUE rb_eval_string_wrap(const char *str, int *state);
VALUE rb_funcall(VALUE recv, ID mid, int n, ...);
VALUE rb_funcallv(VALUE recv, ID mid, int argc, const VALUE *argv);
VALUE rb_funcallv_kw(VALUE recv, ID mid, int argc, const VALUE *argv, int kw_splat);
VALUE rb_funcallv_public(VALUE recv, ID mid, int argc, const VALUE *argv);
VALUE rb_funcallv_public_kw(VALUE recv, ID mid, int argc, const VALUE *argv, int kw_splat);
VALUE rb_funcall_passing_block(VALUE recv, ID mid, int argc, const VALUE *argv);
VALUE rb_funcall_passing_block_kw(VALUE recv, ID mid, int argc, const VALUE *argv, int kw_splat);
VALUE rb_funcall_with_block(VALUE recv, ID mid, int argc, const VALUE *argv, VALUE procval);
VALUE rb_funcall_with_block_kw(VALUE recv, ID mid, int argc, const VALUE *argv, VALUE procval, int kw_splat);
VALUE rb_call_super(int argc, const VALUE *argv);
VALUE rb_call_super_kw(int argc, const VALUE *argv, int kw_splat);
VALUE rb_current_receiver(void);
__attribute__((__nonnull__ (2)))
int rb_get_kwargs(VALUE keyword_hash, const ID *table, int required, int optional, VALUE *values);
__attribute__((__nonnull__ ()))
VALUE rb_extract_keywords(VALUE *orighash);

#pragma GCC visibility pop

typedef uint32_t rb_event_flag_t;
typedef void (*rb_event_hook_func_t)(rb_event_flag_t evflag, VALUE data, VALUE self, ID mid, VALUE klass);

#pragma GCC visibility push(default)

void rb_add_event_hook(rb_event_hook_func_t func, rb_event_flag_t events, VALUE data);
int rb_remove_event_hook(rb_event_hook_func_t func);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

typedef int ruby_glob_func(const char *path, VALUE arg, void *enc);
__attribute__((__nonnull__ ()))
void rb_glob(const char *pattern, void (*func)(const char *path, VALUE arg, void *enc), VALUE arg);
__attribute__((__nonnull__ ()))
int ruby_glob(const char *pattern, int flags, ruby_glob_func *func, VALUE arg);
__attribute__((__nonnull__ ()))
int ruby_brace_glob(const char *pattern, int flags, ruby_glob_func *func, VALUE arg);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

extern VALUE rb_mKernel;
extern VALUE rb_mComparable;
extern VALUE rb_mEnumerable;
extern VALUE rb_mErrno;
extern VALUE rb_mFileTest;
extern VALUE rb_mGC;
extern VALUE rb_mMath;
extern VALUE rb_mProcess;
extern VALUE rb_mWaitReadable;
extern VALUE rb_mWaitWritable;
extern VALUE rb_cBasicObject;
extern VALUE rb_cObject;
extern VALUE rb_cArray;
extern VALUE rb_cBinding;
extern VALUE rb_cClass;
extern VALUE rb_cDir;
extern VALUE rb_cEncoding;
extern VALUE rb_cEnumerator;
extern VALUE rb_cFalseClass;
extern VALUE rb_cFile;
extern VALUE rb_cComplex;
extern VALUE rb_cFloat;
extern VALUE rb_cHash;
extern VALUE rb_cIO;
extern VALUE rb_cInteger;
extern VALUE rb_cMatch;
extern VALUE rb_cMethod;
extern VALUE rb_cModule;
extern VALUE rb_cRefinement;
extern VALUE rb_cNameErrorMesg;
extern VALUE rb_cNilClass;
extern VALUE rb_cNumeric;
extern VALUE rb_cProc;
extern VALUE rb_cRandom;
extern VALUE rb_cRange;
extern VALUE rb_cRational;
extern VALUE rb_cRegexp;
extern VALUE rb_cStat;
extern VALUE rb_cString;
extern VALUE rb_cStruct;
extern VALUE rb_cSymbol;
extern VALUE rb_cThread;
extern VALUE rb_cTime;
extern VALUE rb_cTrueClass;
extern VALUE rb_cUnboundMethod;
extern VALUE rb_eException;
extern VALUE rb_eStandardError;
extern VALUE rb_eSystemExit;
extern VALUE rb_eInterrupt;
extern VALUE rb_eSignal;
extern VALUE rb_eFatal;
extern VALUE rb_eArgError;
extern VALUE rb_eEOFError;
extern VALUE rb_eIndexError;
extern VALUE rb_eStopIteration;
extern VALUE rb_eKeyError;
extern VALUE rb_eRangeError;
extern VALUE rb_eIOError;
extern VALUE rb_eRuntimeError;
extern VALUE rb_eFrozenError;
extern VALUE rb_eSecurityError;
extern VALUE rb_eSystemCallError;
extern VALUE rb_eThreadError;
extern VALUE rb_eTypeError;
extern VALUE rb_eZeroDivError;
extern VALUE rb_eNotImpError;
extern VALUE rb_eNoMemError;
extern VALUE rb_eNoMethodError;
extern VALUE rb_eFloatDomainError;
extern VALUE rb_eLocalJumpError;
extern VALUE rb_eSysStackError;
extern VALUE rb_eRegexpError;
extern VALUE rb_eEncodingError;
extern VALUE rb_eEncCompatError;
extern VALUE rb_eNoMatchingPatternError;
extern VALUE rb_eNoMatchingPatternKeyError;
extern VALUE rb_eScriptError;
extern VALUE rb_eNameError;
extern VALUE rb_eSyntaxError;
extern VALUE rb_eLoadError;
extern VALUE rb_eMathDomainError;
extern VALUE rb_stdin;
extern VALUE rb_stdout;
extern VALUE rb_stderr;
__attribute__((__pure__))
static inline VALUE
rb_class_of(VALUE obj)
{
    if (! RB_SPECIAL_CONST_P(obj)) {
        return RBASIC_CLASS(obj);
    }
    else if (obj == ((VALUE)RUBY_Qfalse)) {
        return rb_cFalseClass;
    }
    else if (obj == ((VALUE)RUBY_Qnil)) {
        return rb_cNilClass;
    }
    else if (obj == ((VALUE)RUBY_Qtrue)) {
        return rb_cTrueClass;
    }
    else if (RB_FIXNUM_P(obj)) {
        return rb_cInteger;
    }
    else if (RB_STATIC_SYM_P(obj)) {
        return rb_cSymbol;
    }
    else if (RB_FLONUM_P(obj)) {
        return rb_cFloat;
    }
    __builtin_unreachable();
}

#pragma GCC visibility pop


#pragma GCC visibility push(default)

typedef VALUE rb_block_call_func(VALUE yielded_arg, VALUE callback_arg, int argc, const VALUE *argv, VALUE blockarg);
typedef rb_block_call_func *rb_block_call_func_t;
VALUE rb_each(VALUE obj);
VALUE rb_yield(VALUE val);
VALUE rb_yield_values(int n, ...);
VALUE rb_yield_values2(int n, const VALUE *argv);
VALUE rb_yield_values_kw(int n, const VALUE *argv, int kw_splat);
VALUE rb_yield_splat(VALUE ary);
VALUE rb_yield_splat_kw(VALUE ary, int kw_splat);
VALUE rb_yield_block(VALUE yielded_arg, VALUE callback_arg, int argc, const VALUE *argv, VALUE blockarg);
int rb_keyword_given_p(void);
int rb_block_given_p(void);
void rb_need_block(void);
__attribute__((__deprecated__ ("by: rb_block_call since 1.9")))
VALUE rb_iterate(VALUE (*func1)(VALUE), VALUE data1, rb_block_call_func_t proc, VALUE data2);
VALUE rb_block_call(VALUE obj, ID mid, int argc, const VALUE *argv, rb_block_call_func_t proc, VALUE data2);
VALUE rb_block_call_kw(VALUE obj, ID mid, int argc, const VALUE *argv, rb_block_call_func_t proc, VALUE data2, int kw_splat);
VALUE rb_rescue(VALUE (*b_proc)(VALUE), VALUE data1, VALUE (*r_proc)(VALUE, VALUE), VALUE data2);
VALUE rb_rescue2(VALUE (*b_proc)(VALUE), VALUE data1, VALUE (*r_proc)(VALUE, VALUE), VALUE data2, ...);
VALUE rb_vrescue2(VALUE (*b_proc)(VALUE), VALUE data1, VALUE (*r_proc)(VALUE, VALUE), VALUE data2, va_list ap);
VALUE rb_ensure(VALUE (*b_proc)(VALUE), VALUE data1, VALUE (*e_proc)(VALUE), VALUE data2);
VALUE rb_catch(const char *tag, rb_block_call_func_t func, VALUE data);
VALUE rb_catch_obj(VALUE tag, rb_block_call_func_t func, VALUE data);
__attribute__((__noreturn__))
void rb_throw(const char *tag, VALUE val);
__attribute__((__noreturn__))
void rb_throw_obj(VALUE tag, VALUE val);

#pragma GCC visibility pop

struct rbimpl_size_mul_overflow_tag {
    _Bool left;
    size_t right;
};

#pragma GCC visibility push(default)

__attribute__((__malloc__))
__attribute__((__returns_nonnull__))
__attribute__((__alloc_size__ (2)))
__attribute__((__nonnull__ ()))
void *rb_alloc_tmp_buffer(volatile VALUE *store, long len);
__attribute__((__malloc__))
__attribute__((__returns_nonnull__))
__attribute__((__alloc_size__ (2,3)))
__attribute__((__nonnull__ ()))
void *rb_alloc_tmp_buffer_with_count(volatile VALUE *store, size_t len,size_t count);
void rb_free_tmp_buffer(volatile VALUE *store);
__attribute__((__noreturn__))
void ruby_malloc_size_overflow(size_t x, size_t y);

#pragma GCC visibility pop

static inline int
rb_mul_size_overflow(size_t a, size_t b, size_t max, size_t *c)
{
    __extension__ unsigned __int128 da, db, c2;
    da = a;
    db = b;
    c2 = da * db;
    if (c2 > max) return 1;
    *c = ((size_t)c2);
    return 0;
}

__attribute__((__const__))
static inline struct rbimpl_size_mul_overflow_tag
rbimpl_size_mul_overflow(size_t x, size_t y)
{
    struct rbimpl_size_mul_overflow_tag ret = { 0, 0, };
    ret.left = __builtin_mul_overflow(x, y, &ret.right);
    return ret;
}
static inline size_t
rbimpl_size_mul_or_raise(size_t x, size_t y)
{
    struct rbimpl_size_mul_overflow_tag size =
        rbimpl_size_mul_overflow(x, y);
    if ((__builtin_expect(!!(! size.left), 1))) {
        return size.right;
    }
    else {
        ruby_malloc_size_overflow(x, y);
        __builtin_unreachable();
    }
}
static inline void *
rb_alloc_tmp_buffer2(volatile VALUE *store, long count, size_t elsize)
{
    const size_t total_size = rbimpl_size_mul_or_raise(count, elsize);
    const size_t cnt = (total_size + sizeof(VALUE) - 1) / sizeof(VALUE);
    return rb_alloc_tmp_buffer_with_count(store, total_size, cnt);
}

#pragma GCC visibility push(default)


__attribute__((__nonnull__ (1)))
__attribute__((__returns_nonnull__))
static inline void *
ruby_nonempty_memcpy(void *dest, const void *src, size_t n)
{
    if (n) {
        return memcpy(dest, src, n);
    }
    else {
        return dest;
    }
}

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
VALUE rb_define_class(const char *name, VALUE super);
__attribute__((__nonnull__ ()))
VALUE rb_define_module(const char *name);
__attribute__((__nonnull__ ()))
VALUE rb_define_class_under(VALUE outer, const char *name, VALUE super);
__attribute__((__nonnull__ ()))
VALUE rb_define_module_under(VALUE outer, const char *name);
void rb_include_module(VALUE klass, VALUE module);
void rb_extend_object(VALUE obj, VALUE mod);
void rb_prepend_module(VALUE klass, VALUE module);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_newobj(void);
VALUE rb_newobj_of(VALUE klass, VALUE flags);
VALUE rb_obj_setup(VALUE obj, VALUE klass, VALUE type);
VALUE rb_obj_class(VALUE obj);
VALUE rb_singleton_class_clone(VALUE obj);
void rb_singleton_class_attached(VALUE klass, VALUE obj);
void rb_copy_generic_ivar(VALUE clone, VALUE obj);

#pragma GCC visibility pop

__attribute__((__deprecated__ ("This is no longer how Object#clone works.")))
static inline void
rb_clone_setup(VALUE clone, VALUE obj)
{
    (void)clone;
    (void)obj;
    return;
}
__attribute__((__deprecated__ ("This is no longer how Object#dup works.")))
static inline void
rb_dup_setup(VALUE dup, VALUE obj)
{
    (void)dup;
    (void)obj;
    return;
}

#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))

void rb_mem_clear(VALUE *buf, long len)
   
    ;
VALUE rb_assoc_new(VALUE car, VALUE cdr);
VALUE rb_check_array_type(VALUE obj);
VALUE rb_ary_new(void);
VALUE rb_ary_new_capa(long capa);
VALUE rb_ary_new_from_args(long n, ...);
VALUE rb_ary_new_from_values(long n, const VALUE *elts);
VALUE rb_ary_hidden_new(long capa);
void rb_ary_free(VALUE ary);
void rb_ary_modify(VALUE ary);
VALUE rb_ary_freeze(VALUE obj);
__attribute__((__pure__))
VALUE rb_ary_shared_with_p(VALUE lhs, VALUE rhs);
VALUE rb_ary_aref(int argc, const VALUE *argv, VALUE ary);
VALUE rb_ary_subseq(VALUE ary, long beg, long len);
void rb_ary_store(VALUE ary, long key, VALUE val);
VALUE rb_ary_dup(VALUE ary);
VALUE rb_ary_resurrect(VALUE ary);
VALUE rb_ary_to_ary(VALUE obj);
VALUE rb_ary_to_s(VALUE ary);
VALUE rb_ary_cat(VALUE ary, const VALUE *train, long len);
VALUE rb_ary_push(VALUE ary, VALUE elem);
VALUE rb_ary_pop(VALUE ary);
VALUE rb_ary_shift(VALUE ary);
VALUE rb_ary_unshift(VALUE ary, VALUE elem);
__attribute__((__pure__))
VALUE rb_ary_entry(VALUE ary, long off);
VALUE rb_ary_each(VALUE ary);
VALUE rb_ary_join(VALUE ary, VALUE sep);
VALUE rb_ary_reverse(VALUE ary);
VALUE rb_ary_rotate(VALUE ary, long rot);
VALUE rb_ary_sort(VALUE ary);
VALUE rb_ary_sort_bang(VALUE ary);
VALUE rb_ary_delete(VALUE ary, VALUE elem);
VALUE rb_ary_delete_at(VALUE ary, long pos);
VALUE rb_ary_clear(VALUE ary);
VALUE rb_ary_plus(VALUE lhs, VALUE rhs);
VALUE rb_ary_concat(VALUE lhs, VALUE rhs);
VALUE rb_ary_assoc(VALUE alist, VALUE key);
VALUE rb_ary_rassoc(VALUE alist, VALUE key);
VALUE rb_ary_includes(VALUE ary, VALUE elem);
VALUE rb_ary_cmp(VALUE lhs, VALUE rhs);
VALUE rb_ary_replace(VALUE copy, VALUE orig);
VALUE rb_get_values_at(VALUE obj, long olen, int argc, const VALUE *argv, VALUE (*func)(VALUE obj, long oidx));
VALUE rb_ary_resize(VALUE ary, long len);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_exc_new(VALUE etype, const char *ptr, long len);
__attribute__((__nonnull__ ()))
VALUE rb_exc_new_cstr(VALUE etype, const char *str);
VALUE rb_exc_new_str(VALUE etype, VALUE str);
__attribute__((__noreturn__))
__attribute__((__nonnull__ (1)))
__attribute__((__format__(__printf__, 1, 2)))
void rb_loaderror(const char *fmt, ...);
__attribute__((__noreturn__))
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 3)))
void rb_loaderror_with_path(VALUE path, const char *fmt, ...);
__attribute__((__noreturn__))
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 3)))
void rb_name_error(ID name, const char *fmt, ...);
__attribute__((__noreturn__))
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 3)))
void rb_name_error_str(VALUE name, const char *fmt, ...);
__attribute__((__noreturn__))
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 3)))
void rb_frozen_error_raise(VALUE recv, const char *fmt, ...);
__attribute__((__noreturn__))
__attribute__((__nonnull__ ()))
void rb_invalid_str(const char *str, const char *type);
__attribute__((__noreturn__))
__attribute__((__nonnull__ ()))
void rb_error_frozen(const char *what);
__attribute__((__noreturn__))
void rb_error_frozen_object(VALUE what);
void rb_check_frozen(VALUE obj);
void rb_check_copyable(VALUE obj, VALUE orig);
__attribute__((__noreturn__))
void rb_error_arity(int argc, int min, int max);

#pragma GCC visibility pop

static inline void
rb_check_frozen_inline(VALUE obj)
{
    if ((__builtin_expect(!!(RB_OBJ_FROZEN(obj)), 0))) {
        rb_error_frozen_object(obj);
    }
}
static inline int
rb_check_arity(int argc, int min, int max)
{
    if ((argc < min) || (max != (-1) && argc > max))
        rb_error_arity(argc, min, max);
    return argc;
}

#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
void rb_st_foreach_safe(struct st_table *st, st_foreach_callback_func *func, st_data_t arg);
VALUE rb_check_hash_type(VALUE obj);
__attribute__((__nonnull__ ()))
void rb_hash_foreach(VALUE hash, int (*func)(VALUE key, VALUE val, VALUE arg), VALUE arg);
VALUE rb_hash(VALUE obj);
VALUE rb_hash_new(void);
VALUE rb_hash_new_capa(long capa);
VALUE rb_hash_dup(VALUE hash);
VALUE rb_hash_freeze(VALUE obj);
VALUE rb_hash_aref(VALUE hash, VALUE key);
VALUE rb_hash_lookup(VALUE hash, VALUE key);
VALUE rb_hash_lookup2(VALUE hash, VALUE key, VALUE def);
VALUE rb_hash_fetch(VALUE hash, VALUE key);
VALUE rb_hash_aset(VALUE hash, VALUE key, VALUE val);
VALUE rb_hash_clear(VALUE hash);
VALUE rb_hash_delete_if(VALUE hash);
VALUE rb_hash_delete(VALUE hash, VALUE key);
void rb_hash_bulk_insert(long argc, const VALUE *argv, VALUE hash);
typedef VALUE rb_hash_update_func(VALUE newkey, VALUE oldkey, VALUE value);
VALUE rb_hash_update_by(VALUE hash1, VALUE hash2, rb_hash_update_func *func);
int rb_path_check(const char *path);
VALUE rb_env_clear(void);
VALUE rb_hash_size(VALUE hash);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_block_proc(void);
VALUE rb_block_lambda(void);
VALUE rb_proc_new(rb_block_call_func_t func, VALUE callback_arg);
VALUE rb_obj_is_proc(VALUE recv);
VALUE rb_proc_call(VALUE recv, VALUE args);
VALUE rb_proc_call_kw(VALUE recv, VALUE args, int kw_splat);
VALUE rb_proc_call_with_block(VALUE recv, int argc, const VALUE *argv, VALUE proc);
VALUE rb_proc_call_with_block_kw(VALUE recv, int argc, const VALUE *argv, VALUE proc, int kw_splat);
int rb_proc_arity(VALUE recv);
VALUE rb_proc_lambda_p(VALUE recv);
VALUE rb_binding_new(void);
VALUE rb_obj_method(VALUE recv, VALUE mid);
VALUE rb_obj_is_method(VALUE recv);
VALUE rb_method_call(int argc, const VALUE *argv, VALUE recv);
VALUE rb_method_call_kw(int argc, const VALUE *argv, VALUE recv, int kw_splat);
VALUE rb_method_call_with_block(int argc, const VALUE *argv, VALUE recv, VALUE proc);
VALUE rb_method_call_with_block_kw(int argc, const VALUE *argv, VALUE recv, VALUE proc, int kw_splat);
int rb_mod_method_arity(VALUE mod, ID mid);
int rb_obj_method_arity(VALUE obj, ID mid);
__attribute__((__nonnull__ (1)))
VALUE rb_protect(VALUE (*func)(VALUE args), VALUE args, int *state);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__nonnull__ (2, 3)))
int rb_scan_args(int argc, const VALUE *argv, const char *fmt, ...);
__attribute__((__nonnull__ (3, 4)))
int rb_scan_args_kw(int kw_splat, int argc, const VALUE *argv, const char *fmt, ...);
__attribute__((__error__ ("bad scan arg format")))
void rb_scan_args_bad_format(const char*);
__attribute__((__error__ ("variable argument length doesn't match")))
void rb_scan_args_length_mismatch(const char*,int);

#pragma GCC visibility pop

static inline _Bool
rb_scan_args_keyword_p(int kw_flag, VALUE last)
{
    switch (kw_flag) {
      case 0:
        return !! rb_keyword_given_p();
      case 1:
        return 1;
      case 3:
        return RB_TYPE_P(last, RUBY_T_HASH);
      default:
        return 0;
    }
}
__attribute__((__always_inline__)) inline
static _Bool
rb_scan_args_lead_p(const char *fmt)
{
    return (((unsigned char)((fmt[0])-'0'))<10);
}
__attribute__((__always_inline__)) inline
static int
rb_scan_args_n_lead(const char *fmt)
{
    return (rb_scan_args_lead_p(fmt) ? fmt[0]-'0' : 0);
}
__attribute__((__always_inline__)) inline
static _Bool
rb_scan_args_opt_p(const char *fmt)
{
    return (rb_scan_args_lead_p(fmt) && (((unsigned char)((fmt[1])-'0'))<10));
}
__attribute__((__always_inline__)) inline
static int
rb_scan_args_n_opt(const char *fmt)
{
    return (rb_scan_args_opt_p(fmt) ? fmt[1]-'0' : 0);
}
__attribute__((__always_inline__)) inline
static int
rb_scan_args_var_idx(const char *fmt)
{
    return (!rb_scan_args_lead_p(fmt) ? 0 : !(((unsigned char)((fmt[1])-'0'))<10) ? 1 : 2);
}
__attribute__((__always_inline__)) inline
static _Bool
rb_scan_args_f_var(const char *fmt)
{
    return (fmt[rb_scan_args_var_idx(fmt)]=='*');
}
__attribute__((__always_inline__)) inline
static int
rb_scan_args_trail_idx(const char *fmt)
{
    const int idx = rb_scan_args_var_idx(fmt);
    return idx+(fmt[idx]=='*');
}
__attribute__((__always_inline__)) inline
static int
rb_scan_args_n_trail(const char *fmt)
{
    const int idx = rb_scan_args_trail_idx(fmt);
    return ((((unsigned char)((fmt[idx])-'0'))<10) ? fmt[idx]-'0' : 0);
}
__attribute__((__always_inline__)) inline
static int
rb_scan_args_hash_idx(const char *fmt)
{
    const int idx = rb_scan_args_trail_idx(fmt);
    return idx+(((unsigned char)((fmt[idx])-'0'))<10);
}
__attribute__((__always_inline__)) inline
static _Bool
rb_scan_args_f_hash(const char *fmt)
{
    return (fmt[rb_scan_args_hash_idx(fmt)]==':');
}
__attribute__((__always_inline__)) inline
static int
rb_scan_args_block_idx(const char *fmt)
{
    const int idx = rb_scan_args_hash_idx(fmt);
    return idx+(fmt[idx]==':');
}
__attribute__((__always_inline__)) inline
static _Bool
rb_scan_args_f_block(const char *fmt)
{
    return (fmt[rb_scan_args_block_idx(fmt)]=='&');
}
__attribute__((__always_inline__)) inline
static int
rb_scan_args_set(int kw_flag, int argc, const VALUE *argv,
                 int n_lead, int n_opt, int n_trail,
                 _Bool f_var, _Bool f_hash, _Bool f_block,
                 VALUE *vars[], const char *fmt [[maybe_unused]], int varc [[maybe_unused]])
   
   
{
    int i, argi = 0, vari = 0;
    VALUE *var, hash = ((VALUE)RUBY_Qnil);
    const int n_mand = n_lead + n_trail;
    if (f_hash && argc > 0) {
        VALUE last = argv[argc - 1];
        if (rb_scan_args_keyword_p(kw_flag, last)) {
            hash = rb_hash_dup(last);
            argc--;
        }
    }
    if (argc < n_mand) {
        goto argc_error;
    }
    for (i = 0; i < n_lead; i++) {
        var = vars[vari++];
        if (var) *var = argv[argi];
        argi++;
    }
    for (i = 0; i < n_opt; i++) {
        var = vars[vari++];
        if (argi < argc - n_trail) {
            if (var) *var = argv[argi];
            argi++;
        }
        else {
            if (var) *var = ((VALUE)RUBY_Qnil);
        }
    }
    if (f_var) {
        int n_var = argc - argi - n_trail;
        var = vars[vari++];
        if (0 < n_var) {
            if (var) *var = rb_ary_new_from_values(n_var, &argv[argi]);
            argi += n_var;
        }
        else {
            if (var) *var = rb_ary_new();
        }
    }
    for (i = 0; i < n_trail; i++) {
        var = vars[vari++];
        if (var) *var = argv[argi];
        argi++;
    }
    if (f_hash) {
        var = vars[vari++];
        if (var) *var = hash;
    }
    if (f_block) {
        var = vars[vari++];
        if (rb_block_given_p()) {
            *var = rb_block_proc();
        }
        else {
            *var = ((VALUE)RUBY_Qnil);
        }
    }
    if (argi == argc) {
        return argc;
    }
  argc_error:
    rb_error_arity(argc, n_mand, f_var ? (-1) : n_mand + n_opt);
    __builtin_unreachable();
}

#pragma GCC visibility push(default)

ID rb_sym2id(VALUE obj);
VALUE rb_id2sym(ID id);
__attribute__((__nonnull__ ()))
ID rb_intern(const char *name);
ID rb_intern2(const char *name, long len);
ID rb_intern_str(VALUE str);
const char *rb_id2name(ID id);
__attribute__((__nonnull__ ()))
ID rb_check_id(volatile VALUE *namep);
ID rb_to_id(VALUE str);
VALUE rb_id2str(ID id);
VALUE rb_sym2str(VALUE id);
VALUE rb_to_symbol(VALUE name);
__attribute__((__nonnull__ ()))
VALUE rb_check_symbol(volatile VALUE *namep);

#pragma GCC visibility pop

__attribute__((__pure__))
__attribute__((__nonnull__ ()))
static inline ID
rb_intern_const(const char *str)
{
    size_t len = strlen(str);
    return rb_intern2(str, ((long)len));
}

__attribute__((__nonnull__ ()))
static inline ID
rbimpl_intern_const(ID *ptr, const char *str)
{
    while (! *ptr) {
        *ptr = rb_intern_const(str);
    }
    return *ptr;
}

#pragma GCC visibility push(default)

typedef VALUE rb_gvar_getter_t(ID id, VALUE *data);
typedef void rb_gvar_setter_t(VALUE val, ID id, VALUE *data);
typedef void rb_gvar_marker_t(VALUE *var);
rb_gvar_getter_t rb_gvar_undef_getter;
rb_gvar_setter_t rb_gvar_undef_setter;
rb_gvar_marker_t rb_gvar_undef_marker;
rb_gvar_getter_t rb_gvar_val_getter;
rb_gvar_setter_t rb_gvar_val_setter;
rb_gvar_marker_t rb_gvar_val_marker;
rb_gvar_getter_t rb_gvar_var_getter;
rb_gvar_setter_t rb_gvar_var_setter;
rb_gvar_marker_t rb_gvar_var_marker;
__attribute__((__noreturn__))
rb_gvar_setter_t rb_gvar_readonly_setter;
__attribute__((__nonnull__ ()))
void rb_define_variable(const char *name, VALUE *var);
__attribute__((__nonnull__ (1)))
void rb_define_virtual_variable(const char *name, rb_gvar_getter_t *getter, rb_gvar_setter_t *setter);
__attribute__((__nonnull__ (1)))
void rb_define_hooked_variable(const char *name, VALUE *var, rb_gvar_getter_t *getter, rb_gvar_setter_t *setter);
__attribute__((__nonnull__ ()))
void rb_define_readonly_variable(const char *name, const VALUE *var);
__attribute__((__nonnull__ ()))
void rb_define_const(VALUE klass, const char *name, VALUE val);
__attribute__((__nonnull__ ()))
void rb_define_global_const(const char *name, VALUE val);
__attribute__((__nonnull__ ()))
void rb_deprecate_constant(VALUE mod, const char *name);
__attribute__((__nonnull__ ()))
VALUE rb_gv_set(const char *name, VALUE val);
__attribute__((__nonnull__ ()))
VALUE rb_gv_get(const char *name);
__attribute__((__nonnull__ ()))
VALUE rb_iv_get(VALUE obj, const char *name);
__attribute__((__nonnull__ ()))
VALUE rb_iv_set(VALUE obj, const char *name, VALUE val);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_get_path(VALUE obj);
VALUE rb_get_path_no_checksafe(VALUE);
__attribute__((__error__ (" argument length doesn't match"))) int rb_varargs_bad_length(int,int);
const char *rb_class2name(VALUE klass);
const char *rb_obj_classname(VALUE obj);
void rb_p(VALUE obj);
VALUE rb_equal(VALUE lhs, VALUE rhs);
VALUE rb_require(const char *feature);

#pragma GCC visibility push(default)

VALUE rb_big_new(size_t len, int sign);
int rb_bigzero_p(VALUE x);
VALUE rb_big_clone(VALUE num);
void rb_big_2comp(VALUE num);
VALUE rb_big_norm(VALUE x);
void rb_big_resize(VALUE big, size_t len);
__attribute__((__nonnull__ ()))
VALUE rb_cstr_to_inum(const char *str, int base, int badcheck);
VALUE rb_str_to_inum(VALUE str, int base, int badcheck);
__attribute__((__nonnull__ ()))
VALUE rb_cstr2inum(const char *str, int base);
VALUE rb_str2inum(VALUE str, int base);
VALUE rb_big2str(VALUE x, int base);
long rb_big2long(VALUE x);
unsigned long rb_big2ulong(VALUE x);
long long rb_big2ll(VALUE);
unsigned long long rb_big2ull(VALUE);
__attribute__((__nonnull__ ()))
void rb_big_pack(VALUE val, unsigned long *buf, long num_longs);
__attribute__((__nonnull__ ()))
VALUE rb_big_unpack(unsigned long *buf, long num_longs);
__attribute__((__nonnull__ ()))
int rb_uv_to_utf8(char buf[6], unsigned long uv);
VALUE rb_dbl2big(double d);
double rb_big2dbl(VALUE x);
VALUE rb_big_cmp(VALUE lhs, VALUE rhs);
VALUE rb_big_eq(VALUE lhs, VALUE rhs);
VALUE rb_big_eql(VALUE lhs, VALUE rhs);
VALUE rb_big_plus(VALUE x, VALUE y);
VALUE rb_big_minus(VALUE x, VALUE y);
VALUE rb_big_mul(VALUE x, VALUE y);
VALUE rb_big_div(VALUE x, VALUE y);
VALUE rb_big_idiv(VALUE x, VALUE y);
VALUE rb_big_modulo(VALUE x, VALUE y);
VALUE rb_big_divmod(VALUE x, VALUE y);
VALUE rb_big_pow(VALUE x, VALUE y);
VALUE rb_big_and(VALUE x, VALUE y);
VALUE rb_big_or(VALUE x, VALUE y);
VALUE rb_big_xor(VALUE x, VALUE y);
VALUE rb_big_lshift(VALUE x, VALUE y);
VALUE rb_big_rshift(VALUE x, VALUE y);
__attribute__((__nonnull__ ()))
int rb_integer_pack(VALUE val, void *words, size_t numwords, size_t wordsize, size_t nails, int flags);
__attribute__((__nonnull__ ()))
VALUE rb_integer_unpack(const void *words, size_t numwords, size_t wordsize, size_t nails, int flags);
size_t rb_absint_size(VALUE val, int *nlz_bits_ret);
size_t rb_absint_numwords(VALUE val, size_t word_numbits, size_t *nlz_bits_ret);
int rb_absint_singlebit_p(VALUE val);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

int rb_cmpint(VALUE val, VALUE a, VALUE b);
__attribute__((__cold__))
__attribute__((__noreturn__))
void rb_cmperr(VALUE a, VALUE b);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_complex_raw(VALUE real, VALUE imag);
VALUE rb_complex_new(VALUE real, VALUE imag);
VALUE rb_complex_new_polar(VALUE abs, VALUE arg);
__attribute__((__deprecated__ ("by: rb_complex_new_polar")))
VALUE rb_complex_polar(VALUE abs, VALUE arg);
__attribute__((__pure__))
VALUE rb_complex_real(VALUE z);
__attribute__((__pure__))
VALUE rb_complex_imag(VALUE z);
VALUE rb_complex_plus(VALUE x, VALUE y);
VALUE rb_complex_minus(VALUE x, VALUE y);
VALUE rb_complex_mul(VALUE x, VALUE y);
VALUE rb_complex_div(VALUE x, VALUE y);
VALUE rb_complex_uminus(VALUE z);
VALUE rb_complex_conjugate(VALUE z);
VALUE rb_complex_abs(VALUE z);
VALUE rb_complex_arg(VALUE z);
VALUE rb_complex_pow(VALUE base, VALUE exp);
VALUE rb_dbl_complex_new(double real, double imag);
VALUE rb_Complex(VALUE real, VALUE imag);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_fiber_new(rb_block_call_func_t func, VALUE callback_obj);
VALUE rb_fiber_new_storage(rb_block_call_func_t func, VALUE callback_obj, VALUE storage);
VALUE rb_fiber_current(void);
VALUE rb_fiber_alive_p(VALUE fiber);
VALUE rb_obj_is_fiber(VALUE obj);
VALUE rb_fiber_resume(VALUE fiber, int argc, const VALUE *argv);
VALUE rb_fiber_resume_kw(VALUE fiber, int argc, const VALUE *argv, int kw_splat);
VALUE rb_fiber_yield(int argc, const VALUE *argv);
VALUE rb_fiber_yield_kw(int argc, const VALUE *argv, int kw_splat);
VALUE rb_fiber_transfer(VALUE fiber, int argc, const VALUE *argv);
VALUE rb_fiber_transfer_kw(VALUE fiber, int argc, const VALUE *argv, int kw_splat);
VALUE rb_fiber_raise(VALUE fiber, int argc, const VALUE *argv);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_dir_getwd(void);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_enum_values_pack(int argc, const VALUE *argv);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__noreturn__))
void rb_exc_raise(VALUE exc);
__attribute__((__noreturn__))
void rb_exc_fatal(VALUE exc);
__attribute__((__noreturn__))
VALUE rb_f_exit(int argc, const VALUE *argv);
__attribute__((__noreturn__))
VALUE rb_f_abort(int argc, const VALUE *argv);
__attribute__((__noreturn__))
void rb_interrupt(void);
ID rb_frame_this_func(void);
__attribute__((__noreturn__))
void rb_jump_tag(int state);
void rb_obj_call_init(VALUE obj, int argc, const VALUE *argv);
void rb_obj_call_init_kw(VALUE, int, const VALUE*, int);
ID rb_frame_callee(void);
VALUE rb_make_exception(int argc, const VALUE *argv);
void rb_set_end_proc(void (*func)(VALUE arg), VALUE arg);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

typedef VALUE rb_enumerator_size_func(VALUE recv, VALUE argv, VALUE eobj);
typedef struct {
    VALUE begin;
    VALUE end;
    VALUE step;
    int exclude_end;
} rb_arithmetic_sequence_components_t;
VALUE rb_enumeratorize(VALUE recv, VALUE meth, int argc, const VALUE *argv);
VALUE rb_enumeratorize_with_size(VALUE recv, VALUE meth, int argc, const VALUE *argv, rb_enumerator_size_func *func);
VALUE rb_enumeratorize_with_size_kw(VALUE recv, VALUE meth, int argc, const VALUE *argv, rb_enumerator_size_func *func, int kw_splat);
__attribute__((__nonnull__ ()))
int rb_arithmetic_sequence_extract(VALUE as, rb_arithmetic_sequence_components_t *buf);
__attribute__((__nonnull__ ()))
VALUE rb_arithmetic_sequence_beg_len_step(VALUE as, long *begp, long *lenp, long *stepp, long len, int err);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
VALUE rb_file_s_expand_path(int argc, const VALUE *argv);
VALUE rb_file_expand_path(VALUE fname, VALUE dname);
__attribute__((__nonnull__ ()))
VALUE rb_file_s_absolute_path(int argc, const VALUE *argv);
VALUE rb_file_absolute_path(VALUE fname, VALUE dname);
VALUE rb_file_dirname(VALUE fname);
__attribute__((__nonnull__ ()))
int rb_find_file_ext(VALUE *feature, const char *const *exts);
VALUE rb_find_file(VALUE path);
VALUE rb_file_directory_p(VALUE _, VALUE path);
VALUE rb_str_encode_ospath(VALUE path);
__attribute__((__nonnull__ ()))
__attribute__((__pure__))
int rb_is_absolute_path(const char *path);
off_t rb_file_size(VALUE file);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

extern VALUE rb_fs;
extern VALUE rb_output_fs;
extern VALUE rb_rs;
extern VALUE rb_default_rs;
extern VALUE rb_output_rs;
VALUE rb_io_write(VALUE io, VALUE str);
VALUE rb_io_gets(VALUE io);
VALUE rb_io_getbyte(VALUE io);
VALUE rb_io_ungetc(VALUE io, VALUE c);
VALUE rb_io_ungetbyte(VALUE io, VALUE b);
VALUE rb_io_close(VALUE io);
VALUE rb_io_flush(VALUE io);
VALUE rb_io_eof(VALUE io);
VALUE rb_io_binmode(VALUE io);
VALUE rb_io_ascii8bit_binmode(VALUE io);
VALUE rb_io_addstr(VALUE io, VALUE str);
VALUE rb_io_printf(int argc, const VALUE *argv, VALUE io);
VALUE rb_io_print(int argc, const VALUE *argv, VALUE io);
VALUE rb_io_puts(int argc, const VALUE *argv, VALUE io);
VALUE rb_io_fdopen(int fd, int flags, const char *path);
__attribute__((__nonnull__ ()))
VALUE rb_file_open(const char *fname, const char *fmode);
__attribute__((__nonnull__ ()))
VALUE rb_file_open_str(VALUE fname, const char *fmode);
VALUE rb_gets(void);
__attribute__((__nonnull__ ()))
void rb_write_error(const char *str);
void rb_write_error2(const char *str, long len);
void rb_close_before_exec(int lowfd, int maxhint, VALUE noclose_fds);
__attribute__((__nonnull__ ()))
int rb_pipe(int *pipes);
int rb_reserved_fd_p(int fd);
int rb_cloexec_open(const char *pathname, int flags, mode_t mode);
int rb_cloexec_dup(int oldfd);
int rb_cloexec_dup2(int oldfd, int newfd);
__attribute__((__nonnull__ ()))
int rb_cloexec_pipe(int fildes[2]);
int rb_cloexec_fcntl_dupfd(int fd, int minfd);
void rb_update_max_fd(int fd);
void rb_fd_fix_cloexec(int fd);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

void rb_load(VALUE path, int wrap);
void rb_load_protect(VALUE path, int wrap, int *state);
__attribute__((__nonnull__ ()))
int rb_provided(const char *feature);
__attribute__((__nonnull__ (1)))
int rb_feature_provided(const char *feature, const char **loading);
__attribute__((__nonnull__ ()))
void rb_provide(const char *feature);
VALUE rb_f_require(VALUE self, VALUE feature);
VALUE rb_require_string(VALUE feature);
void *rb_ext_resolve_symbol(const char *feature, const char *symbol);
void rb_ext_ractor_safe(_Bool flag);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_marshal_dump(VALUE obj, VALUE port);
VALUE rb_marshal_load(VALUE port);
void rb_marshal_define_compat(VALUE newclass, VALUE oldclass, VALUE (*dumper)(VALUE), VALUE (*loader)(VALUE, VALUE));

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__noreturn__))
__attribute__((__cold__))
void rb_num_zerodiv(void);
VALUE rb_num_coerce_bin(VALUE lhs, VALUE rhs, ID op);
VALUE rb_num_coerce_cmp(VALUE lhs, VALUE rhs, ID op);
VALUE rb_num_coerce_relop(VALUE lhs, VALUE rhs, ID op);
VALUE rb_num_coerce_bit(VALUE lhs, VALUE rhs, ID op);
VALUE rb_num2fix(VALUE val);
VALUE rb_fix2str(VALUE val, int base);
__attribute__((__const__))
VALUE rb_dbl_cmp(double lhs, double rhs);
extern VALUE rb_int_positive_pow(long x, unsigned long y);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_class_new_instance_pass_kw(int argc, const VALUE *argv, VALUE klass);
VALUE rb_class_new_instance(int argc, const VALUE *argv, VALUE klass);
VALUE rb_class_new_instance_kw(int argc, const VALUE *argv, VALUE klass, int kw_splat);
int rb_eql(VALUE lhs, VALUE rhs);
VALUE rb_any_to_s(VALUE obj);
VALUE rb_inspect(VALUE obj);
VALUE rb_obj_is_instance_of(VALUE obj, VALUE klass);
VALUE rb_obj_is_kind_of(VALUE obj, VALUE klass);
VALUE rb_obj_alloc(VALUE klass);
VALUE rb_obj_clone(VALUE obj);
VALUE rb_obj_dup(VALUE obj);
VALUE rb_obj_init_copy(VALUE src, VALUE dst);
VALUE rb_obj_freeze(VALUE obj);
__attribute__((__pure__))
VALUE rb_obj_frozen_p(VALUE obj);
VALUE rb_obj_id(VALUE obj);
__attribute__((__const__))
VALUE rb_memory_id(VALUE obj);
__attribute__((__pure__))
VALUE rb_class_real(VALUE klass);
__attribute__((__pure__))
VALUE rb_class_inherited_p(VALUE scion, VALUE ascendant);
__attribute__((__pure__))
VALUE rb_class_superclass(VALUE klass);
__attribute__((__nonnull__ ()))
VALUE rb_convert_type(VALUE val, int type, const char *name, const char *mid);
__attribute__((__nonnull__ ()))
VALUE rb_check_convert_type(VALUE val, int type, const char *name, const char *mid);
__attribute__((__nonnull__ ()))
VALUE rb_check_to_integer(VALUE val, const char *mid);
VALUE rb_check_to_float(VALUE val);
VALUE rb_to_int(VALUE val);
VALUE rb_check_to_int(VALUE val);
VALUE rb_Integer(VALUE val);
VALUE rb_to_float(VALUE val);
VALUE rb_Float(VALUE val);
VALUE rb_String(VALUE val);
VALUE rb_Array(VALUE val);
VALUE rb_Hash(VALUE val);
__attribute__((__nonnull__ ()))
double rb_cstr_to_dbl(const char *str, int mode);
double rb_str_to_dbl(VALUE str, int mode);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

ID rb_id_attrset(ID id);
__attribute__((__const__))
int rb_is_const_id(ID id);
__attribute__((__const__))
int rb_is_global_id(ID id);
__attribute__((__const__))
int rb_is_instance_id(ID id);
__attribute__((__const__))
int rb_is_attrset_id(ID id);
__attribute__((__const__))
int rb_is_class_id(ID id);
__attribute__((__const__))
int rb_is_local_id(ID id);
__attribute__((__const__))
int rb_is_junk_id(ID);
__attribute__((__nonnull__ ()))
int rb_symname_p(const char *str);
VALUE rb_backref_get(void);
void rb_backref_set(VALUE md);
VALUE rb_lastline_get(void);
void rb_lastline_set(VALUE str);
VALUE rb_sym_all_symbols(void);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_process_status_wait(pid_t pid, int flags);
void rb_last_status_set(int status, pid_t pid);
VALUE rb_last_status_get(void);
__attribute__((__nonnull__ ()))
int rb_proc_exec(const char *cmd);
__attribute__((__noreturn__))
VALUE rb_f_exec(int argc, const VALUE *argv);
pid_t rb_waitpid(pid_t pid, int *status, int flags);
void rb_syswait(pid_t pid);
pid_t rb_spawn(int argc, const VALUE *argv);
pid_t rb_spawn_err(int argc, const VALUE *argv, char *errbuf, size_t buflen);
VALUE rb_proc_times(VALUE _);
VALUE rb_detach_process(pid_t pid);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

unsigned int rb_genrand_int32(void);
double rb_genrand_real(void);
void rb_reset_random_seed(void);
VALUE rb_random_bytes(VALUE rnd, long n);
unsigned int rb_random_int32(VALUE rnd);
double rb_random_real(VALUE rnd);
unsigned long rb_random_ulong_limited(VALUE rnd, unsigned long limit);
unsigned long rb_genrand_ulong_limited(unsigned long i);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_range_new(VALUE beg, VALUE end, int excl);
__attribute__((__nonnull__ ()))
VALUE rb_range_beg_len(VALUE range, long *begp, long *lenp, long len, int err);
__attribute__((__nonnull__ ()))
int rb_range_values(VALUE range, VALUE *begp, VALUE *endp, int *exclp);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_rational_raw(VALUE num, VALUE den);
VALUE rb_rational_new(VALUE num, VALUE den);
VALUE rb_Rational(VALUE num, VALUE den);
__attribute__((__pure__))
VALUE rb_rational_num(VALUE rat);
__attribute__((__pure__))
VALUE rb_rational_den(VALUE rat);
VALUE rb_flt_rationalize_with_prec(VALUE flt, VALUE prec);
VALUE rb_flt_rationalize(VALUE flt);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

int rb_memcicmp(const void *s1,const void *s2, long n);
void rb_match_busy(VALUE md);
VALUE rb_reg_nth_defined(int n, VALUE md);
VALUE rb_reg_nth_match(int n, VALUE md);
int rb_reg_backref_number(VALUE match, VALUE backref);
VALUE rb_reg_last_match(VALUE md);
VALUE rb_reg_match_pre(VALUE md);
VALUE rb_reg_match_post(VALUE md);
VALUE rb_reg_match_last(VALUE md);
VALUE rb_reg_new_str(VALUE src, int opts);
__attribute__((__nonnull__ ()))
VALUE rb_reg_new(const char *src, long len, int opts);
VALUE rb_reg_alloc(void);
VALUE rb_reg_init_str(VALUE re, VALUE s, int options);
VALUE rb_reg_match(VALUE re, VALUE str);
VALUE rb_reg_match2(VALUE re);
int rb_reg_options(VALUE re);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

extern VALUE rb_argv0;
VALUE rb_get_argv(void);
__attribute__((__nonnull__ ()))
void *rb_load_file(const char *file);
void *rb_load_file_str(VALUE file);

#pragma GCC visibility pop

struct timeval;
typedef struct {
    int maxfd;
    fd_set *fdset;
} rb_fdset_t;

#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
void rb_fd_init(rb_fdset_t *f);
__attribute__((__nonnull__ ()))
void rb_fd_term(rb_fdset_t *f);
__attribute__((__nonnull__ ()))
void rb_fd_zero(rb_fdset_t *f);
__attribute__((__nonnull__ ()))
void rb_fd_set(int fd, rb_fdset_t *f);
__attribute__((__nonnull__ ()))
void rb_fd_clr(int fd, rb_fdset_t *f);
__attribute__((__nonnull__ ()))
__attribute__((__pure__))
int rb_fd_isset(int fd, const rb_fdset_t *f);
void rb_fd_copy(rb_fdset_t *dst, const fd_set *src, int max);
void rb_fd_dup(rb_fdset_t *dst, const rb_fdset_t *src);
int rb_fd_select(int nfds, rb_fdset_t *rfds, rb_fdset_t *wfds, rb_fdset_t *efds, struct timeval *timeout);

#pragma GCC visibility pop

__attribute__((__nonnull__ ()))
__attribute__((__pure__))
static inline fd_set *
rb_fd_ptr(const rb_fdset_t *f)
{
    return f->fdset;
}
__attribute__((__nonnull__ ()))
__attribute__((__pure__))
static inline int
rb_fd_max(const rb_fdset_t *f)
{
    return f->maxfd;
}

#pragma GCC visibility push(default)

struct timeval;
int rb_thread_fd_select(int nfds, rb_fdset_t *rfds, rb_fdset_t *wfds, rb_fdset_t *efds, struct timeval *timeout);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
VALUE rb_f_kill(int argc, const VALUE *argv);
__attribute__((__pure__))
const char *ruby_signal_name(int signo);
void ruby_default_signal(int sig);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_f_sprintf(int argc, const VALUE *argv);
__attribute__((__nonnull__ (1)))
__attribute__((__format__(__printf__, 1, 2)))
VALUE rb_sprintf(const char *fmt, ...);
__attribute__((__nonnull__ (1)))
__attribute__((__format__(__printf__, 1, 0)))
VALUE rb_vsprintf(const char *fmt, va_list ap);
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 3)))
VALUE rb_str_catf(VALUE dst, const char *fmt, ...);
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 0)))
VALUE rb_str_vcatf(VALUE dst, const char *fmt, va_list ap);
VALUE rb_str_format(int argc, const VALUE *argv, VALUE fmt);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_str_new(const char *ptr, long len);
VALUE rb_str_new_cstr(const char *ptr);
VALUE rb_str_new_shared(VALUE str);
VALUE rb_str_new_frozen(VALUE str);
VALUE rb_str_new_with_class(VALUE obj, const char *ptr, long len);
VALUE rb_external_str_new(const char *ptr, long len);
__attribute__((__nonnull__ ()))
VALUE rb_external_str_new_cstr(const char *ptr);
VALUE rb_locale_str_new(const char *ptr, long len);
__attribute__((__nonnull__ ()))
VALUE rb_locale_str_new_cstr(const char *ptr);
VALUE rb_filesystem_str_new(const char *ptr, long len);
__attribute__((__nonnull__ ()))
VALUE rb_filesystem_str_new_cstr(const char *ptr);
VALUE rb_str_buf_new(long capa);
__attribute__((__nonnull__ ()))
VALUE rb_str_buf_new_cstr(const char *ptr);
VALUE rb_str_tmp_new(long len);
VALUE rb_usascii_str_new(const char *ptr, long len);
VALUE rb_usascii_str_new_cstr(const char *ptr);
VALUE rb_utf8_str_new(const char *ptr, long len);
VALUE rb_utf8_str_new_cstr(const char *ptr);
VALUE rb_str_new_static(const char *ptr, long len);
VALUE rb_usascii_str_new_static(const char *ptr, long len);
VALUE rb_utf8_str_new_static(const char *ptr, long len);
VALUE rb_str_to_interned_str(VALUE str);
VALUE rb_interned_str(const char *ptr, long len);
__attribute__((__nonnull__ ()))
VALUE rb_interned_str_cstr(const char *ptr);
void rb_str_free(VALUE str);
void rb_str_shared_replace(VALUE dst, VALUE src);
VALUE rb_str_buf_append(VALUE dst, VALUE src);
VALUE rb_str_buf_cat(VALUE, const char*, long);
VALUE rb_str_buf_cat2(VALUE, const char*);
__attribute__((__nonnull__ ()))
VALUE rb_str_buf_cat_ascii(VALUE dst, const char *src);
VALUE rb_obj_as_string(VALUE obj);
VALUE rb_check_string_type(VALUE obj);
void rb_must_asciicompat(VALUE obj);
VALUE rb_str_dup(VALUE str);
VALUE rb_str_resurrect(VALUE str);
VALUE rb_str_locktmp(VALUE str);
VALUE rb_str_unlocktmp(VALUE str);
VALUE rb_str_dup_frozen(VALUE);
VALUE rb_str_plus(VALUE lhs, VALUE rhs);
VALUE rb_str_times(VALUE str, VALUE num);
long rb_str_sublen(VALUE str, long pos);
VALUE rb_str_substr(VALUE str, long beg, long len);
VALUE rb_str_subseq(VALUE str, long beg, long len);
char *rb_str_subpos(VALUE str, long beg, long *len);
void rb_str_modify(VALUE str);
void rb_str_modify_expand(VALUE str, long capa);
VALUE rb_str_freeze(VALUE str);
void rb_str_set_len(VALUE str, long len);
VALUE rb_str_resize(VALUE str, long len);
VALUE rb_str_cat(VALUE dst, const char *src, long srclen);
VALUE rb_str_cat_cstr(VALUE dst, const char *src);
VALUE rb_str_cat2(VALUE, const char*);
VALUE rb_str_append(VALUE dst, VALUE src);
VALUE rb_str_concat(VALUE dst, VALUE src);
st_index_t rb_memhash(const void *ptr, long len);
st_index_t rb_hash_start(st_index_t i);
st_index_t rb_str_hash(VALUE str);
int rb_str_hash_cmp(VALUE str1, VALUE str2);
int rb_str_comparable(VALUE str1, VALUE str2);
int rb_str_cmp(VALUE lhs, VALUE rhs);
VALUE rb_str_equal(VALUE str1, VALUE str2);
VALUE rb_str_drop_bytes(VALUE str, long len);
void rb_str_update(VALUE dst, long beg, long len, VALUE src);
VALUE rb_str_replace(VALUE dst, VALUE src);
VALUE rb_str_inspect(VALUE str);
VALUE rb_str_dump(VALUE str);
VALUE rb_str_split(VALUE str, const char *delim);
rb_gvar_setter_t rb_str_setter;
VALUE rb_str_intern(VALUE str);
VALUE rb_sym_to_s(VALUE sym);
long rb_str_strlen(VALUE str);
VALUE rb_str_length(VALUE);
long rb_str_offset(VALUE str, long pos);
__attribute__((__pure__))
size_t rb_str_capacity(VALUE str);
VALUE rb_str_ellipsize(VALUE str, long len);
VALUE rb_str_scrub(VALUE str, VALUE repl);
VALUE rb_str_succ(VALUE orig);
__attribute__((__nonnull__ ()))
static inline long
rbimpl_strlen(const char *str)
{
    return ((long)strlen(str));
}
__attribute__((__nonnull__ ()))
static inline VALUE
rbimpl_str_new_cstr(const char *str)
{
    long len = rbimpl_strlen(str);
    return rb_str_new_static(str, len);
}
__attribute__((__nonnull__ ()))
static inline VALUE
rbimpl_usascii_str_new_cstr(const char *str)
{
    long len = rbimpl_strlen(str);
    return rb_usascii_str_new_static(str, len);
}
__attribute__((__nonnull__ ()))
static inline VALUE
rbimpl_utf8_str_new_cstr(const char *str)
{
    long len = rbimpl_strlen(str);
    return rb_utf8_str_new_static(str, len);
}
__attribute__((__nonnull__ ()))
static inline VALUE
rbimpl_external_str_new_cstr(const char *str)
{
    long len = rbimpl_strlen(str);
    return rb_external_str_new(str, len);
}
__attribute__((__nonnull__ ()))
static inline VALUE
rbimpl_locale_str_new_cstr(const char *str)
{
    long len = rbimpl_strlen(str);
    return rb_locale_str_new(str, len);
}
__attribute__((__nonnull__ ()))
static inline VALUE
rbimpl_str_buf_new_cstr(const char *str)
{
    long len = rbimpl_strlen(str);
    VALUE buf = rb_str_buf_new(len);
    return rb_str_buf_cat(buf, str, len);
}
__attribute__((__nonnull__ ()))
static inline VALUE
rbimpl_str_cat_cstr(VALUE buf, const char *str)
{
    long len = rbimpl_strlen(str);
    return rb_str_cat(buf, str, len);
}
__attribute__((__nonnull__ ()))
static inline VALUE
rbimpl_exc_new_cstr(VALUE exc, const char *str)
{
    long len = rbimpl_strlen(str);
    return rb_exc_new(exc, str, len);
}

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_struct_new(VALUE klass, ...);
VALUE rb_struct_define(const char *name, ...);
__attribute__((__nonnull__ (2)))
VALUE rb_struct_define_under(VALUE space, const char *name, ...);
VALUE rb_struct_alloc(VALUE klass, VALUE values);
VALUE rb_struct_initialize(VALUE self, VALUE values);
VALUE rb_struct_getmember(VALUE self, ID key);
VALUE rb_struct_s_members(VALUE klass);
VALUE rb_struct_members(VALUE self);
VALUE rb_struct_alloc_noinit(VALUE klass);
VALUE rb_struct_define_without_accessor(const char *name, VALUE super, rb_alloc_func_t func, ...);
__attribute__((__nonnull__ (2)))
VALUE rb_struct_define_without_accessor_under(VALUE outer, const char *class_name, VALUE super, rb_alloc_func_t alloc, ...);
VALUE rb_data_define(VALUE super, ...);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

struct timeval;
void rb_thread_schedule(void);
int rb_thread_wait_fd(int fd);
int rb_thread_fd_writable(int fd);
void rb_thread_fd_close(int fd);
int rb_thread_alone(void);
void rb_thread_sleep(int sec);
void rb_thread_sleep_forever(void);
void rb_thread_sleep_deadly(void);
VALUE rb_thread_stop(void);
VALUE rb_thread_wakeup(VALUE thread);
VALUE rb_thread_wakeup_alive(VALUE thread);
VALUE rb_thread_run(VALUE thread);
VALUE rb_thread_kill(VALUE thread);
__attribute__((__nonnull__ (1)))
VALUE rb_thread_create(VALUE (*f)(void *g), void *g);
void rb_thread_wait_for(struct timeval time);
VALUE rb_thread_current(void);
VALUE rb_thread_main(void);
VALUE rb_thread_local_aref(VALUE thread, ID key);
VALUE rb_thread_local_aset(VALUE thread, ID key, VALUE val);
void rb_thread_atfork(void);
void rb_thread_atfork_before_exec(void);
VALUE rb_exec_recursive(VALUE (*f)(VALUE g, VALUE h, int r), VALUE g, VALUE h);
VALUE rb_exec_recursive_paired(VALUE (*f)(VALUE g, VALUE h, int r), VALUE g, VALUE p, VALUE h);
VALUE rb_exec_recursive_outer(VALUE (*f)(VALUE g, VALUE h, int r), VALUE g, VALUE h);
VALUE rb_exec_recursive_paired_outer(VALUE (*f)(VALUE g, VALUE h, int r), VALUE g, VALUE p, VALUE h);
typedef void rb_unblock_function_t(void *);
typedef VALUE rb_blocking_function_t(void *);
void rb_thread_check_ints(void);
int rb_thread_interrupted(VALUE thval);
VALUE rb_mutex_new(void);
VALUE rb_mutex_locked_p(VALUE mutex);
VALUE rb_mutex_trylock(VALUE mutex);
VALUE rb_mutex_lock(VALUE mutex);
VALUE rb_mutex_unlock(VALUE mutex);
VALUE rb_mutex_sleep(VALUE self, VALUE timeout);
VALUE rb_mutex_synchronize(VALUE mutex, VALUE (*func)(VALUE arg), VALUE arg);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

struct timespec;
struct timeval;
__attribute__((__nonnull__ ()))
void rb_timespec_now(struct timespec *ts);
VALUE rb_time_new(time_t sec, long usec);
VALUE rb_time_nano_new(time_t sec, long nsec);
__attribute__((__nonnull__ ()))
VALUE rb_time_timespec_new(const struct timespec *ts, int offset);
VALUE rb_time_num_new(VALUE timev, VALUE off);
struct timeval rb_time_interval(VALUE num);
struct timeval rb_time_timeval(VALUE time);
struct timespec rb_time_timespec(VALUE time);
struct timespec rb_time_timespec_interval(VALUE num);
VALUE rb_time_utc_offset(VALUE time);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_mod_name(VALUE mod);
VALUE rb_class_path(VALUE mod);
VALUE rb_class_path_cached(VALUE mod);
__attribute__((__nonnull__ ()))
void rb_set_class_path(VALUE klass, VALUE space, const char *name);
void rb_set_class_path_string(VALUE klass, VALUE space, VALUE name);
VALUE rb_path_to_class(VALUE path);
__attribute__((__nonnull__ ()))
VALUE rb_path2class(const char *path);
VALUE rb_class_name(VALUE obj);
VALUE rb_autoload_load(VALUE space, ID name);
VALUE rb_autoload_p(VALUE space, ID name);
VALUE rb_f_trace_var(int argc, const VALUE *argv);
VALUE rb_f_untrace_var(int argc, const VALUE *argv);
VALUE rb_f_global_variables(void);
void rb_alias_variable(ID dst, ID src);
void rb_free_generic_ivar(VALUE obj);
VALUE rb_ivar_get(VALUE obj, ID name);
VALUE rb_ivar_set(VALUE obj, ID name, VALUE val);
VALUE rb_ivar_defined(VALUE obj, ID name);
void rb_ivar_foreach(VALUE obj, int (*func)(ID name, VALUE val, st_data_t arg), st_data_t arg);
st_index_t rb_ivar_count(VALUE obj);
VALUE rb_attr_get(VALUE obj, ID name);
VALUE rb_obj_instance_variables(VALUE obj);
VALUE rb_obj_remove_instance_variable(VALUE obj, VALUE name);
void *rb_mod_const_at(VALUE, void*);
void *rb_mod_const_of(VALUE, void*);
VALUE rb_const_list(void*);
VALUE rb_mod_constants(int argc, const VALUE *argv, VALUE recv);
VALUE rb_mod_remove_const(VALUE space, VALUE name);
int rb_const_defined(VALUE space, ID name);
int rb_const_defined_at(VALUE space, ID name);
int rb_const_defined_from(VALUE space, ID name);
VALUE rb_const_get(VALUE space, ID name);
VALUE rb_const_get_at(VALUE space, ID name);
VALUE rb_const_get_from(VALUE space, ID name);
void rb_const_set(VALUE space, ID name, VALUE val);
VALUE rb_const_remove(VALUE space, ID name);
VALUE rb_cvar_defined(VALUE klass, ID name);
void rb_cvar_set(VALUE klass, ID name, VALUE val);
VALUE rb_cvar_get(VALUE klass, ID name);
__attribute__((__nonnull__ ()))
VALUE rb_cvar_find(VALUE klass, ID name, VALUE *front);
__attribute__((__nonnull__ ()))
void rb_cv_set(VALUE klass, const char *name, VALUE val);
__attribute__((__nonnull__ ()))
VALUE rb_cv_get(VALUE klass, const char *name);
__attribute__((__nonnull__ ()))
void rb_define_class_variable(VALUE, const char*, VALUE);
VALUE rb_mod_class_variables(int argc, const VALUE *argv, VALUE recv);
VALUE rb_mod_remove_cvar(VALUE mod, VALUE name);

#pragma GCC visibility pop

int ruby_native_thread_p(void);
__attribute__((__nonnull__ (3)))
__attribute__((__format__(__printf__, 3, 4)))
int ruby_snprintf(char *str, size_t n, char const *fmt, ...);
__attribute__((__nonnull__ (3)))
__attribute__((__format__(__printf__, 3, 0)))
int ruby_vsnprintf(char *str, size_t n, char const *fmt, va_list ap);

extern int *__errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern char *program_invocation_name;
extern char *program_invocation_short_name;
typedef int error_t;

int rb_errno(void);
void rb_errno_set(int err);
int *rb_errno_ptr(void);
static inline int *
rb_orig_errno_ptr(void)
{
    return &(*__errno_location ());
}

#pragma GCC visibility pop


#pragma GCC visibility push(default)

enum ruby_coderange_type {
    RUBY_ENC_CODERANGE_UNKNOWN = 0,
    RUBY_ENC_CODERANGE_7BIT = ((int)RUBY_FL_USER8),
    RUBY_ENC_CODERANGE_VALID = ((int)RUBY_FL_USER9),
    RUBY_ENC_CODERANGE_BROKEN = ((int)(RUBY_FL_USER8|RUBY_FL_USER9)),
    RUBY_ENC_CODERANGE_MASK = (RUBY_ENC_CODERANGE_7BIT|
                                   RUBY_ENC_CODERANGE_VALID|
                                   RUBY_ENC_CODERANGE_BROKEN)
};
__attribute__((__const__))
static inline int
rb_enc_coderange_clean_p(int cr)
{
    return (cr ^ (cr >> 1)) & RUBY_ENC_CODERANGE_7BIT;
}
__attribute__((__const__))
static inline _Bool
RB_ENC_CODERANGE_CLEAN_P(enum ruby_coderange_type cr)
{
    return rb_enc_coderange_clean_p(cr);
}
__attribute__((__pure__))
static inline enum ruby_coderange_type
RB_ENC_CODERANGE(VALUE obj)
{
    VALUE ret = RB_FL_TEST_RAW(obj, RUBY_ENC_CODERANGE_MASK);
    return ((enum ruby_coderange_type)ret);
}
__attribute__((__pure__))
static inline _Bool
RB_ENC_CODERANGE_ASCIIONLY(VALUE obj)
{
    return RB_ENC_CODERANGE(obj) == RUBY_ENC_CODERANGE_7BIT;
}
static inline void
RB_ENC_CODERANGE_SET(VALUE obj, enum ruby_coderange_type cr)
{
    RB_FL_UNSET_RAW(obj, RUBY_ENC_CODERANGE_MASK);
    RB_FL_SET_RAW(obj, cr);
}
static inline void
RB_ENC_CODERANGE_CLEAR(VALUE obj)
{
    RB_FL_UNSET_RAW(obj, RUBY_ENC_CODERANGE_MASK);
}
__attribute__((__const__))
static inline enum ruby_coderange_type
RB_ENC_CODERANGE_AND(enum ruby_coderange_type a, enum ruby_coderange_type b)
{
    if (a == RUBY_ENC_CODERANGE_7BIT) {
        return b;
    }
    else if (a != RUBY_ENC_CODERANGE_VALID) {
        return RUBY_ENC_CODERANGE_UNKNOWN;
    }
    else if (b == RUBY_ENC_CODERANGE_7BIT) {
        return RUBY_ENC_CODERANGE_VALID;
    }
    else {
        return b;
    }
}

#pragma GCC visibility pop


#pragma GCC visibility push(default)

typedef unsigned char OnigUChar;
typedef unsigned int OnigCodePoint;
typedef unsigned int OnigCtype;
typedef size_t OnigDistance;
typedef ptrdiff_t OnigPosition;
typedef unsigned int OnigCaseFoldType;
extern OnigCaseFoldType OnigDefaultCaseFoldFlag;
typedef struct {
  int byte_len;
  int code_len;
  OnigCodePoint code[3];
} OnigCaseFoldCodeItem;
typedef struct {
  OnigCodePoint esc;
  OnigCodePoint anychar;
  OnigCodePoint anytime;
  OnigCodePoint zero_or_one_time;
  OnigCodePoint one_or_more_time;
  OnigCodePoint anychar_anytime;
} OnigMetaCharTableType;
typedef int (*OnigApplyAllCaseFoldFunc)(OnigCodePoint from, OnigCodePoint* to, int to_len, void* arg);
typedef struct OnigEncodingTypeST {
  int (*precise_mbc_enc_len)(const OnigUChar* p,const OnigUChar* e, const struct OnigEncodingTypeST* enc);
  const char* name;
  int max_enc_len;
  int min_enc_len;
  int (*is_mbc_newline)(const OnigUChar* p, const OnigUChar* end, const struct OnigEncodingTypeST* enc);
  OnigCodePoint (*mbc_to_code)(const OnigUChar* p, const OnigUChar* end, const struct OnigEncodingTypeST* enc);
  int (*code_to_mbclen)(OnigCodePoint code, const struct OnigEncodingTypeST* enc);
  int (*code_to_mbc)(OnigCodePoint code, OnigUChar *buf, const struct OnigEncodingTypeST* enc);
  int (*mbc_case_fold)(OnigCaseFoldType flag, const OnigUChar** pp, const OnigUChar* end, OnigUChar* to, const struct OnigEncodingTypeST* enc);
  int (*apply_all_case_fold)(OnigCaseFoldType flag, OnigApplyAllCaseFoldFunc f, void* arg, const struct OnigEncodingTypeST* enc);
  int (*get_case_fold_codes_by_str)(OnigCaseFoldType flag, const OnigUChar* p, const OnigUChar* end, OnigCaseFoldCodeItem acs[], const struct OnigEncodingTypeST* enc);
  int (*property_name_to_ctype)(const struct OnigEncodingTypeST* enc, const OnigUChar* p, const OnigUChar* end);
  int (*is_code_ctype)(OnigCodePoint code, OnigCtype ctype, const struct OnigEncodingTypeST* enc);
  int (*get_ctype_code_range)(OnigCtype ctype, OnigCodePoint* sb_out, const OnigCodePoint* ranges[], const struct OnigEncodingTypeST* enc);
  OnigUChar* (*left_adjust_char_head)(const OnigUChar* start, const OnigUChar* p, const OnigUChar* end, const struct OnigEncodingTypeST* enc);
  int (*is_allowed_reverse_match)(const OnigUChar* p, const OnigUChar* end, const struct OnigEncodingTypeST* enc);
  int (*case_map)(OnigCaseFoldType* flagP, const OnigUChar** pp, const OnigUChar* end, OnigUChar* to, OnigUChar* to_end, const struct OnigEncodingTypeST* enc);
  int ruby_encoding_index;
  unsigned int flags;
} OnigEncodingType;
typedef const OnigEncodingType* OnigEncoding;
extern const OnigEncodingType OnigEncodingASCII;
extern
int onigenc_ascii_only_case_map(OnigCaseFoldType* flagP, const OnigUChar** pp, const OnigUChar* end, OnigUChar* to, OnigUChar* to_end, const struct OnigEncodingTypeST* enc);
extern
int onigenc_mbclen(const OnigUChar* p,const OnigUChar* e, const struct OnigEncodingTypeST* enc);
extern
OnigUChar* onigenc_step_back(OnigEncoding enc, const OnigUChar* start, const OnigUChar* s, const OnigUChar* end, int n);
extern
int onigenc_init(void);
extern
int onigenc_set_default_encoding(OnigEncoding enc);
extern
OnigEncoding onigenc_get_default_encoding(void);
extern
OnigUChar* onigenc_get_right_adjust_char_head_with_prev(OnigEncoding enc, const OnigUChar* start, const OnigUChar* s, const OnigUChar* end, const OnigUChar** prev);
extern
OnigUChar* onigenc_get_prev_char_head(OnigEncoding enc, const OnigUChar* start, const OnigUChar* s, const OnigUChar* end);
extern
OnigUChar* onigenc_get_left_adjust_char_head(OnigEncoding enc, const OnigUChar* start, const OnigUChar* s, const OnigUChar* end);
extern
OnigUChar* onigenc_get_right_adjust_char_head(OnigEncoding enc, const OnigUChar* start, const OnigUChar* s, const OnigUChar* end);
extern
int onigenc_strlen(OnigEncoding enc, const OnigUChar* p, const OnigUChar* end);
extern
int onigenc_strlen_null(OnigEncoding enc, const OnigUChar* p);
extern
int onigenc_str_bytelen_null(OnigEncoding enc, const OnigUChar* p);
typedef unsigned int OnigOptionType;
typedef struct {
  unsigned int op;
  unsigned int op2;
  unsigned int behavior;
  OnigOptionType options;
  OnigMetaCharTableType meta_char_table;
} OnigSyntaxType;
extern const OnigSyntaxType OnigSyntaxASIS;
extern const OnigSyntaxType OnigSyntaxPosixBasic;
extern const OnigSyntaxType OnigSyntaxPosixExtended;
extern const OnigSyntaxType OnigSyntaxEmacs;
extern const OnigSyntaxType OnigSyntaxGrep;
extern const OnigSyntaxType OnigSyntaxGnuRegex;
extern const OnigSyntaxType OnigSyntaxJava;
extern const OnigSyntaxType OnigSyntaxPerl58;
extern const OnigSyntaxType OnigSyntaxPerl58_NG;
extern const OnigSyntaxType OnigSyntaxPerl;
extern const OnigSyntaxType OnigSyntaxRuby;
extern const OnigSyntaxType OnigSyntaxPython;
extern const OnigSyntaxType* OnigDefaultSyntax;
struct re_registers {
  int allocated;
  int num_regs;
  OnigPosition* beg;
  OnigPosition* end;
};
typedef struct re_registers OnigRegion;
typedef struct {
  OnigEncoding enc;
  OnigUChar* par;
  OnigUChar* par_end;
} OnigErrorInfo;
typedef struct {
  int lower;
  int upper;
} OnigRepeatRange;
typedef void (*OnigWarnFunc)(const char* s);
extern void onig_null_warn(const char* s);
typedef struct re_pattern_buffer {
  unsigned char* p;
  unsigned int used;
  unsigned int alloc;
  int num_mem;
  int num_repeat;
  int num_null_check;
  int num_comb_exp_check;
  int num_call;
  unsigned int capture_history;
  unsigned int bt_mem_start;
  unsigned int bt_mem_end;
  int stack_pop_level;
  int repeat_range_alloc;
  OnigOptionType options;
  OnigRepeatRange* repeat_range;
  OnigEncoding enc;
  const OnigSyntaxType* syntax;
  void* name_table;
  OnigCaseFoldType case_fold_flag;
  int optimize;
  int threshold_len;
  int anchor;
  OnigDistance anchor_dmin;
  OnigDistance anchor_dmax;
  int sub_anchor;
  unsigned char *exact;
  unsigned char *exact_end;
  unsigned char map[256];
  int *int_map;
  int *int_map_backward;
  OnigDistance dmin;
  OnigDistance dmax;
  uint64_t timelimit;
  struct re_pattern_buffer* chain;
} OnigRegexType;
typedef OnigRegexType* OnigRegex;
typedef OnigRegexType regex_t;
typedef struct {
  int num_of_elements;
  OnigEncoding pattern_enc;
  OnigEncoding target_enc;
  const OnigSyntaxType* syntax;
  OnigOptionType option;
  OnigCaseFoldType case_fold_flag;
} OnigCompileInfo;
extern
int onig_initialize(OnigEncoding encodings[], int n);
extern
int onig_init(void);
extern
int onig_error_code_to_str(OnigUChar* s, OnigPosition err_code, ...);
extern
void onig_set_warn_func(OnigWarnFunc f);
extern
void onig_set_verb_warn_func(OnigWarnFunc f);
extern
int onig_new(OnigRegex*, const OnigUChar* pattern, const OnigUChar* pattern_end, OnigOptionType option, OnigEncoding enc, const OnigSyntaxType* syntax, OnigErrorInfo* einfo);
extern
int onig_reg_init(OnigRegex reg, OnigOptionType option, OnigCaseFoldType case_fold_flag, OnigEncoding enc, const OnigSyntaxType* syntax);
extern
int onig_new_without_alloc(OnigRegex, const OnigUChar* pattern, const OnigUChar* pattern_end, OnigOptionType option, OnigEncoding enc, const OnigSyntaxType* syntax, OnigErrorInfo* einfo);
extern
int onig_new_deluxe(OnigRegex* reg, const OnigUChar* pattern, const OnigUChar* pattern_end, OnigCompileInfo* ci, OnigErrorInfo* einfo);
extern
void onig_free(OnigRegex);
extern
void onig_free_body(OnigRegex);
extern
int onig_reg_copy(OnigRegex* reg, OnigRegex orig_reg);
extern
OnigPosition onig_scan(OnigRegex reg, const OnigUChar* str, const OnigUChar* end, OnigRegion* region, OnigOptionType option, int (*scan_callback)(OnigPosition, OnigPosition, OnigRegion*, void*), void* callback_arg);
extern
OnigPosition onig_search(OnigRegex, const OnigUChar* str, const OnigUChar* end, const OnigUChar* start, const OnigUChar* range, OnigRegion* region, OnigOptionType option);
extern
OnigPosition onig_search_gpos(OnigRegex, const OnigUChar* str, const OnigUChar* end, const OnigUChar* global_pos, const OnigUChar* start, const OnigUChar* range, OnigRegion* region, OnigOptionType option);
extern
OnigPosition onig_match(OnigRegex, const OnigUChar* str, const OnigUChar* end, const OnigUChar* at, OnigRegion* region, OnigOptionType option);
extern
int onig_check_linear_time(OnigRegex reg);
extern
OnigRegion* onig_region_new(void);
extern
void onig_region_init(OnigRegion* region);
extern
void onig_region_free(OnigRegion* region, int free_self);
extern
void onig_region_copy(OnigRegion* to, const OnigRegion* from);
extern
void onig_region_clear(OnigRegion* region);
extern
int onig_region_resize(OnigRegion* region, int n);
extern
int onig_region_set(OnigRegion* region, int at, int beg, int end);
extern
int onig_name_to_group_numbers(OnigRegex reg, const OnigUChar* name, const OnigUChar* name_end, int** nums);
extern
int onig_name_to_backref_number(OnigRegex reg, const OnigUChar* name, const OnigUChar* name_end, const OnigRegion *region);
extern
int onig_foreach_name(OnigRegex reg, int (*func)(const OnigUChar*, const OnigUChar*,int,int*,OnigRegex,void*), void* arg);
extern
int onig_number_of_names(const OnigRegexType *reg);
extern
int onig_number_of_captures(const OnigRegexType *reg);
extern
int onig_number_of_capture_histories(const OnigRegexType *reg);
extern
int onig_capture_tree_traverse(OnigRegion* region, int at, int(*callback_func)(int,OnigPosition,OnigPosition,int,int,void*), void* arg);
extern
int onig_noname_group_capture_is_active(const OnigRegexType *reg);
extern
OnigEncoding onig_get_encoding(const OnigRegexType *reg);
extern
OnigOptionType onig_get_options(const OnigRegexType *reg);
extern
OnigCaseFoldType onig_get_case_fold_flag(const OnigRegexType *reg);
extern
const OnigSyntaxType* onig_get_syntax(const OnigRegexType *reg);
extern
int onig_set_default_syntax(const OnigSyntaxType* syntax);
extern
void onig_copy_syntax(OnigSyntaxType* to, const OnigSyntaxType* from);
extern
unsigned int onig_get_syntax_op(const OnigSyntaxType* syntax);
extern
unsigned int onig_get_syntax_op2(const OnigSyntaxType* syntax);
extern
unsigned int onig_get_syntax_behavior(const OnigSyntaxType* syntax);
extern
OnigOptionType onig_get_syntax_options(const OnigSyntaxType* syntax);
extern
void onig_set_syntax_op(OnigSyntaxType* syntax, unsigned int op);
extern
void onig_set_syntax_op2(OnigSyntaxType* syntax, unsigned int op2);
extern
void onig_set_syntax_behavior(OnigSyntaxType* syntax, unsigned int behavior);
extern
void onig_set_syntax_options(OnigSyntaxType* syntax, OnigOptionType options);
extern
int onig_set_meta_char(OnigSyntaxType* syntax, unsigned int what, OnigCodePoint code);
extern
void onig_copy_encoding(OnigEncodingType *to, OnigEncoding from);
extern
OnigCaseFoldType onig_get_default_case_fold_flag(void);
extern
int onig_set_default_case_fold_flag(OnigCaseFoldType case_fold_flag);
extern
unsigned int onig_get_match_stack_limit_size(void);
extern
int onig_set_match_stack_limit_size(unsigned int size);
extern
unsigned int onig_get_parse_depth_limit(void);
extern
int onig_set_parse_depth_limit(unsigned int depth);
extern
int onig_end(void);
extern
const char* onig_version(void);
extern
const char* onig_copyright(void);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

extern VALUE rb_cEncoding;
enum ruby_encoding_consts {
    RUBY_ENCODING_INLINE_MAX = 127,
    RUBY_ENCODING_SHIFT = (RUBY_FL_USHIFT+10),
    RUBY_ENCODING_MASK = (RUBY_ENCODING_INLINE_MAX<<RUBY_ENCODING_SHIFT
                                                              ),
    RUBY_ENCODING_MAXNAMELEN = 42
};
static inline void
RB_ENCODING_SET_INLINED(VALUE obj, int encindex)
{
    VALUE f = encindex;
    f <<= RUBY_ENCODING_SHIFT;
    RB_FL_UNSET_RAW(obj, RUBY_ENCODING_MASK);
    RB_FL_SET_RAW(obj, f);
}
static inline int
RB_ENCODING_GET_INLINED(VALUE obj)
{
    VALUE ret = RB_FL_TEST_RAW(obj, RUBY_ENCODING_MASK) >> RUBY_ENCODING_SHIFT;
    return ((int)ret);
}
typedef const OnigEncodingType rb_encoding;

int rb_char_to_option_kcode(int c, int *option, int *kcode);
int rb_define_dummy_encoding(const char *name);
__attribute__((__pure__))
int rb_enc_dummy_p(rb_encoding *enc);
__attribute__((__pure__))
int rb_enc_to_index(rb_encoding *enc);
int rb_enc_get_index(VALUE obj);
static inline int
RB_ENCODING_GET(VALUE obj)
{
    int encindex = RB_ENCODING_GET_INLINED(obj);
    if (encindex == RUBY_ENCODING_INLINE_MAX) {
        return rb_enc_get_index(obj);
    }
    else {
        return encindex;
    }
}
void rb_enc_set_index(VALUE obj, int encindex);
static inline void
RB_ENCODING_SET(VALUE obj, int encindex)
{
    rb_enc_set_index(obj, encindex);
}
static inline void
RB_ENCODING_CODERANGE_SET(VALUE obj, int encindex, enum ruby_coderange_type cr)
{
    RB_ENCODING_SET(obj, encindex);
    RB_ENC_CODERANGE_SET(obj, cr);
}
__attribute__((__pure__))
int rb_enc_capable(VALUE obj);
int rb_enc_find_index(const char *name);
int rb_enc_alias(const char *alias, const char *orig);
int rb_to_encoding_index(VALUE obj);
rb_encoding *rb_to_encoding(VALUE obj);
rb_encoding *rb_find_encoding(VALUE obj);
rb_encoding *rb_enc_get(VALUE obj);
rb_encoding *rb_enc_compatible(VALUE str1, VALUE str2);
rb_encoding *rb_enc_check(VALUE str1,VALUE str2);
VALUE rb_enc_associate_index(VALUE obj, int encindex);
VALUE rb_enc_associate(VALUE obj, rb_encoding *enc);
void rb_enc_copy(VALUE dst, VALUE src);
rb_encoding *rb_enc_from_index(int idx);
rb_encoding *rb_enc_find(const char *name);
static inline const char *
rb_enc_name(rb_encoding *enc)
{
    return enc->name;
}
static inline int
rb_enc_mbminlen(rb_encoding *enc)
{
    return enc->min_enc_len;
}
static inline int
rb_enc_mbmaxlen(rb_encoding *enc)
{
    return enc->max_enc_len;
}
int rb_enc_mbclen(const char *p, const char *e, rb_encoding *enc);
int rb_enc_fast_mbclen(const char *p, const char *e, rb_encoding *enc);
int rb_enc_precise_mbclen(const char *p, const char *e, rb_encoding *enc);
int rb_enc_ascget(const char *p, const char *e, int *len, rb_encoding *enc);
unsigned int rb_enc_codepoint_len(const char *p, const char *e, int *len, rb_encoding *enc);
static inline unsigned int
rb_enc_codepoint(const char *p, const char *e, rb_encoding *enc)
{
    return rb_enc_codepoint_len(p, e, 0, enc);
}
static inline OnigCodePoint
rb_enc_mbc_to_codepoint(const char *p, const char *e, rb_encoding *enc)
{
    const OnigUChar *up = ((const OnigUChar *)p);
    const OnigUChar *ue = ((const OnigUChar *)e);
    return (enc)->mbc_to_code((up),(ue),enc);
}
int rb_enc_codelen(int code, rb_encoding *enc);
static inline int
rb_enc_code_to_mbclen(int c, rb_encoding *enc)
{
    OnigCodePoint uc = ((OnigCodePoint)c);
    return (enc)->code_to_mbclen(uc,enc);
}
static inline int
rb_enc_mbcput(unsigned int c, void *buf, rb_encoding *enc)
{
    OnigCodePoint uc = ((OnigCodePoint)c);
    OnigUChar *ubuf = ((OnigUChar *)buf);
    return (enc)->code_to_mbc(uc,ubuf,enc);
}
static inline char *
rb_enc_prev_char(const char *s, const char *p, const char *e, rb_encoding *enc)
{
    const OnigUChar *us = ((const OnigUChar *)s);
    const OnigUChar *up = ((const OnigUChar *)p);
    const OnigUChar *ue = ((const OnigUChar *)e);
    OnigUChar *ur = onigenc_get_prev_char_head(enc, us, up, ue);
    return ((char *)ur);
}
static inline char *
rb_enc_left_char_head(const char *s, const char *p, const char *e, rb_encoding *enc)
{
    const OnigUChar *us = ((const OnigUChar *)s);
    const OnigUChar *up = ((const OnigUChar *)p);
    const OnigUChar *ue = ((const OnigUChar *)e);
    OnigUChar *ur = onigenc_get_left_adjust_char_head(enc, us, up, ue);
    return ((char *)ur);
}
static inline char *
rb_enc_right_char_head(const char *s, const char *p, const char *e, rb_encoding *enc)
{
    const OnigUChar *us = ((const OnigUChar *)s);
    const OnigUChar *up = ((const OnigUChar *)p);
    const OnigUChar *ue = ((const OnigUChar *)e);
    OnigUChar *ur = onigenc_get_right_adjust_char_head(enc, us, up, ue);
    return ((char *)ur);
}
static inline char *
rb_enc_step_back(const char *s, const char *p, const char *e, int n, rb_encoding *enc)
{
    const OnigUChar *us = ((const OnigUChar *)s);
    const OnigUChar *up = ((const OnigUChar *)p);
    const OnigUChar *ue = ((const OnigUChar *)e);
    const OnigUChar *ur = onigenc_step_back(enc, us, up, ue, n);
    return ((char *)ur);
}
static inline int
rb_enc_asciicompat_inline(rb_encoding *enc)
{
    return rb_enc_mbminlen(enc)==1 && !rb_enc_dummy_p(enc);
}
static inline _Bool
rb_enc_asciicompat(rb_encoding *enc)
{
    if (rb_enc_mbminlen(enc) != 1) {
        return 0;
    }
    else if (rb_enc_dummy_p(enc)) {
        return 0;
    }
    else {
        return 1;
    }
}
static inline _Bool
rb_enc_str_asciicompat_p(VALUE str)
{
    rb_encoding *enc = rb_enc_get(str);
    return rb_enc_asciicompat(enc);
}
VALUE rb_enc_from_encoding(rb_encoding *enc);
__attribute__((__pure__))
int rb_enc_unicode_p(rb_encoding *enc);
__attribute__((__returns_nonnull__))
rb_encoding *rb_ascii8bit_encoding(void);
__attribute__((__returns_nonnull__))
rb_encoding *rb_utf8_encoding(void);
__attribute__((__returns_nonnull__))
rb_encoding *rb_usascii_encoding(void);
rb_encoding *rb_locale_encoding(void);
rb_encoding *rb_filesystem_encoding(void);
rb_encoding *rb_default_external_encoding(void);
rb_encoding *rb_default_internal_encoding(void);
__attribute__((__const__))
int rb_ascii8bit_encindex(void);
static inline _Bool
RB_ENCODING_IS_ASCII8BIT(VALUE obj)
{
    return RB_ENCODING_GET_INLINED(obj) == rb_ascii8bit_encindex();
}
__attribute__((__const__))
int rb_utf8_encindex(void);
__attribute__((__const__))
int rb_usascii_encindex(void);
int rb_locale_encindex(void);
int rb_filesystem_encindex(void);
VALUE rb_enc_default_external(void);
VALUE rb_enc_default_internal(void);
void rb_enc_set_default_external(VALUE encoding);
void rb_enc_set_default_internal(VALUE encoding);
VALUE rb_locale_charmap(VALUE klass);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

static inline _Bool
rb_enc_is_newline(const char *p, const char *e, rb_encoding *enc)
{
    OnigUChar *up = ((OnigUChar *)p);
    OnigUChar *ue = ((OnigUChar *)e);
    return (enc)->is_mbc_newline((up),(ue),enc);
}
static inline _Bool
rb_enc_isctype(OnigCodePoint c, OnigCtype t, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,t,enc);
}
static inline _Bool
rb_enc_isascii(OnigCodePoint c, rb_encoding *enc)
{
    return ((c) < 128);
}
static inline _Bool
rb_enc_isalpha(OnigCodePoint c, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,1,enc);
}
static inline _Bool
rb_enc_islower(OnigCodePoint c, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,6,enc);
}
static inline _Bool
rb_enc_isupper(OnigCodePoint c, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,10,enc);
}
static inline _Bool
rb_enc_iscntrl(OnigCodePoint c, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,3,enc);
}
static inline _Bool
rb_enc_ispunct(OnigCodePoint c, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,8,enc);
}
static inline _Bool
rb_enc_isalnum(OnigCodePoint c, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,13,enc);
}
static inline _Bool
rb_enc_isprint(OnigCodePoint c, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,7,enc);
}
static inline _Bool
rb_enc_isspace(OnigCodePoint c, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,9,enc);
}
static inline _Bool
rb_enc_isdigit(OnigCodePoint c, rb_encoding *enc)
{
    return (enc)->is_code_ctype(c,4,enc);
}
__attribute__((__const__))
int rb_enc_toupper(int c, rb_encoding *enc);
__attribute__((__const__))
int rb_enc_tolower(int c, rb_encoding *enc);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__nonnull__ ()))
char *rb_enc_path_next(const char *path, const char *end, rb_encoding *enc);
__attribute__((__nonnull__ ()))
char *rb_enc_path_skip_prefix(const char *path, const char *end, rb_encoding *enc);
__attribute__((__nonnull__ ()))
char *rb_enc_path_last_separator(const char *path, const char *end, rb_encoding *enc);
__attribute__((__nonnull__ ()))
char *rb_enc_path_end(const char *path, const char *end, rb_encoding *enc);
__attribute__((__nonnull__ (1, 4)))
const char *ruby_enc_find_basename(const char *name, long *baselen, long *alllen, rb_encoding *enc);
__attribute__((__nonnull__ (1, 3)))
const char *ruby_enc_find_extname(const char *name, long *len, rb_encoding *enc);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_enc_reg_new(const char *ptr, long len, rb_encoding *enc, int opts);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 3)))
VALUE rb_enc_sprintf(rb_encoding *enc, const char *fmt, ...);
__attribute__((__nonnull__ (2)))
__attribute__((__format__(__printf__, 2, 0)))
VALUE rb_enc_vsprintf(rb_encoding *enc, const char *fmt, va_list ap);
__attribute__((__noreturn__))
__attribute__((__nonnull__ (3)))
__attribute__((__format__(__printf__, 3, 4)))
void rb_enc_raise(rb_encoding *enc, VALUE exc, const char *fmt, ...);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

VALUE rb_enc_str_new(const char *ptr, long len, rb_encoding *enc);
__attribute__((__nonnull__ (1)))
VALUE rb_enc_str_new_cstr(const char *ptr, rb_encoding *enc);
VALUE rb_enc_str_new_static(const char *ptr, long len, rb_encoding *enc);
VALUE rb_enc_interned_str(const char *ptr, long len, rb_encoding *enc);
__attribute__((__nonnull__ (1)))
VALUE rb_enc_interned_str_cstr(const char *ptr, rb_encoding *enc);
long rb_enc_strlen(const char *head, const char *tail, rb_encoding *enc);
char *rb_enc_nth(const char *head, const char *tail, long nth, rb_encoding *enc);
VALUE rb_obj_encoding(VALUE obj);
VALUE rb_enc_str_buf_cat(VALUE str, const char *ptr, long len, rb_encoding *enc);
VALUE rb_enc_uint_chr(unsigned int code, rb_encoding *enc);
VALUE rb_external_str_new_with_enc(const char *ptr, long len, rb_encoding *enc);
VALUE rb_str_export_to_enc(VALUE obj, rb_encoding *enc);
VALUE rb_str_conv_enc(VALUE str, rb_encoding *from, rb_encoding *to);
VALUE rb_str_conv_enc_opts(VALUE str, rb_encoding *from, rb_encoding *to, int ecflags, VALUE ecopts);
int rb_enc_str_coderange(VALUE str);
long rb_str_coderange_scan_restartable(const char *str, const char *end, rb_encoding *enc, int *cr);
int rb_enc_str_asciionly_p(VALUE str);
__attribute__((__nonnull__ ()))
long rb_memsearch(const void *x, long m, const void *y, long n, rb_encoding *enc);
__attribute__((__nonnull__ ()))
static inline VALUE
rbimpl_enc_str_new_cstr(const char *str, rb_encoding *enc)
{
    long len = rbimpl_strlen(str);
    return rb_enc_str_new_static(str, len, enc);
}

#pragma GCC visibility pop


#pragma GCC visibility push(default)

ID rb_intern3(const char *name, long len, rb_encoding *enc);
__attribute__((__nonnull__ ()))
int rb_enc_symname_p(const char *str, rb_encoding *enc);
int rb_enc_symname2_p(const char *name, long len, rb_encoding *enc);
ID rb_check_id_cstr(const char *ptr, long len, rb_encoding *enc);
VALUE rb_check_symbol_cstr(const char *ptr, long len, rb_encoding *enc);

#pragma GCC visibility pop


#pragma GCC visibility push(default)

typedef enum {
    econv_invalid_byte_sequence,
    econv_undefined_conversion,
    econv_destination_buffer_full,
    econv_source_buffer_empty,
    econv_finished,
    econv_after_output,
    econv_incomplete_input
} rb_econv_result_t;
typedef struct rb_econv_t rb_econv_t;
VALUE rb_str_encode(VALUE str, VALUE to, int ecflags, VALUE ecopts);
int rb_econv_has_convpath_p(const char* from_encoding, const char* to_encoding);
int rb_econv_prepare_options(VALUE opthash, VALUE *ecopts, int ecflags);
int rb_econv_prepare_opts(VALUE opthash, VALUE *ecopts);
rb_econv_t *rb_econv_open(const char *source_encoding, const char *destination_encoding, int ecflags);
rb_econv_t *rb_econv_open_opts(const char *source_encoding, const char *destination_encoding, int ecflags, VALUE ecopts);
rb_econv_result_t rb_econv_convert(rb_econv_t *ec,
    const unsigned char **source_buffer_ptr, const unsigned char *source_buffer_end,
    unsigned char **destination_buffer_ptr, unsigned char *destination_buffer_end,
    int flags);
void rb_econv_close(rb_econv_t *ec);
int rb_econv_set_replacement(rb_econv_t *ec, const unsigned char *str, size_t len, const char *encname);
int rb_econv_decorate_at_first(rb_econv_t *ec, const char *decorator_name);
int rb_econv_decorate_at_last(rb_econv_t *ec, const char *decorator_name);
VALUE rb_econv_open_exc(const char *senc, const char *denc, int ecflags);
int rb_econv_insert_output(rb_econv_t *ec,
    const unsigned char *str, size_t len, const char *str_encoding);
const char *rb_econv_encoding_to_insert_output(rb_econv_t *ec);
void rb_econv_check_error(rb_econv_t *ec);
VALUE rb_econv_make_exception(rb_econv_t *ec);
int rb_econv_putbackable(rb_econv_t *ec);
void rb_econv_putback(rb_econv_t *ec, unsigned char *p, int n);
const char *rb_econv_asciicompat_encoding(const char *encname);
VALUE rb_econv_str_convert(rb_econv_t *ec, VALUE src, int flags);
VALUE rb_econv_substr_convert(rb_econv_t *ec, VALUE src, long byteoff, long bytesize, int flags);
VALUE rb_econv_str_append(rb_econv_t *ec, VALUE src, VALUE dst, int flags);
VALUE rb_econv_substr_append(rb_econv_t *ec, VALUE src, long byteoff, long bytesize, VALUE dst, int flags);
VALUE rb_econv_append(rb_econv_t *ec, const char *bytesrc, long bytesize, VALUE dst, int flags);
void rb_econv_binmode(rb_econv_t *ec);
enum ruby_econv_flag_type {
    RUBY_ECONV_ERROR_HANDLER_MASK = 0x000000ff,
    RUBY_ECONV_INVALID_MASK = 0x0000000f,
    RUBY_ECONV_INVALID_REPLACE = 0x00000002,
    RUBY_ECONV_UNDEF_MASK = 0x000000f0,
    RUBY_ECONV_UNDEF_REPLACE = 0x00000020,
    RUBY_ECONV_UNDEF_HEX_CHARREF = 0x00000030,
    RUBY_ECONV_DECORATOR_MASK = 0x0001ff00,
    RUBY_ECONV_NEWLINE_DECORATOR_MASK = 0x00007f00,
    RUBY_ECONV_NEWLINE_DECORATOR_READ_MASK = 0x00000f00,
    RUBY_ECONV_NEWLINE_DECORATOR_WRITE_MASK = 0x00007000,
    RUBY_ECONV_UNIVERSAL_NEWLINE_DECORATOR = 0x00000100,
    RUBY_ECONV_CRLF_NEWLINE_DECORATOR = 0x00001000,
    RUBY_ECONV_CR_NEWLINE_DECORATOR = 0x00002000,
    RUBY_ECONV_LF_NEWLINE_DECORATOR = 0x00004000,
    RUBY_ECONV_XML_TEXT_DECORATOR = 0x00008000,
    RUBY_ECONV_XML_ATTR_CONTENT_DECORATOR = 0x00010000,
    RUBY_ECONV_STATEFUL_DECORATOR_MASK = 0x00f00000,
    RUBY_ECONV_XML_ATTR_QUOTE_DECORATOR = 0x00100000,
    RUBY_ECONV_DEFAULT_NEWLINE_DECORATOR =
        0,
    RUBY_ECONV_PARTIAL_INPUT = 0x00020000,
    RUBY_ECONV_AFTER_OUTPUT = 0x00040000,
    RUBY_ECONV_FLAGS_PLACEHOLDER
};

#pragma GCC visibility pop

static VALUE mJSON, eNestingError, Encoding_UTF_8;
static VALUE CNaN, CInfinity, CMinusInfinity;
static ID i_json_creatable_p, i_json_create, i_create_id,
          i_chr, i_deep_const_get, i_match, i_aset, i_aref,
          i_leftshift, i_new, i_try_convert, i_uminus, i_encode;
static VALUE sym_max_nesting, sym_allow_nan, sym_allow_trailing_comma, sym_symbolize_names, sym_freeze,
             sym_create_additions, sym_create_id, sym_object_class, sym_array_class,
             sym_decimal_class, sym_match_string;
static int binary_encindex;
static int utf8_encindex;
static const char deprecated_create_additions_warning[] =
    "JSON.load implicit support for `create_additions: true` is deprecated "
    "and will be removed in 3.0, use JSON.unsafe_load or explicitly "
    "pass `create_additions: true`";
void
rb_hash_bulk_insert(long count, const VALUE *pairs, VALUE hash)
{
    long index = 0;
    while (index < count) {
        VALUE name = pairs[index++];
        VALUE value = pairs[index++];
        rb_hash_aset(hash, name, value);
    }
    (*__extension__ ({ volatile VALUE *rb_gc_guarded_ptr = &(hash); __asm__("" : : "m"(rb_gc_guarded_ptr)); rb_gc_guarded_ptr; }));
}
typedef struct rvalue_cache_struct {
    int length;
    VALUE entries[63];
} rvalue_cache;
static rb_encoding *enc_utf8;
static inline VALUE build_interned_string(const char *str, const long length)
{
    VALUE rstring = ((__builtin_constant_p(str) && __builtin_constant_p(length) ? rb_utf8_str_new_static : rb_utf8_str_new) ((str), (length)));
    return rb_funcall(rb_str_freeze(rstring), i_uminus, 0);
}
static inline VALUE build_symbol(const char *str, const long length)
{
    return rb_str_intern(build_interned_string(str, length));
}
static void rvalue_cache_insert_at(rvalue_cache *cache, int index, VALUE rstring)
{
    memmove((&cache->entries[index + 1]), (&cache->entries[index]), rbimpl_size_mul_or_raise(sizeof(VALUE), (cache->length - index)));
    cache->length++;
    cache->entries[index] = rstring;
}
static inline int rstring_cache_cmp(const char *str, const long length, VALUE rstring)
{
    long rstring_length = RSTRING_LEN(rstring);
    if (length == rstring_length) {
        return memcmp(str, RSTRING_PTR(rstring), length);
    } else {
        return (int)(length - rstring_length);
    }
}
static VALUE rstring_cache_fetch(rvalue_cache *cache, const char *str, const long length)
{
    if ((__builtin_expect(!!(length > 55), 0))) {
        return ((VALUE)RUBY_Qfalse);
    }
    if ((__builtin_expect(!!(!((*__ctype_b_loc ())[(int) ((str[0]))] & (unsigned short int) _ISalpha)), 0))) {
        return ((VALUE)RUBY_Qfalse);
    }
    int low = 0;
    int high = cache->length - 1;
    int mid = 0;
    int last_cmp = 0;
    while (low <= high) {
        mid = (high + low) >> 1;
        VALUE entry = cache->entries[mid];
        last_cmp = rstring_cache_cmp(str, length, entry);
        if (last_cmp == 0) {
            return entry;
        } else if (last_cmp > 0) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    if ((__builtin_expect(!!(memchr(str, '\\', length)), 0))) {
        return ((VALUE)RUBY_Qfalse);
    }
    VALUE rstring = build_interned_string(str, length);
    if (cache->length < 63) {
        if (last_cmp > 0) {
            mid += 1;
        }
        rvalue_cache_insert_at(cache, mid, rstring);
    }
    return rstring;
}
static VALUE rsymbol_cache_fetch(rvalue_cache *cache, const char *str, const long length)
{
    if ((__builtin_expect(!!(length > 55), 0))) {
        return ((VALUE)RUBY_Qfalse);
    }
    if ((__builtin_expect(!!(!((*__ctype_b_loc ())[(int) ((str[0]))] & (unsigned short int) _ISalpha)), 0))) {
        return ((VALUE)RUBY_Qfalse);
    }
    int low = 0;
    int high = cache->length - 1;
    int mid = 0;
    int last_cmp = 0;
    while (low <= high) {
        mid = (high + low) >> 1;
        VALUE entry = cache->entries[mid];
        last_cmp = rstring_cache_cmp(str, length, rb_sym2str(entry));
        if (last_cmp == 0) {
            return entry;
        } else if (last_cmp > 0) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    if ((__builtin_expect(!!(memchr(str, '\\', length)), 0))) {
        return ((VALUE)RUBY_Qfalse);
    }
    VALUE rsymbol = build_symbol(str, length);
    if (cache->length < 63) {
        if (last_cmp > 0) {
            mid += 1;
        }
        rvalue_cache_insert_at(cache, mid, rsymbol);
    }
    return rsymbol;
}
enum rvalue_stack_type {
    RVALUE_STACK_HEAP_ALLOCATED = 0,
    RVALUE_STACK_STACK_ALLOCATED = 1,
};
typedef struct rvalue_stack_struct {
    enum rvalue_stack_type type;
    long capa;
    long head;
    VALUE *ptr;
} rvalue_stack;
static rvalue_stack *rvalue_stack_spill(rvalue_stack *old_stack, VALUE *handle, rvalue_stack **stack_ref);
static rvalue_stack *rvalue_stack_grow(rvalue_stack *stack, VALUE *handle, rvalue_stack **stack_ref)
{
    long required = stack->capa * 2;
    if (stack->type == RVALUE_STACK_STACK_ALLOCATED) {
        stack = rvalue_stack_spill(stack, handle, stack_ref);
    } else {
        ((stack->ptr) = ((VALUE *)ruby_xrealloc2((void *)(stack->ptr), (required), sizeof(VALUE))));
        stack->capa = required;
    }
    return stack;
}
static VALUE rvalue_stack_push(rvalue_stack *stack, VALUE value, VALUE *handle, rvalue_stack **stack_ref)
{
    if ((__builtin_expect(!!(stack->head >= stack->capa), 0))) {
        stack = rvalue_stack_grow(stack, handle, stack_ref);
    }
    stack->ptr[stack->head] = value;
    stack->head++;
    return value;
}
static inline VALUE *rvalue_stack_peek(rvalue_stack *stack, long count)
{
    return stack->ptr + (stack->head - count);
}
static inline void rvalue_stack_pop(rvalue_stack *stack, long count)
{
    stack->head -= count;
}
static void rvalue_stack_mark(void *ptr)
{
    rvalue_stack *stack = (rvalue_stack *)ptr;
    long index;
    for (index = 0; index < stack->head; index++) {
        rb_gc_mark(stack->ptr[index]);
    }
}
static void rvalue_stack_free(void *ptr)
{
    rvalue_stack *stack = (rvalue_stack *)ptr;
    if (stack) {
        ruby_xfree(stack->ptr);
        ruby_xfree(stack);
    }
}
static size_t rvalue_stack_memsize(const void *ptr)
{
    const rvalue_stack *stack = (const rvalue_stack *)ptr;
    return sizeof(rvalue_stack) + sizeof(VALUE) * stack->capa;
}
static const rb_data_type_t JSON_Parser_rvalue_stack_type = {
    "JSON::Ext::Parser/rvalue_stack",
    {
        .dmark = rvalue_stack_mark,
        .dfree = rvalue_stack_free,
        .dsize = rvalue_stack_memsize,
    },
    0, 0,
    RUBY_TYPED_FREE_IMMEDIATELY,
};
static rvalue_stack *rvalue_stack_spill(rvalue_stack *old_stack, VALUE *handle, rvalue_stack **stack_ref)
{
    rvalue_stack *stack;
    *handle = __extension__({ VALUE data_struct_obj = rb_data_typed_object_zalloc(0, sizeof(rvalue_stack), &JSON_Parser_rvalue_stack_type); (stack) = (rvalue_stack *)RTYPEDDATA_GET_DATA(data_struct_obj); ((void)(stack)); data_struct_obj; });
    *stack_ref = stack;
    ruby_nonempty_memcpy((stack), (old_stack), rbimpl_size_mul_or_raise(sizeof(rvalue_stack), (1)));
    stack->capa = old_stack->capa << 1;
    stack->ptr = ((VALUE *)ruby_xmalloc2((stack->capa), sizeof(VALUE)));
    stack->type = RVALUE_STACK_HEAP_ALLOCATED;
    ruby_nonempty_memcpy((stack->ptr), (old_stack->ptr), rbimpl_size_mul_or_raise(sizeof(VALUE), (old_stack->head)));
    return stack;
}
static void rvalue_stack_eagerly_release(VALUE handle)
{
    if (handle) {
        rvalue_stack *stack;
        ((stack) = ((rvalue_stack *)rb_check_typeddata((handle), (&JSON_Parser_rvalue_stack_type))));
        (((struct RTypedData *)(handle))->data) = ((void *)0);
        rvalue_stack_free(stack);
    }
}
static const signed char digit_values[256] = {
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, -1,
    -1, -1, -1, -1, -1, -1, 10, 11, 12, 13, 14, 15, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    10, 11, 12, 13, 14, 15, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1
};
static uint32_t unescape_unicode(const unsigned char *p)
{
    const uint32_t replacement_char = 0xFFFD;
    signed char b;
    uint32_t result = 0;
    b = digit_values[p[0]];
    if (b < 0) return replacement_char;
    result = (result << 4) | (unsigned char)b;
    b = digit_values[p[1]];
    if (b < 0) return replacement_char;
    result = (result << 4) | (unsigned char)b;
    b = digit_values[p[2]];
    if (b < 0) return replacement_char;
    result = (result << 4) | (unsigned char)b;
    b = digit_values[p[3]];
    if (b < 0) return replacement_char;
    result = (result << 4) | (unsigned char)b;
    return result;
}
static int convert_UTF32_to_UTF8(char *buf, uint32_t ch)
{
    int len = 1;
    if (ch <= 0x7F) {
        buf[0] = (char) ch;
    } else if (ch <= 0x07FF) {
        buf[0] = (char) ((ch >> 6) | 0xC0);
        buf[1] = (char) ((ch & 0x3F) | 0x80);
        len++;
    } else if (ch <= 0xFFFF) {
        buf[0] = (char) ((ch >> 12) | 0xE0);
        buf[1] = (char) (((ch >> 6) & 0x3F) | 0x80);
        buf[2] = (char) ((ch & 0x3F) | 0x80);
        len += 2;
    } else if (ch <= 0x1fffff) {
        buf[0] =(char) ((ch >> 18) | 0xF0);
        buf[1] =(char) (((ch >> 12) & 0x3F) | 0x80);
        buf[2] =(char) (((ch >> 6) & 0x3F) | 0x80);
        buf[3] =(char) ((ch & 0x3F) | 0x80);
        len += 3;
    } else {
        buf[0] = '?';
    }
    return len;
}
typedef struct JSON_ParserStruct {
    VALUE create_id;
    VALUE object_class;
    VALUE array_class;
    VALUE decimal_class;
    ID decimal_method_id;
    VALUE match_string;
    int max_nesting;
    _Bool allow_nan;
    _Bool allow_trailing_comma;
    _Bool parsing_name;
    _Bool symbolize_names;
    _Bool freeze;
    _Bool create_additions;
    _Bool deprecated_create_additions;
} JSON_ParserConfig;
typedef struct JSON_ParserStateStruct {
    VALUE stack_handle;
    const char *cursor;
    const char *end;
    rvalue_stack *stack;
    rvalue_cache name_cache;
    int in_array;
    int current_nesting;
} JSON_ParserState;
static const rb_data_type_t JSON_ParserConfig_type;
static size_t strnlen(const char *s, size_t maxlen)
{
    char *p;
    return ((p = memchr(s, '\0', maxlen)) ? p - s : maxlen);
}
__attribute__((__noreturn__))
static void raise_parse_error(const char *format, const char *start)
{
    char buffer[32 + 1];
    size_t len = start ? strnlen(start, 32) : 0;
    const char *ptr = start;
    if (len == 32) {
        ruby_nonempty_memcpy((buffer), (start), rbimpl_size_mul_or_raise(sizeof(char), (32)));
        buffer[32] = '\0';
        ptr = buffer;
    }
    rb_enc_raise(enc_utf8, rb_path2class("JSON::ParserError"), format, ptr);
}
static const _Bool whitespace[256] = {
    [' '] = 1,
    ['\t'] = 1,
    ['\n'] = 1,
    ['\r'] = 1,
    ['/'] = 1,
};
static void
json_eat_comments(JSON_ParserState *state)
{
    if (state->cursor + 1 < state->end) {
        switch(state->cursor[1]) {
            case '/': {
                state->cursor = memchr(state->cursor, '\n', state->end - state->cursor);
                if (!state->cursor) {
                    state->cursor = state->end;
                } else {
                    state->cursor++;
                }
                break;
            }
            case '*': {
                state->cursor += 2;
                while (1) {
                    state->cursor = memchr(state->cursor, '*', state->end - state->cursor);
                    if (!state->cursor) {
                        state->cursor = state->end;
                        break;
                    } else {
                        state->cursor++;
                        if (state->cursor < state->end && *state->cursor == '/') {
                            state->cursor++;
                            break;
                        }
                    }
                }
                break;
            }
            default:
                return;
        }
    }
}
static inline void
json_eat_whitespace(JSON_ParserState *state)
{
    while (state->cursor < state->end && (__builtin_expect(!!(whitespace[(unsigned char)*state->cursor]), 0))) {
        if ((__builtin_expect(!!(*state->cursor != '/'), 1))) {
            state->cursor++;
        } else {
            json_eat_comments(state);
        }
    }
}
static inline VALUE build_string(const char *start, const char *end, _Bool intern, _Bool symbolize)
{
    if (symbolize) {
        intern = 1;
    }
    VALUE result;
    result = ((__builtin_constant_p(start) && __builtin_constant_p((long)(end - start)) ? rb_utf8_str_new_static : rb_utf8_str_new) ((start), ((long)(end - start))));
    if (intern) {
        result = rb_funcall(rb_str_freeze(result), i_uminus, 0);
    }
    if (symbolize) {
      result = rb_str_intern(result);
    }
    return result;
}
static inline VALUE json_string_fastpath(JSON_ParserState *state, const char *string, const char *stringEnd, _Bool is_name, _Bool intern, _Bool symbolize)
{
    size_t bufferSize = stringEnd - string;
    if (is_name && state->in_array) {
        VALUE cached_key;
        if ((__builtin_expect(!!(symbolize), 0))) {
            cached_key = rsymbol_cache_fetch(&state->name_cache, string, bufferSize);
        } else {
            cached_key = rstring_cache_fetch(&state->name_cache, string, bufferSize);
        }
        if ((__builtin_expect(!!(cached_key), 1))) {
            return cached_key;
        }
    }
    return build_string(string, stringEnd, intern, symbolize);
}
static VALUE json_string_unescape(JSON_ParserState *state, const char *string, const char *stringEnd, _Bool is_name, _Bool intern, _Bool symbolize)
{
    size_t bufferSize = stringEnd - string;
    const char *p = string, *pe = string, *unescape, *bufferStart;
    char *buffer;
    int unescape_len;
    char buf[4];
    if (is_name && state->in_array) {
        VALUE cached_key;
        if ((__builtin_expect(!!(symbolize), 0))) {
            cached_key = rsymbol_cache_fetch(&state->name_cache, string, bufferSize);
        } else {
            cached_key = rstring_cache_fetch(&state->name_cache, string, bufferSize);
        }
        if ((__builtin_expect(!!(cached_key), 1))) {
            return cached_key;
        }
    }
    VALUE result = rb_str_buf_new(bufferSize);
    rb_enc_associate_index(result, utf8_encindex);
    buffer = RSTRING_PTR(result);
    bufferStart = buffer;
    while ((pe = memchr(pe, '\\', stringEnd - pe))) {
        unescape = (char *) "?";
        unescape_len = 1;
        if (pe > p) {
          ruby_nonempty_memcpy((buffer), (p), rbimpl_size_mul_or_raise(sizeof(char), (pe - p)));
          buffer += pe - p;
        }
        switch (*++pe) {
            case 'n':
                unescape = (char *) "\n";
                break;
            case 'r':
                unescape = (char *) "\r";
                break;
            case 't':
                unescape = (char *) "\t";
                break;
            case '"':
                unescape = (char *) "\"";
                break;
            case '\\':
                unescape = (char *) "\\";
                break;
            case 'b':
                unescape = (char *) "\b";
                break;
            case 'f':
                unescape = (char *) "\f";
                break;
            case 'u':
                if (pe > stringEnd - 4) {
                  raise_parse_error("incomplete unicode character escape sequence at '%s'", p);
                } else {
                    uint32_t ch = unescape_unicode((unsigned char *) ++pe);
                    pe += 3;
                    if ((ch & 0xFC00) == 0xD800) {
                        pe++;
                        if (pe > stringEnd - 6) {
                          raise_parse_error("incomplete surrogate pair at '%s'", p);
                        }
                        if (pe[0] == '\\' && pe[1] == 'u') {
                            uint32_t sur = unescape_unicode((unsigned char *) pe + 2);
                            ch = (((ch & 0x3F) << 10) | ((((ch >> 6) & 0xF) + 1) << 16)
                                    | (sur & 0x3FF));
                            pe += 5;
                        } else {
                            unescape = (char *) "?";
                            break;
                        }
                    }
                    unescape_len = convert_UTF32_to_UTF8(buf, ch);
                    unescape = buf;
                }
                break;
            default:
                p = pe;
                continue;
        }
        ruby_nonempty_memcpy((buffer), (unescape), rbimpl_size_mul_or_raise(sizeof(char), (unescape_len)));
        buffer += unescape_len;
        p = ++pe;
    }
    if (stringEnd > p) {
      ruby_nonempty_memcpy((buffer), (p), rbimpl_size_mul_or_raise(sizeof(char), (stringEnd - p)));
      buffer += stringEnd - p;
    }
    rb_str_set_len(result, buffer - bufferStart);
    if (symbolize) {
        result = rb_str_intern(result);
    } else if (intern) {
        result = rb_funcall(rb_str_freeze(result), i_uminus, 0);
    }
    return result;
}
static inline VALUE fast_decode_integer(const char *p, const char *pe)
{
    _Bool negative = 0;
    if (*p == '-') {
        negative = 1;
        p++;
    }
    long long memo = 0;
    while (p < pe) {
        memo *= 10;
        memo += *p - '0';
        p++;
    }
    if (negative) {
        memo = -memo;
    }
    return rb_ll2num_inline(memo);
}
static VALUE json_decode_large_integer(const char *start, long len)
{
    VALUE buffer_v;
    char *buffer = ((char *) (((size_t)(len + 1) < 1024 / sizeof(char)) ? ((buffer_v) = 0, __builtin_alloca ((len + 1) * sizeof(char))) : rb_alloc_tmp_buffer2(&(buffer_v), (len + 1), sizeof(char))));
    ruby_nonempty_memcpy((buffer), (start), rbimpl_size_mul_or_raise(sizeof(char), (len)));
    buffer[len] = '\0';
    VALUE number = rb_cstr2inum(buffer, 10);
    rb_free_tmp_buffer(&(buffer_v));
    return number;
}
static inline VALUE
json_decode_integer(const char *start, const char *end)
{
        long len = end - start;
        if ((__builtin_expect(!!(len < 18), 1))) {
            return fast_decode_integer(start, end);
        }
        return json_decode_large_integer(start, len);
}
static VALUE json_decode_large_float(const char *start, long len)
{
    VALUE buffer_v;
    char *buffer = ((char *) (((size_t)(len + 1) < 1024 / sizeof(char)) ? ((buffer_v) = 0, __builtin_alloca ((len + 1) * sizeof(char))) : rb_alloc_tmp_buffer2(&(buffer_v), (len + 1), sizeof(char))));
    ruby_nonempty_memcpy((buffer), (start), rbimpl_size_mul_or_raise(sizeof(char), (len)));
    buffer[len] = '\0';
    VALUE number = rb_float_new(rb_cstr_to_dbl(buffer, 1));
    rb_free_tmp_buffer(&(buffer_v));
    return number;
}
static VALUE json_decode_float(JSON_ParserConfig *config, const char *start, const char *end)
{
    long len = end - start;
    if ((__builtin_expect(!!(config->decimal_class), 0))) {
        VALUE text = ((__builtin_constant_p(start) && __builtin_constant_p(len) ? rb_str_new_static : rb_str_new) ((start), (len)));
        return rb_funcallv(config->decimal_class, config->decimal_method_id, 1, &text);
    } else if ((__builtin_expect(!!(len < 64), 1))) {
        char buffer[64];
        ruby_nonempty_memcpy((buffer), (start), rbimpl_size_mul_or_raise(sizeof(char), (len)));
        buffer[len] = '\0';
        return rb_float_new(rb_cstr_to_dbl(buffer, 1));
    } else {
        return json_decode_large_float(start, len);
    }
}
static inline VALUE json_decode_array(JSON_ParserState *state, JSON_ParserConfig *config, long count)
{
    VALUE array;
    if ((__builtin_expect(!!(config->array_class), 0))) {
        array = rb_class_new_instance(0, 0, config->array_class);
        VALUE *items = rvalue_stack_peek(state->stack, count);
        long index;
        for (index = 0; index < count; index++) {
            rb_funcall(array, i_leftshift, 1, items[index]);
        }
    } else {
        array = rb_ary_new_from_values(count, rvalue_stack_peek(state->stack, count));
    }
    rvalue_stack_pop(state->stack, count);
    if (config->freeze) {
        rb_obj_freeze_inline(array);
    }
    return array;
}
static inline VALUE json_decode_object(JSON_ParserState *state, JSON_ParserConfig *config, long count)
{
    VALUE object;
    if ((__builtin_expect(!!(config->object_class), 0))) {
        object = rb_class_new_instance(0, 0, config->object_class);
        long index = 0;
        VALUE *items = rvalue_stack_peek(state->stack, count);
        while (index < count) {
            VALUE name = items[index++];
            VALUE value = items[index++];
            rb_funcall(object, i_aset, 2, name, value);
        }
    } else {
        object = rb_hash_new();
        rb_hash_bulk_insert(count, rvalue_stack_peek(state->stack, count), object);
    }
    rvalue_stack_pop(state->stack, count);
    if ((__builtin_expect(!!(config->create_additions), 0))) {
        VALUE klassname;
        if (config->object_class) {
            klassname = rb_funcall(object, i_aref, 1, config->create_id);
        } else {
            klassname = rb_hash_aref(object, config->create_id);
        }
        if (!RB_NIL_P(klassname)) {
            VALUE klass = rb_funcall(mJSON, i_deep_const_get, 1, klassname);
            if (RB_TEST(rb_funcall(klass, i_json_creatable_p, 0))) {
                if (config->deprecated_create_additions) {
                    rb_warn(deprecated_create_additions_warning);
                }
                object = rb_funcall(klass, i_json_create, 1, object);
            }
        }
    }
    if (config->freeze) {
        rb_obj_freeze_inline(object);
    }
    return object;
}
static int match_i(VALUE regexp, VALUE klass, VALUE memo)
{
    if (regexp == ((VALUE)RUBY_Qundef)) return ST_STOP;
    if (RB_TEST(rb_funcall(klass, i_json_creatable_p, 0)) &&
      RB_TEST(rb_funcall(regexp, i_match, 1, rb_ary_entry(memo, 0)))) {
        rb_ary_push(memo, klass);
        return ST_STOP;
    }
    return ST_CONTINUE;
}
static inline VALUE json_decode_string(JSON_ParserState *state, JSON_ParserConfig *config, const char *start, const char *end, _Bool escaped, _Bool is_name)
{
    VALUE string;
    _Bool intern = is_name || config->freeze;
    _Bool symbolize = is_name && config->symbolize_names;
    if (escaped) {
        string = json_string_unescape(state, start, end, is_name, intern, symbolize);
    } else {
        string = json_string_fastpath(state, start, end, is_name, intern, symbolize);
    }
    if ((__builtin_expect(!!(config->create_additions && RB_TEST(config->match_string)), 0))) {
          VALUE klass;
          VALUE memo = rb_ary_new_capa(2);
          rb_ary_push(memo, string);
          rb_hash_foreach(config->match_string, match_i, memo);
          klass = rb_ary_entry(memo, 1);
          if (RB_TEST(klass)) {
              string = rb_funcall(klass, i_json_create, 1, string);
          }
    }
    return string;
}
static const _Bool string_scan[256] = {
     1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
     1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
     0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};
static inline VALUE json_parse_string(JSON_ParserState *state, JSON_ParserConfig *config, _Bool is_name)
{
    state->cursor++;
    const char *start = state->cursor;
    _Bool escaped = 0;
    while (state->cursor < state->end) {
        if ((__builtin_expect(!!(string_scan[(unsigned char)*state->cursor]), 0))) {
            switch (*state->cursor) {
                case '"': {
                    VALUE string = json_decode_string(state, config, start, state->cursor, escaped, is_name);
                    state->cursor++;
                    return rvalue_stack_push(state->stack, string, &state->stack_handle, &state->stack);
                }
                case '\\': {
                    state->cursor++;
                    escaped = 1;
                    if ((unsigned char)*state->cursor < 0x20) {
                        raise_parse_error("invalid ASCII control character in string: %s", state->cursor);
                    }
                    break;
                }
                default:
                    raise_parse_error("invalid ASCII control character in string: %s", state->cursor);
                    break;
            }
        }
        state->cursor++;
    }
    raise_parse_error("unexpected end of input, expected closing \"", state->cursor);
    return ((VALUE)RUBY_Qfalse);
}
static VALUE json_parse_any(JSON_ParserState *state, JSON_ParserConfig *config)
{
    json_eat_whitespace(state);
    if (state->cursor >= state->end) {
        raise_parse_error("unexpected end of input", state->cursor);
    }
    switch (*state->cursor) {
        case 'n':
            if ((state->end - state->cursor >= 4) && (memcmp(state->cursor, "null", 4) == 0)) {
                state->cursor += 4;
                return rvalue_stack_push(state->stack, ((VALUE)RUBY_Qnil), &state->stack_handle, &state->stack);
            }
            raise_parse_error("unexpected token at '%s'", state->cursor);
            break;
        case 't':
            if ((state->end - state->cursor >= 4) && (memcmp(state->cursor, "true", 4) == 0)) {
                state->cursor += 4;
                return rvalue_stack_push(state->stack, ((VALUE)RUBY_Qtrue), &state->stack_handle, &state->stack);
            }
            raise_parse_error("unexpected token at '%s'", state->cursor);
            break;
        case 'f':
            if ((state->end - state->cursor >= 5) && (memcmp(state->cursor + 1, "alse", 4) == 0)) {
                state->cursor += 5;
                return rvalue_stack_push(state->stack, ((VALUE)RUBY_Qfalse), &state->stack_handle, &state->stack);
            }
            raise_parse_error("unexpected token at '%s'", state->cursor);
            break;
        case 'N':
            if (config->allow_nan && (state->end - state->cursor >= 3) && (memcmp(state->cursor + 1, "aN", 2) == 0)) {
                state->cursor += 3;
                return rvalue_stack_push(state->stack, CNaN, &state->stack_handle, &state->stack);
            }
            raise_parse_error("unexpected token at '%s'", state->cursor);
            break;
        case 'I':
            if (config->allow_nan && (state->end - state->cursor >= 8) && (memcmp(state->cursor, "Infinity", 8) == 0)) {
                state->cursor += 8;
                return rvalue_stack_push(state->stack, CInfinity, &state->stack_handle, &state->stack);
            }
            raise_parse_error("unexpected token at '%s'", state->cursor);
            break;
        case '-':
            if ((state->end - state->cursor >= 9) && (memcmp(state->cursor + 1, "Infinity", 8) == 0)) {
                if (config->allow_nan) {
                    state->cursor += 9;
                    return rvalue_stack_push(state->stack, CMinusInfinity, &state->stack_handle, &state->stack);
                } else {
                    raise_parse_error("unexpected token at '%s'", state->cursor);
                }
            }
        case '0': case '1': case '2': case '3': case '4': case '5': case '6': case '7': case '8': case '9': {
            _Bool integer = 1;
            const char *start = state->cursor;
            state->cursor++;
            while ((state->cursor < state->end) && (*state->cursor >= '0') && (*state->cursor <= '9')) {
                state->cursor++;
            }
            long integer_length = state->cursor - start;
            if ((__builtin_expect(!!(start[0] == '0' && integer_length > 1), 0))) {
                raise_parse_error("invalid number: %s", start);
            } else if ((__builtin_expect(!!(integer_length > 2 && start[0] == '-' && start[1] == '0'), 0))) {
                raise_parse_error("invalid number: %s", start);
            }
            if ((state->cursor < state->end) && (*state->cursor == '.')) {
                integer = 0;
                state->cursor++;
                if (state->cursor == state->end || *state->cursor < '0' || *state->cursor > '9') {
                    raise_parse_error("invalid number: %s", state->cursor);
                }
                while ((state->cursor < state->end) && (*state->cursor >= '0') && (*state->cursor <= '9')) {
                    state->cursor++;
                }
            }
            if ((state->cursor < state->end) && ((*state->cursor == 'e') || (*state->cursor == 'E'))) {
                integer = 0;
                state->cursor++;
                if ((state->cursor < state->end) && ((*state->cursor == '+') || (*state->cursor == '-'))) {
                    state->cursor++;
                }
                if (state->cursor == state->end || *state->cursor < '0' || *state->cursor > '9') {
                    raise_parse_error("invalid number: %s", state->cursor);
                }
                while ((state->cursor < state->end) && (*state->cursor >= '0') && (*state->cursor <= '9')) {
                    state->cursor++;
                }
            }
            if (integer) {
                return rvalue_stack_push(state->stack, json_decode_integer(start, state->cursor), &state->stack_handle, &state->stack);
            }
            return rvalue_stack_push(state->stack, json_decode_float(config, start, state->cursor), &state->stack_handle, &state->stack);
        }
        case '"': {
            return json_parse_string(state, config, 0);
            break;
        }
        case '[': {
            state->cursor++;
            json_eat_whitespace(state);
            long stack_head = state->stack->head;
            if ((state->cursor < state->end) && (*state->cursor == ']')) {
                state->cursor++;
                return rvalue_stack_push(state->stack, json_decode_array(state, config, 0), &state->stack_handle, &state->stack);
            } else {
                state->current_nesting++;
                if ((__builtin_expect(!!(config->max_nesting && (config->max_nesting < state->current_nesting)), 0))) {
                    rb_raise(eNestingError, "nesting of %d is too deep", state->current_nesting);
                }
                state->in_array++;
                json_parse_any(state, config);
            }
            while (1) {
                json_eat_whitespace(state);
                if (state->cursor < state->end) {
                    if (*state->cursor == ']') {
                        state->cursor++;
                        long count = state->stack->head - stack_head;
                        state->current_nesting--;
                        state->in_array--;
                        return rvalue_stack_push(state->stack, json_decode_array(state, config, count), &state->stack_handle, &state->stack);
                    }
                    if (*state->cursor == ',') {
                        state->cursor++;
                        if (config->allow_trailing_comma) {
                            json_eat_whitespace(state);
                            if ((state->cursor < state->end) && (*state->cursor == ']')) {
                                continue;
                            }
                        }
                        json_parse_any(state, config);
                        continue;
                    }
                }
                raise_parse_error("expected ',' or ']' after array value", state->cursor);
            }
            break;
        }
        case '{': {
            state->cursor++;
            json_eat_whitespace(state);
            long stack_head = state->stack->head;
            if ((state->cursor < state->end) && (*state->cursor == '}')) {
                state->cursor++;
                return rvalue_stack_push(state->stack, json_decode_object(state, config, 0), &state->stack_handle, &state->stack);
            } else {
                state->current_nesting++;
                if ((__builtin_expect(!!(config->max_nesting && (config->max_nesting < state->current_nesting)), 0))) {
                    rb_raise(eNestingError, "nesting of %d is too deep", state->current_nesting);
                }
                if (*state->cursor != '"') {
                    raise_parse_error("expected object key, got '%s", state->cursor);
                }
                json_parse_string(state, config, 1);
                json_eat_whitespace(state);
                if ((state->cursor >= state->end) || (*state->cursor != ':')) {
                    raise_parse_error("expected ':' after object key", state->cursor);
                }
                state->cursor++;
                json_parse_any(state, config);
            }
            while (1) {
                json_eat_whitespace(state);
                if (state->cursor < state->end) {
                    if (*state->cursor == '}') {
                        state->cursor++;
                        state->current_nesting--;
                        long count = state->stack->head - stack_head;
                        return rvalue_stack_push(state->stack, json_decode_object(state, config, count), &state->stack_handle, &state->stack);
                    }
                    if (*state->cursor == ',') {
                        state->cursor++;
                        json_eat_whitespace(state);
                        if (config->allow_trailing_comma) {
                            if ((state->cursor < state->end) && (*state->cursor == '}')) {
                                continue;
                            }
                        }
                        if (*state->cursor != '"') {
                            raise_parse_error("expected object key, got: '%s'", state->cursor);
                        }
                        json_parse_string(state, config, 1);
                        json_eat_whitespace(state);
                        if ((state->cursor >= state->end) || (*state->cursor != ':')) {
                            raise_parse_error("expected ':' after object key, got: '%s", state->cursor);
                        }
                        state->cursor++;
                        json_parse_any(state, config);
                        continue;
                    }
                }
                raise_parse_error("expected ',' or '}' after object value, got: '%s'", state->cursor);
            }
            break;
        }
        default:
            raise_parse_error("unexpected character: '%s'", state->cursor);
            break;
    }
    raise_parse_error("unreacheable: '%s'", state->cursor);
}
static void json_ensure_eof(JSON_ParserState *state)
{
    json_eat_whitespace(state);
    if (state->cursor != state->end) {
        raise_parse_error("unexpected token at end of stream '%s'", state->cursor);
    }
}
static VALUE convert_encoding(VALUE source)
{
  int encindex = RB_ENCODING_GET(source);
  if ((__builtin_expect(!!(encindex == utf8_encindex), 1))) {
    return source;
  }
 if (encindex == binary_encindex) {
    return rb_enc_associate_index(rb_str_dup(source), utf8_encindex);
  }
  return rb_funcall(source, i_encode, 1, Encoding_UTF_8);
}
static int parser_config_init_i(VALUE key, VALUE val, VALUE data)
{
    JSON_ParserConfig *config = (JSON_ParserConfig *)data;
         if (key == sym_max_nesting) { config->max_nesting = RB_TEST(val) ? RB_FIX2INT(val) : 0; }
    else if (key == sym_allow_nan) { config->allow_nan = RB_TEST(val); }
    else if (key == sym_allow_trailing_comma) { config->allow_trailing_comma = RB_TEST(val); }
    else if (key == sym_symbolize_names) { config->symbolize_names = RB_TEST(val); }
    else if (key == sym_freeze) { config->freeze = RB_TEST(val); }
    else if (key == sym_create_id) { config->create_id = RB_TEST(val) ? val : ((VALUE)RUBY_Qfalse); }
    else if (key == sym_object_class) { config->object_class = RB_TEST(val) ? val : ((VALUE)RUBY_Qfalse); }
    else if (key == sym_array_class) { config->array_class = RB_TEST(val) ? val : ((VALUE)RUBY_Qfalse); }
    else if (key == sym_match_string) { config->match_string = RB_TEST(val) ? val : ((VALUE)RUBY_Qfalse); }
    else if (key == sym_decimal_class) {
        if (RB_TEST(val)) {
            if (rb_respond_to(val, i_try_convert)) {
                config->decimal_class = val;
                config->decimal_method_id = i_try_convert;
            } else if (rb_respond_to(val, i_new)) {
                config->decimal_class = val;
                config->decimal_method_id = i_new;
            } else if (RB_TYPE_P(val, RUBY_T_CLASS)) {
                VALUE name = rb_class_name(val);
                const char *name_cstr = RSTRING_PTR(name);
                const char *last_colon = strrchr(name_cstr, ':');
                if (last_colon) {
                    const char *mod_path_end = last_colon - 1;
                    VALUE mod_path = rb_str_substr(name, 0, mod_path_end - name_cstr);
                    config->decimal_class = rb_path_to_class(mod_path);
                    const char *method_name_beg = last_colon + 1;
                    long before_len = method_name_beg - name_cstr;
                    long len = RSTRING_LEN(name) - before_len;
                    VALUE method_name = rb_str_substr(name, before_len, len);
                    config->decimal_method_id = rb_sym2id(rb_str_intern(method_name));
                } else {
                    config->decimal_class = rb_mKernel;
                    config->decimal_method_id = rb_sym2id(rb_str_intern(name));
                }
            }
        }
    }
    else if (key == sym_create_additions) {
        if (RB_NIL_P(val)) {
            config->create_additions = 1;
            config->deprecated_create_additions = 1;
        } else {
            config->create_additions = RB_TEST(val);
            config->deprecated_create_additions = 0;
        }
    }
    return ST_CONTINUE;
}
static void parser_config_init(JSON_ParserConfig *config, VALUE opts)
{
    config->max_nesting = 100;
    if (!RB_NIL_P(opts)) {
        Check_Type(opts, RUBY_T_HASH);
        if (rb_hash_size_num(opts) > 0) {
            rb_hash_foreach(opts, parser_config_init_i, (VALUE)config);
            if (config->symbolize_names && config->create_additions) {
                rb_raise(rb_eArgError,
                    "options :symbolize_names and :create_additions cannot be "
                    " used in conjunction");
            }
            if (config->create_additions && !config->create_id) {
                config->create_id = rb_funcall(mJSON, i_create_id, 0);
            }
        }
    }
}
static VALUE cParserConfig_initialize(VALUE self, VALUE opts)
{
    JSON_ParserConfig *config; ((config) = ((JSON_ParserConfig *)rb_check_typeddata((self), (&JSON_ParserConfig_type))));
    parser_config_init(config, opts);
    (rb_obj_written((VALUE)(self), (VALUE)(((VALUE)RUBY_Qundef)), (VALUE)(config->create_id), "parser.c", 1310));
    (rb_obj_written((VALUE)(self), (VALUE)(((VALUE)RUBY_Qundef)), (VALUE)(config->object_class), "parser.c", 1311));
    (rb_obj_written((VALUE)(self), (VALUE)(((VALUE)RUBY_Qundef)), (VALUE)(config->array_class), "parser.c", 1312));
    (rb_obj_written((VALUE)(self), (VALUE)(((VALUE)RUBY_Qundef)), (VALUE)(config->decimal_class), "parser.c", 1313));
    (rb_obj_written((VALUE)(self), (VALUE)(((VALUE)RUBY_Qundef)), (VALUE)(config->match_string), "parser.c", 1314));
    return self;
}
static VALUE cParser_parse(JSON_ParserConfig *config, VALUE Vsource)
{
    Vsource = convert_encoding(rb_string_value(&(Vsource)));
    rb_string_value(&(Vsource));
    VALUE rvalue_stack_buffer[128];
    rvalue_stack stack = {
        .type = RVALUE_STACK_STACK_ALLOCATED,
        .ptr = rvalue_stack_buffer,
        .capa = 128,
    };
    JSON_ParserState _state = {
        .cursor = RSTRING_PTR(Vsource),
        .end = RSTRING_END(Vsource),
        .stack = &stack,
    };
    JSON_ParserState *state = &_state;
    VALUE result = json_parse_any(state, config);
    rvalue_stack_eagerly_release(state->stack_handle);
    json_ensure_eof(state);
    return result;
}
static VALUE cParserConfig_parse(VALUE self, VALUE Vsource)
{
    JSON_ParserConfig *config; ((config) = ((JSON_ParserConfig *)rb_check_typeddata((self), (&JSON_ParserConfig_type))));
    return cParser_parse(config, Vsource);
}
static VALUE cParser_m_parse(VALUE klass, VALUE Vsource, VALUE opts)
{
    Vsource = convert_encoding(rb_string_value(&(Vsource)));
    rb_string_value(&(Vsource));
    JSON_ParserConfig _config = {0};
    JSON_ParserConfig *config = &_config;
    parser_config_init(config, opts);
    return cParser_parse(config, Vsource);
}
static void JSON_ParserConfig_mark(void *ptr)
{
    JSON_ParserConfig *config = ptr;
    rb_gc_mark(config->create_id);
    rb_gc_mark(config->object_class);
    rb_gc_mark(config->array_class);
    rb_gc_mark(config->decimal_class);
    rb_gc_mark(config->match_string);
}
static void JSON_ParserConfig_free(void *ptr)
{
    JSON_ParserConfig *config = ptr;
    ruby_xfree(config);
}
static size_t JSON_ParserConfig_memsize(const void *ptr)
{
    return sizeof(JSON_ParserConfig);
}
static const rb_data_type_t JSON_ParserConfig_type = {
    "JSON::Ext::Parser/ParserConfig",
    {
        JSON_ParserConfig_mark,
        JSON_ParserConfig_free,
        JSON_ParserConfig_memsize,
    },
    0, 0,
    RUBY_TYPED_FREE_IMMEDIATELY | RUBY_TYPED_WB_PROTECTED,
};
static VALUE cJSON_parser_s_allocate(VALUE klass)
{
    JSON_ParserConfig *config;
    return __extension__({ VALUE data_struct_obj = rb_data_typed_object_zalloc(klass, sizeof(JSON_ParserConfig), &JSON_ParserConfig_type); (config) = (JSON_ParserConfig *)RTYPEDDATA_GET_DATA(data_struct_obj); ((void)(config)); data_struct_obj; });
}
void Init_parser(void)
{
    rb_ext_ractor_safe(1);
    rb_require("json/common");
    mJSON = rb_define_module("JSON");
    VALUE mExt = rb_define_module_under(mJSON, "Ext");
    VALUE cParserConfig = rb_define_class_under(mExt, "ParserConfig", rb_cObject);
    eNestingError = rb_path2class("JSON::NestingError");
    rb_gc_register_mark_object(eNestingError);
    rb_define_alloc_func(cParserConfig, cJSON_parser_s_allocate);
    __builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(__builtin_types_compatible_p( __typeof__((cParserConfig_initialize)), __typeof__(rb_f_notimplement))), (__builtin_types_compatible_p( __typeof__((cParserConfig_initialize)), __typeof__(rb_f_notimplement))), 0), (rb_define_method_notimpl), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 15), (((1)) == 15), 0), (rb_define_method_15), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 14), (((1)) == 14), 0), (rb_define_method_14), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 13), (((1)) == 13), 0), (rb_define_method_13), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 12), (((1)) == 12), 0), (rb_define_method_12), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 11), (((1)) == 11), 0), (rb_define_method_11), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 10), (((1)) == 10), 0), (rb_define_method_10), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 9), (((1)) == 9), 0), (rb_define_method_09), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 8), (((1)) == 8), 0), (rb_define_method_08), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 7), (((1)) == 7), 0), (rb_define_method_07), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 6), (((1)) == 6), 0), (rb_define_method_06), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 5), (((1)) == 5), 0), (rb_define_method_05), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 4), (((1)) == 4), 0), (rb_define_method_04), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 3), (((1)) == 3), 0), (rb_define_method_03), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 2), (((1)) == 2), 0), (rb_define_method_02), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 1), (((1)) == 1), 0), (rb_define_method_01), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 0), (((1)) == 0), 0), (rb_define_method_00), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == -1), (((1)) == -1), 0), (rb_define_method_m1), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == -2), (((1)) == -2), 0), (rb_define_method_m2), (rb_define_method_m3))))))))))))))))))))))))))))))))))))))((cParserConfig), ("initialize"), (cParserConfig_initialize), (1));
    __builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(__builtin_types_compatible_p( __typeof__((cParserConfig_parse)), __typeof__(rb_f_notimplement))), (__builtin_types_compatible_p( __typeof__((cParserConfig_parse)), __typeof__(rb_f_notimplement))), 0), (rb_define_method_notimpl), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 15), (((1)) == 15), 0), (rb_define_method_15), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 14), (((1)) == 14), 0), (rb_define_method_14), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 13), (((1)) == 13), 0), (rb_define_method_13), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 12), (((1)) == 12), 0), (rb_define_method_12), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 11), (((1)) == 11), 0), (rb_define_method_11), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 10), (((1)) == 10), 0), (rb_define_method_10), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 9), (((1)) == 9), 0), (rb_define_method_09), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 8), (((1)) == 8), 0), (rb_define_method_08), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 7), (((1)) == 7), 0), (rb_define_method_07), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 6), (((1)) == 6), 0), (rb_define_method_06), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 5), (((1)) == 5), 0), (rb_define_method_05), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 4), (((1)) == 4), 0), (rb_define_method_04), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 3), (((1)) == 3), 0), (rb_define_method_03), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 2), (((1)) == 2), 0), (rb_define_method_02), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 1), (((1)) == 1), 0), (rb_define_method_01), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == 0), (((1)) == 0), 0), (rb_define_method_00), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == -1), (((1)) == -1), 0), (rb_define_method_m1), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((1)) == -2), (((1)) == -2), 0), (rb_define_method_m2), (rb_define_method_m3))))))))))))))))))))))))))))))))))))))((cParserConfig), ("parse"), (cParserConfig_parse), (1));
    VALUE cParser = rb_define_class_under(mExt, "Parser", rb_cObject);
    __builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(__builtin_types_compatible_p( __typeof__((cParser_m_parse)), __typeof__(rb_f_notimplement))), (__builtin_types_compatible_p( __typeof__((cParser_m_parse)), __typeof__(rb_f_notimplement))), 0), (rb_define_singleton_method_notimpl), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 15), (((2)) == 15), 0), (rb_define_singleton_method_15), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 14), (((2)) == 14), 0), (rb_define_singleton_method_14), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 13), (((2)) == 13), 0), (rb_define_singleton_method_13), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 12), (((2)) == 12), 0), (rb_define_singleton_method_12), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 11), (((2)) == 11), 0), (rb_define_singleton_method_11), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 10), (((2)) == 10), 0), (rb_define_singleton_method_10), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 9), (((2)) == 9), 0), (rb_define_singleton_method_09), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 8), (((2)) == 8), 0), (rb_define_singleton_method_08), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 7), (((2)) == 7), 0), (rb_define_singleton_method_07), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 6), (((2)) == 6), 0), (rb_define_singleton_method_06), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 5), (((2)) == 5), 0), (rb_define_singleton_method_05), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 4), (((2)) == 4), 0), (rb_define_singleton_method_04), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 3), (((2)) == 3), 0), (rb_define_singleton_method_03), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 2), (((2)) == 2), 0), (rb_define_singleton_method_02), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 1), (((2)) == 1), 0), (rb_define_singleton_method_01), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == 0), (((2)) == 0), 0), (rb_define_singleton_method_00), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == -1), (((2)) == -1), 0), (rb_define_singleton_method_m1), (__builtin_choose_expr( __builtin_choose_expr( __builtin_constant_p(((2)) == -2), (((2)) == -2), 0), (rb_define_singleton_method_m2), (rb_define_singleton_method_m3))))))))))))))))))))))))))))))))))))))((cParser), ("parse"), (cParser_m_parse), (2));
    CNaN = rb_const_get(mJSON, rb_intern("NaN"));
    rb_gc_register_mark_object(CNaN);
    CInfinity = rb_const_get(mJSON, rb_intern("Infinity"));
    rb_gc_register_mark_object(CInfinity);
    CMinusInfinity = rb_const_get(mJSON, rb_intern("MinusInfinity"));
    rb_gc_register_mark_object(CMinusInfinity);
    rb_global_variable(&Encoding_UTF_8);
    Encoding_UTF_8 = rb_const_get(rb_path2class("Encoding"), rb_intern("UTF_8"));
    sym_max_nesting = rb_id2sym(rb_intern("max_nesting"));
    sym_allow_nan = rb_id2sym(rb_intern("allow_nan"));
    sym_allow_trailing_comma = rb_id2sym(rb_intern("allow_trailing_comma"));
    sym_symbolize_names = rb_id2sym(rb_intern("symbolize_names"));
    sym_freeze = rb_id2sym(rb_intern("freeze"));
    sym_create_additions = rb_id2sym(rb_intern("create_additions"));
    sym_create_id = rb_id2sym(rb_intern("create_id"));
    sym_object_class = rb_id2sym(rb_intern("object_class"));
    sym_array_class = rb_id2sym(rb_intern("array_class"));
    sym_decimal_class = rb_id2sym(rb_intern("decimal_class"));
    sym_match_string = rb_id2sym(rb_intern("match_string"));
    i_create_id = rb_intern("create_id");
    i_json_creatable_p = rb_intern("json_creatable?");
    i_json_create = rb_intern("json_create");
    i_chr = rb_intern("chr");
    i_match = rb_intern("match");
    i_deep_const_get = rb_intern("deep_const_get");
    i_aset = rb_intern("[]=");
    i_aref = rb_intern("[]");
    i_leftshift = rb_intern("<<");
    i_new = rb_intern("new");
    i_try_convert = rb_intern("try_convert");
    i_uminus = rb_intern("-@");
    i_encode = rb_intern("encode");
    binary_encindex = rb_ascii8bit_encindex();
    utf8_encindex = rb_utf8_encindex();
    enc_utf8 = rb_utf8_encoding();
}
