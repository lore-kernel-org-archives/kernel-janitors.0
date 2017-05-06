From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 19:40:36 +0000
Subject: [PATCH 0/3] kernel-sched: Fine-tuning for eight function implementations
Message-Id: <ece07743-9bbb-e396-b562-ba161c3eb9b8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 21:35:45 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use seq_putc() in three functions
  Adjust four checks for null pointers
  Combine two seq_printf() calls into one in show_schedstat()

 kernel/sched/cpuacct.c |  6 +++---
 kernel/sched/debug.c   | 11 +++++------
 kernel/sched/stats.c   | 14 +++++---------
 3 files changed, 13 insertions(+), 18 deletions(-)

-- 
2.12.2

