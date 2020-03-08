From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 08 Mar 2020 17:49:31 +0000
Subject: [RFC PATCH] MAINTAINERS: add headers and doc to SCHEDULER
Message-Id: <20200308174931.9118-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Various files in include/linux/sched/ are identified as part of THE REST
according to MAINTAINERS, but they are really belong to SCHEDULER.

Add include/linux/sched/, include/uapi/linux/sched/ and
Documentation/scheduler/ to the SCHEDULER entry, and order the entry with
parse-maintainers.pl.

This was identified with a small script that finds all files belonging to
THE REST according to the current MAINTAINERS file, and I investigated
upon its output.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4869bd91b6ff..3a0f8115c92c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14754,13 +14754,16 @@ R:	Steven Rostedt <rostedt@goodmis.org> (SCHED_FIFO/SCHED_RR)
 R:	Ben Segall <bsegall@google.com> (CONFIG_CFS_BANDWIDTH)
 R:	Mel Gorman <mgorman@suse.de> (CONFIG_NUMA_BALANCING)
 L:	linux-kernel@vger.kernel.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
 S:	Maintained
-F:	kernel/sched/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
+F:	Documentation/scheduler/
+F:	include/linux/preempt.h
 F:	include/linux/sched.h
-F:	include/uapi/linux/sched.h
+F:	include/linux/sched/
 F:	include/linux/wait.h
-F:	include/linux/preempt.h
+F:	include/uapi/linux/sched.h
+F:	include/uapi/linux/sched/
+F:	kernel/sched/
 
 SCR24X CHIP CARD INTERFACE DRIVER
 M:	Lubomir Rintel <lkundrak@v3.sk>
-- 
2.17.1
