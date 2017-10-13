From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Oct 2017 07:01:22 +0000
Subject: [PATCH] sched/deadline: Don't use dubious signed bitfields
Message-Id: <20171013070121.dzcncojuj2f4utij@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, luca abeni <luca.abeni@santannapisa.it>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It doesn't cause a run-time bug, but these bitfields should be unsigned.
When it's signed ->dl_throttled is set to either 0 or -1, instead of
0 and 1 as expected.  The sched.h file is included into tons of places
so Sparse generates a flood of warnings like this:

./include/linux/sched.h:477:54: error: dubious one-bit signed bitfield

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 0f897dfc195e..105eaff8a5e7 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -474,10 +474,10 @@ struct sched_dl_entity {
 	 * conditions between the inactive timer handler and the wakeup
 	 * code.
 	 */
-	int				dl_throttled      : 1;
-	int				dl_boosted        : 1;
-	int				dl_yielded        : 1;
-	int				dl_non_contending : 1;
+	unsigned int			dl_throttled      : 1;
+	unsigned int			dl_boosted        : 1;
+	unsigned int			dl_yielded        : 1;
+	unsigned int			dl_non_contending : 1;
 
 	/*
 	 * Bandwidth enforcement timer. Each -deadline task has its
