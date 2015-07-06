From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Mon, 06 Jul 2015 15:41:20 +0000
Subject: [GIT PULL 00/11] perf/core improvements and fixes
Message-Id: <1436197291-21625-1-git-send-email-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Borislav Petkov <bp@suse.de>, David Ahern <dsahern@gmail.com>, Don Zickus <dzickus@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, Jiri Olsa <jolsa@redhat.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Markus Elfring <elfring@users.sourceforge.net>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Stephane Eranian <eranian@google.com>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Ingo,

	Please consider pulling,

- Arnaldo

The following changes since commit d2d61ed55f8375a10ff606e83e2196880a775fb4:

  Merge branch 'perf/rbtree_copy' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/urgent (2015-07-06 09:24:41 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-core-for-mingo

for you to fetch changes up to ab85785aa13c36440a91a8e9f7616357de411a1f:

  tools lib api debugfs: Check for tracefs when reporting errors (2015-07-06 12:22:14 -0300)

----------------------------------------------------------------
perf/core improvements and fixes:

User visible:

- Take tracefs into account when reporting errors about accessing
  tracepoint information in tools like 'perf trace' (Arnaldo Carvalho de Melo)

- Let user have timestamps with per-thread recording in 'perf record' (Adrian Hunter)

Infrastructure:

- Introduce series of functions to build event filters so that we
  can set them in just one ioctl call, useful to set up common_pid,
  raw_syscalls:sys_{enter,exit}'s "id" filters to use with
  'perf trace' (Arnaldo Carvalho de Melo)

- Delete an unnecessary check before calling strfilter__delete() (Markus Elfring)

Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

----------------------------------------------------------------
Adrian Hunter (1):
      perf record: Let user have timestamps with per-thread recording

Arnaldo Carvalho de Melo (9):
      perf tools: Asprintf like functions to format integer filter expression
      perf trace: Remember what are the syscalls tracepoint evsels
      perf trace: Store the syscall ids for the event qualifiers in a table
      perf evsel: Rename set_filter to apply_filter
      perf evsel: Introduce set_filter method
      perf evlist: Make perf_evlist__set_filter use perf_evsel__set_filter
      perf evsel: Introduce append_filter() method
      perf trace: Use event filters for the event qualifier list
      tools lib api debugfs: Check for tracefs when reporting errors

Markus Elfring (1):
      perf probe: Delete an unnecessary check before the function call "strfilter__delete"

 tools/lib/api/fs/debugfs.c     |  15 +++-
 tools/perf/builtin-probe.c     |   3 +-
 tools/perf/builtin-record.c    |   4 +-
 tools/perf/builtin-trace.c     | 178 ++++++++++++++++++++++++++---------------
 tools/perf/perf.h              |   1 +
 tools/perf/util/evlist.c       |   6 +-
 tools/perf/util/evsel.c        |  37 ++++++++-
 tools/perf/util/evsel.h        |   7 +-
 tools/perf/util/parse-events.c |   3 +-
 tools/perf/util/string.c       |  39 +++++++++
 tools/perf/util/util.h         |  12 +++
 11 files changed, 224 insertions(+), 81 deletions(-)
