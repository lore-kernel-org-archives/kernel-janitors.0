From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 15:20:42 +0000
Subject: [PATCH 0/4] perf: Fine-tuning for three function implementations
Message-Id: <c8eebdee-ad45-c2a8-9a4d-e1032ec9a17f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, He Kuang <hekuang@huawei.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Milian Wolff <milian.wolff@kdab.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 16:08:21 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an unnecessary check in try_to_find_absolute_address()
  Delete an unnecessary assignment in try_to_find_absolute_address()
  Move an error code assignment in __perf_session__set_tracepoints_handlers()
  Move an error code assignment in strlist__parse_list_entry()

 tools/perf/util/probe-event.c | 11 ++++-------
 tools/perf/util/session.c     |  6 +++---
 tools/perf/util/strlist.c     |  5 +++--
 3 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.11.0

