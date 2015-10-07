From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Wed, 07 Oct 2015 22:45:12 +0000
Subject: [GIT PULL 0/5] perf/core improvements and fixes
Message-Id: <1444257917-24527-1-git-send-email-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Borislav Petkov <bp@suse.de>, David Ahern <dsahern@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, Guy Streeter <streeter@redhat.com>, Jiri Olsa <jolsa@redhat.com>, kernel-janitors@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Stephane Eranian <eranian@google.com>, Wang Nan <wangnan0@huawei.com>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Ingo,

	Please consider pulling,

- Arnaldo

The following changes since commit 712df65ccb63da08a484bf57c40b250dfd4103a7:

  perf/x86/intel/uncore: Fix multi-segment problem of perf_event_intel_uncore (2015-10-06 17:31:51 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-core-for-mingo

for you to fetch changes up to ae938802443732e77d01f8d5b52b900b9327ff30:

  perf python: Support the PERF_RECORD_SWITCH event (2015-10-07 19:41:50 -0300)

----------------------------------------------------------------
perf/core improvements and fixes:

User visible:

- Adding a field via 'perf report -F' that already is enabled makes
  the tool get stuck in a loop, fix it (Jiri Olsa)

Infrastructure:

- Support PERF_RECORD_SWITCH in the python binding (Arnaldo Carvalho de Melo)

- Fix handling read() result using a signed variable, found with Coccinelle
  (Andrzej Hajda)

Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

----------------------------------------------------------------
Andrzej Hajda (1):
      perf tools: Fix handling read result using a signed variable

Arnaldo Carvalho de Melo (1):
      perf python: Support the PERF_RECORD_SWITCH event

Jiri Olsa (3):
      perf tools: Get rid of superfluos call to reset_dimensions
      perf tools: Introduce hpp_dimension__add_output function
      perf tools: Use hpp_dimension__add_output to register hpp columns

 tools/perf/python/twatch.py | 23 +++++++++++++++---
 tools/perf/ui/hist.c        | 16 ++++++------
 tools/perf/util/event.c     |  3 ++-
 tools/perf/util/python.c    | 59 ++++++++++++++++++++++++++++++++++++++++++---
 tools/perf/util/sort.c      |  8 ++++--
 tools/perf/util/sort.h      |  2 ++
 6 files changed, 93 insertions(+), 18 deletions(-)
