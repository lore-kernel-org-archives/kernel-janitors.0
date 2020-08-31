From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 31 Aug 2020 06:07:30 +0000
Subject: [PATCH] MAINTAINERS: add headers and doc to SCHEDULER
Message-Id: <20200831060730.17461-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Various files in include/linux/sched/ and include/uapi/linux/sched/ are
identified as part of THE REST according to MAINTAINERS, but they really
belong to SCHEDULER.

Add those headers and Documentation to the SCHEDULER section.

This was identified with a small script that finds all files belonging to
THE REST according to the current MAINTAINERS file, and I investigated
upon its output.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
RFC v1: https://lore.kernel.org/lkml/20200308174931.9118-1-lukas.bulwahn@gmail.com/
  - no feedback.

RFC v2: https://lore.kernel.org/lkml/20200413112603.5257-1-lukas.bulwahn@gmail.com/
  - RFC v1 does not apply after reordering MAINTAINERS, i.e., commit 4400b7d68f6e
    ("MAINTAINERS: sort entries by entry name") and commit 3b50142d8528
    ("MAINTAINERS: sort field names for all entries").
  - does not need to reorder entries anymore.
  - applies cleanly on v5.7-rc1
  - no feedback.

v1:
  - rebased to v5.9-rc3
  - minor wording: s/SCHEDULER entry/SCHEDULER section/
  - increase recipients to all scheduler maintainers to get some feedback

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4647c84c987..36c8e7671b70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15359,10 +15359,13 @@ R:	Mel Gorman <mgorman@suse.de> (CONFIG_NUMA_BALANCING)
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
+F:	Documentation/scheduler/
 F:	include/linux/preempt.h
 F:	include/linux/sched.h
+F:	include/linux/sched/
 F:	include/linux/wait.h
 F:	include/uapi/linux/sched.h
+F:	include/uapi/linux/sched/
 F:	kernel/sched/
 
 SCR24X CHIP CARD INTERFACE DRIVER
-- 
2.17.1
