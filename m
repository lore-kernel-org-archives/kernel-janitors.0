From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Sat, 01 Apr 2017 02:10:52 +0000
Subject: [GIT PULL 0/9] perf/core improvements and fixes
Message-Id: <20170401021101.10198-1-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexis Berlemont <alexis.berlemont@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Colin King <colin.king@canonical.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Hemant Kumar <hemant@linux.vnet.ibm.com>, Jan Stancek <jstancek@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Kan Liang <kan.liang@intel.com>, kernel-janitors@vger.kernel.org, Krister Johansen <kjlx@templeofstupid.com>, =?UTF-8?q?Luis=20Claudio=20Gon=C3=A7alves?= <lclaudio@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Namhyung Kim <namhyung@kernel.org>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>, Yao Jin <yao.jin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Ingo,

	Please consider pulling,

- Arnaldo

Test results at the end of this message, as usual.

The following changes since commit 3906a13a6b4e78fbc0def03a808f091f0dff1b44:

  Merge tag 'perf-core-for-mingo-4.12-20170327' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/core (2017-03-28 07:44:43 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-core-for-mingo-4.12-20170331

for you to fetch changes up to fd5cead23f54697310bd565aa2a23ae5128080a0:

  perf trace: Beautify statx syscall 'flag' and 'mask' arguments (2017-03-31 14:42:31 -0300)

----------------------------------------------------------------
perf/core improvements and fixes:

New features:

- Beautify the statx syscall arguments in 'perf trace' (Arnaldo Carvalho de Melo)

    e.g.:

  System wide strace like session:

  # trace -e statx
   16612.967 ( 0.028 ms): statx/4562 statx(dfd: CWD, filename: /tmp/statx, flags: SYMLINK_NOFOLLOW, mask: TYPE|MODE|NLINK|UID|GID|ATIME|MTIME|CTIME|INO|SIZE|BLOCKS|BTIME, buffer: 0x7ffef195d660) = 0
   36050.891 ( 0.007 ms): statx/4576 statx(dfd: CWD, filename: /etc/passwd, flags: SYMLINK_NOFOLLOW|STATX_DONT_SYNC, mask: BTIME, buffer: 0x7ffda9bf50f0) = 0
  ^C#

User visible:

- Handle unpaired raw_syscalls:sys_exit events in 'perf trace', i.e. we
  shouldn't try to calculate duration or print the timestamp for a missing
  matching raw_syscalls:sys_enter (Arnaldo Carvalho de Melo)

- Do not print "cycles: 0" in perf report LBR lines in platforms not
  supporting 'cycles', such as Intel's Broadwell (Jin Yao)

- Handle missing $HOME env var (Jiri Olsa)

- Map 8-bit registers (al, bl, etc), not supported in uprobes_events, to
  the next best thing (ax, bx, etc) supported (Ravi Bangoria)

Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

----------------------------------------------------------------
Arnaldo Carvalho de Melo (4):
      perf tools: Remove support for command aliases
      perf trace: Handle unpaired raw_syscalls:sys_exit event
      tools include uapi: Grab copies of stat.h and fcntl.h
      perf trace: Beautify statx syscall 'flag' and 'mask' arguments

Colin Ian King (1):
      perf utils: Fix spelling mistake: "Invalud" -> "Invalid"

Jin Yao (1):
      perf report: Drop cycles 0 for LBR print

Jiri Olsa (1):
      perf tools: Do not fail in case of empty HOME env variable

Ravi Bangoria (2):
      perf/sdt/x86: Add renaming logic for (missing) 8 bit registers
      perf/sdt/x86: Move OP parser to tools/perf/arch/x86/

 tools/include/linux/types.h                       |   1 +
 tools/include/uapi/linux/fcntl.h                  |  72 +++++++++
 tools/include/uapi/linux/stat.h                   | 176 ++++++++++++++++++++
 tools/perf/Build                                  |   1 +
 tools/perf/MANIFEST                               |   2 +
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl |   1 +
 tools/perf/arch/x86/util/perf_regs.c              | 187 ++++++++++++++++++----
 tools/perf/builtin-help.c                         |  13 --
 tools/perf/builtin-trace.c                        |  57 ++++---
 tools/perf/check-headers.sh                       |   2 +
 tools/perf/perf.c                                 |  97 +----------
 tools/perf/trace/beauty/Build                     |   1 +
 tools/perf/trace/beauty/beauty.h                  |  24 +++
 tools/perf/trace/beauty/statx.c                   |  72 +++++++++
 tools/perf/util/Build                             |   1 -
 tools/perf/util/alias.c                           |  78 ---------
 tools/perf/util/cache.h                           |   1 -
 tools/perf/util/callchain.c                       | 111 ++++++++-----
 tools/perf/util/config.c                          |  54 ++++---
 tools/perf/util/help-unknown-cmd.c                |   8 +-
 tools/perf/util/hist.c                            |   2 +-
 tools/perf/util/perf_regs.c                       |   6 +-
 tools/perf/util/perf_regs.h                       |  11 +-
 tools/perf/util/probe-file.c                      | 132 +++++----------
 24 files changed, 707 insertions(+), 403 deletions(-)
 create mode 100644 tools/include/uapi/linux/fcntl.h
 create mode 100644 tools/include/uapi/linux/stat.h
 create mode 100644 tools/perf/trace/beauty/Build
 create mode 100644 tools/perf/trace/beauty/beauty.h
 create mode 100644 tools/perf/trace/beauty/statx.c
 delete mode 100644 tools/perf/util/alias.c

Test results:

The first ones are container (docker) based builds of tools/perf with and
without libelf support, objtool where it is supported and samples/bpf/, ditto.
Where clang is available, it is also used to build perf with/without libelf.

For this specific pull request the samples/bpf/ was disabled, as 'make headers_install'
is failing with the following error, in this case in fedora:rawhide:

    INSTALL usr/include/uapi/ (0 file)
  /git/linux/scripts/Makefile.headersinst:62: *** Missing generated UAPI file ./arch/x86/include/generated/uapi/asm/unistd_32.h.  Stop.
  make[1]: *** [/git/linux/Makefile:1151: headers_install] Error 2
  make[1]: Leaving directory '/tmp/build/linux'
  make: *** [Makefile:152: sub-make] Error 2
  make: Leaving directory '/git/linux'

I'll investigate later, perf and objtool builds just fine, with clang and gcc.

Several are cross builds, the ones with -x-ARCH, and the android one, and those
may not have all the features built, due to lack of multi-arch devel packages,
available and being used so far on just a few, like
debian:experimental-x-{arm64,mipsel}.

The 'perf test' one will perform a variety of tests exercising
tools/perf/util/, tools/lib/{bpf,traceevent,etc}, as well as run perf commands
with a variety of command line event specifications to then intercept the
sys_perf_event syscall to check that the perf_event_attr fields are set up as
expected, among a variety of other unit tests.

Then there is the 'make -C tools/perf build-test' ones, that build tools/perf/
with a variety of feature sets, exercising the build with an incomplete set of
features as well as with a complete one. It is planned to have it run on each
of the containers mentioned above, using some container orchestration
infrastructure. Get in contact if interested in helping having this in place.

  # dm
   1 alpine:3.4: Ok
   2 alpine:3.5: Ok
   3 alpine:edge: Ok
   4 android-ndk:r12b-arm: Ok
   5 archlinux:latest: Ok
   6 centos:5: Ok
   7 centos:6: Ok
   8 centos:7: Ok
   9 debian:7: Ok
  10 debian:8: Ok
  11 debian:9: Ok
  12 debian:experimental: Ok
  13 debian:experimental-x-arm64: Ok
  14 debian:experimental-x-mips: Ok
  15 debian:experimental-x-mips64: Ok
  16 debian:experimental-x-mipsel: Ok
  17 fedora:20: Ok
  18 fedora:21: Ok
  19 fedora:22: Ok
  20 fedora:23: Ok
  21 fedora:24: Ok
  22 fedora:24-x-ARC-uClibc: Ok
  23 fedora:25: Ok
  24 fedora:rawhide: Ok
  25 mageia:5: Ok
  26 opensuse:13.2: Ok
  27 opensuse:42.1: Ok
  28 opensuse:tumbleweed: Ok
  29 ubuntu:12.04.5: Ok
  30 ubuntu:14.04.4: Ok
  31 ubuntu:14.04.4-x-linaro-arm64: Ok
  32 ubuntu:15.10: Ok
  33 ubuntu:16.04: Ok
  34 ubuntu:16.04-x-arm: Ok
  35 ubuntu:16.04-x-arm64: Ok
  36 ubuntu:16.04-x-powerpc: Ok
  37 ubuntu:16.04-x-powerpc64: Ok
  38 ubuntu:16.04-x-s390: Ok
  39 ubuntu:16.10: Ok
  40 ubuntu:17.04: Ok
  #
 
  # uname -a
  Linux jouet 4.11.0-rc2+ #5 SMP Mon Mar 20 18:12:29 -03 2017 x86_64 x86_64 x86_64 GNU/Linux
  # 'perf test tsc' already fixed by peterz in tip
  # perf test
   1: vmlinux symtab matches kallsyms            : Ok
   2: Detect openat syscall event                : Ok
   3: Detect openat syscall event on all cpus    : Ok
   4: Read samples using the mmap interface      : Ok
   5: Parse event definition strings             : Ok
   6: Simple expression parser                   : Ok
   7: PERF_RECORD_* events & perf_sample fields  : Ok
   8: Parse perf pmu format                      : Ok
   9: DSO data read                              : Ok
  10: DSO data cache                             : Ok
  11: DSO data reopen                            : Ok
  12: Roundtrip evsel->name                      : Ok
  13: Parse sched tracepoints fields             : Ok
  14: syscalls:sys_enter_openat event fields     : Ok
  15: Setup struct perf_event_attr               : Ok
  16: Match and link multiple hists              : Ok
  17: 'import perf' in python                    : Ok
  18: Breakpoint overflow signal handler         : Ok
  19: Breakpoint overflow sampling               : Ok
  20: Number of exit events of a simple workload : Ok
  21: Software clock events period values        : Ok
  22: Object code reading                        : Ok
  23: Sample parsing                             : Ok
  24: Use a dummy software event to keep tracking: Ok
  25: Parse with no sample_id_all bit set        : Ok
  26: Filter hist entries                        : Ok
  27: Lookup mmap thread                         : Ok
  28: Share thread mg                            : Ok
  29: Sort output of hist entries                : Ok
  30: Cumulate child hist entries                : Ok
  31: Track with sched_switch                    : Ok
  32: Filter fds with revents mask in a fdarray  : Ok
  33: Add fd to a fdarray, making it autogrow    : Ok
  34: kmod_path__parse                           : Ok
  35: Thread map                                 : Ok
  36: LLVM search and compile                    :
  36.1: Basic BPF llvm compile                    : Ok
  36.2: kbuild searching                          : Ok
  36.3: Compile source for BPF prologue generation: Ok
  36.4: Compile source for BPF relocation         : Ok
  37: Session topology                           : Ok
  38: BPF filter                                 :
  38.1: Basic BPF filtering                      : Ok
  38.2: BPF pinning                              : Ok
  38.3: BPF prologue generation                  : Ok
  38.4: BPF relocation checker                   : Ok
  39: Synthesize thread map                      : Ok
  40: Remove thread map                          : Ok
  41: Synthesize cpu map                         : Ok
  42: Synthesize stat config                     : Ok
  43: Synthesize stat                            : Ok
  44: Synthesize stat round                      : Ok
  45: Synthesize attr update                     : Ok
  46: Event times                                : Ok
  47: Read backward ring buffer                  : Ok
  48: Print cpu map                              : Ok
  49: Probe SDT events                           : Ok
  50: is_printable_array                         : Ok
  51: Print bitmap                               : Ok
  52: perf hooks                                 : Ok
  53: builtin clang support                      : Skip (not compiled in)
  54: unit_number__scnprintf                     : Ok
  55: x86 rdpmc                                  : Ok
  56: Convert perf time to TSC                   : FAILED!
  57: DWARF unwind                               : Ok
  58: x86 instruction decoder - new instructions : Ok
  59: Intel cqm nmi context read                 : Skip

  $ make -C tools/perf build-test
  make_no_libdw_dwarf_unwind_O: make NO_LIBDW_DWARF_UNWIND=1
                make_minimal_O: make NO_LIBPERL=1 NO_LIBPYTHON=1 NO_NEWT=1 NO_GTK2=1 NO_DEMANGLE=1 NO_LIBELF=1 NO_LIBUNWIND=1 NO_BACKTRACE=1 NO_LIBNUMA=1 NO_LIBAUDIT=1 NO_LIBBIONIC=1 NO_LIBDW_DWARF_UNWIND=1 NO_AUXTRACE=1 NO_LIBBPF=1 NO_LIBCRYPTO=1 NO_SDT=1 NO_JVMTI=1
                make_no_gtk2_O: make NO_GTK2=1
                make_no_newt_O: make NO_NEWT=1
                  make_debug_O: make DEBUG=1
           make_no_backtrace_O: make NO_BACKTRACE=1
         make_with_clangllvm_O: make LIBCLANGLLVM=1
                   make_tags_O: make tags
            make_no_demangle_O: make NO_DEMANGLE=1
            make_install_bin_O: make install-bin
           make_no_libpython_O: make NO_LIBPYTHON=1
               make_no_slang_O: make NO_SLANG=1
            make_no_auxtrace_O: make NO_AUXTRACE=1
       make_util_pmu_bison_o_O: make util/pmu-bison.o
                  make_no_ui_O: make NO_NEWT=1 NO_SLANG=1 NO_GTK2=1
             make_no_scripts_O: make NO_LIBPYTHON=1 NO_LIBPERL=1
              make_no_libbpf_O: make NO_LIBBPF=1
        make_with_babeltrace_O: make LIBBABELTRACE=1
             make_util_map_o_O: make util/map.o
                 make_static_O: make LDFLAGS=-static
                   make_help_O: make help
                   make_pure_O: make
                 make_perf_o_O: make perf.o
             make_no_libnuma_O: make NO_LIBNUMA=1
             make_no_libperl_O: make NO_LIBPERL=1
           make_no_libunwind_O: make NO_LIBUNWIND=1
           make_no_libbionic_O: make NO_LIBBIONIC=1
                    make_doc_O: make doc
              make_no_libelf_O: make NO_LIBELF=1
              make_clean_all_O: make clean all
         make_install_prefix_O: make install prefix=/tmp/krava
            make_no_libaudit_O: make NO_LIBAUDIT=1
                make_install_O: make install
   make_install_prefix_slash_O: make install prefix=/tmp/krava/
  OK
  make: Leaving directory '/home/acme/git/linux/tools/perf'
  $
