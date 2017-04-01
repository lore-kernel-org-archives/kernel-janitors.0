From: Ingo Molnar <mingo@kernel.org>
Date: Sat, 01 Apr 2017 10:44:41 +0000
Subject: Re: [GIT PULL 0/9] perf/core improvements and fixes
Message-Id: <20170401104441.GA12370@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170401021101.10198-1-acme@kernel.org>
In-Reply-To: <20170401021101.10198-1-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexis Berlemont <alexis.berlemont@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Colin King <colin.king@canonical.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Hemant Kumar <hemant@linux.vnet.ibm.com>, Jan Stancek <jstancek@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Kan Liang <kan.liang@intel.com>, kernel-janitors@vger.kernel.org, Krister Johansen <kjlx@templeofstupid.com>, Luis Claudio =?iso-8859-1?Q?Gon=E7alves?= <lclaudio@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Namhyung Kim <namhyung@kernel.org>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>, Yao Jin <yao.jin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>


* Arnaldo Carvalho de Melo <acme@kernel.org> wrote:

> Hi Ingo,
> 
> 	Please consider pulling,
> 
> - Arnaldo
> 
> Test results at the end of this message, as usual.
> 
> The following changes since commit 3906a13a6b4e78fbc0def03a808f091f0dff1b44:
> 
>   Merge tag 'perf-core-for-mingo-4.12-20170327' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/core (2017-03-28 07:44:43 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-core-for-mingo-4.12-20170331
> 
> for you to fetch changes up to fd5cead23f54697310bd565aa2a23ae5128080a0:
> 
>   perf trace: Beautify statx syscall 'flag' and 'mask' arguments (2017-03-31 14:42:31 -0300)
> 
> ----------------------------------------------------------------
> perf/core improvements and fixes:
> 
> New features:
> 
> - Beautify the statx syscall arguments in 'perf trace' (Arnaldo Carvalho de Melo)
> 
>     e.g.:
> 
>   System wide strace like session:
> 
>   # trace -e statx
>    16612.967 ( 0.028 ms): statx/4562 statx(dfd: CWD, filename: /tmp/statx, flags: SYMLINK_NOFOLLOW, mask: TYPE|MODE|NLINK|UID|GID|ATIME|MTIME|CTIME|INO|SIZE|BLOCKS|BTIME, buffer: 0x7ffef195d660) = 0
>    36050.891 ( 0.007 ms): statx/4576 statx(dfd: CWD, filename: /etc/passwd, flags: SYMLINK_NOFOLLOW|STATX_DONT_SYNC, mask: BTIME, buffer: 0x7ffda9bf50f0) = 0
>   ^C#
> 
> User visible:
> 
> - Handle unpaired raw_syscalls:sys_exit events in 'perf trace', i.e. we
>   shouldn't try to calculate duration or print the timestamp for a missing
>   matching raw_syscalls:sys_enter (Arnaldo Carvalho de Melo)
> 
> - Do not print "cycles: 0" in perf report LBR lines in platforms not
>   supporting 'cycles', such as Intel's Broadwell (Jin Yao)
> 
> - Handle missing $HOME env var (Jiri Olsa)
> 
> - Map 8-bit registers (al, bl, etc), not supported in uprobes_events, to
>   the next best thing (ax, bx, etc) supported (Ravi Bangoria)
> 
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> ----------------------------------------------------------------
> Arnaldo Carvalho de Melo (4):
>       perf tools: Remove support for command aliases
>       perf trace: Handle unpaired raw_syscalls:sys_exit event
>       tools include uapi: Grab copies of stat.h and fcntl.h
>       perf trace: Beautify statx syscall 'flag' and 'mask' arguments
> 
> Colin Ian King (1):
>       perf utils: Fix spelling mistake: "Invalud" -> "Invalid"
> 
> Jin Yao (1):
>       perf report: Drop cycles 0 for LBR print
> 
> Jiri Olsa (1):
>       perf tools: Do not fail in case of empty HOME env variable
> 
> Ravi Bangoria (2):
>       perf/sdt/x86: Add renaming logic for (missing) 8 bit registers
>       perf/sdt/x86: Move OP parser to tools/perf/arch/x86/
> 
>  tools/include/linux/types.h                       |   1 +
>  tools/include/uapi/linux/fcntl.h                  |  72 +++++++++
>  tools/include/uapi/linux/stat.h                   | 176 ++++++++++++++++++++
>  tools/perf/Build                                  |   1 +
>  tools/perf/MANIFEST                               |   2 +
>  tools/perf/arch/x86/entry/syscalls/syscall_64.tbl |   1 +
>  tools/perf/arch/x86/util/perf_regs.c              | 187 ++++++++++++++++++----
>  tools/perf/builtin-help.c                         |  13 --
>  tools/perf/builtin-trace.c                        |  57 ++++---
>  tools/perf/check-headers.sh                       |   2 +
>  tools/perf/perf.c                                 |  97 +----------
>  tools/perf/trace/beauty/Build                     |   1 +
>  tools/perf/trace/beauty/beauty.h                  |  24 +++
>  tools/perf/trace/beauty/statx.c                   |  72 +++++++++
>  tools/perf/util/Build                             |   1 -
>  tools/perf/util/alias.c                           |  78 ---------
>  tools/perf/util/cache.h                           |   1 -
>  tools/perf/util/callchain.c                       | 111 ++++++++-----
>  tools/perf/util/config.c                          |  54 ++++---
>  tools/perf/util/help-unknown-cmd.c                |   8 +-
>  tools/perf/util/hist.c                            |   2 +-
>  tools/perf/util/perf_regs.c                       |   6 +-
>  tools/perf/util/perf_regs.h                       |  11 +-
>  tools/perf/util/probe-file.c                      | 132 +++++----------
>  24 files changed, 707 insertions(+), 403 deletions(-)
>  create mode 100644 tools/include/uapi/linux/fcntl.h
>  create mode 100644 tools/include/uapi/linux/stat.h
>  create mode 100644 tools/perf/trace/beauty/Build
>  create mode 100644 tools/perf/trace/beauty/beauty.h
>  create mode 100644 tools/perf/trace/beauty/statx.c
>  delete mode 100644 tools/perf/util/alias.c

Pulled, thanks a lot Arnaldo!

	Ingo
