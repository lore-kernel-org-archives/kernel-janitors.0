From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 13 Apr 2020 11:26:03 +0000
Subject: [PATCH RFC v2] MAINTAINERS: add headers and doc to SCHEDULER
Message-Id: <20200413112603.5257-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Various files in include/linux/sched/ and include/uapi/linux/sched/ are
identified as part of THE REST according to MAINTAINERS, but they really
belong to SCHEDULER.

Add those headers and Documentation to the SCHEDULER entry.

This was identified with a small script that finds all files belonging to
THE REST according to the current MAINTAINERS file, and I investigated
upon its output.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
RFC v1: https://lore.kernel.org/lkml/20200308174931.9118-1-lukas.bulwahn@gmail.com/
  - no feedback.

RFC v2:
  - v1 does not apply after reordering MAINTAINERS, i.e., commit 4400b7d68f6e
    ("MAINTAINERS: sort entries by entry name") and commit 3b50142d8528
    ("MAINTAINERS: sort field names for all entries").
  - does not need to reorder entries anymore.
  - applies cleanly on v5.7-rc1


 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..8546910db0ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14905,10 +14905,13 @@ R:	Mel Gorman <mgorman@suse.de> (CONFIG_NUMA_BALANCING)
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
