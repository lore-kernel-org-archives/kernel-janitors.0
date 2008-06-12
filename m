From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 21:21:53 +0000
Subject: [PATCH] softirq: remove initialization of static per-cpu variable
Message-Id: <20080612212153.GE3283@damson.getinternet.no>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 22:10:36 +0200
Subject: [PATCH] softirq: remove initialization of static per-cpu variable

Cc: Ingo Molnar <mingo@elte.hu>
Signed-off-by: Vegard Nossum <vegard.nossum@gmail.com>
---
 kernel/softirq.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/softirq.c b/kernel/softirq.c
index 36e0617..6d28525 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -360,10 +360,8 @@ struct tasklet_head
 	struct tasklet_struct **tail;
 };
 
-/* Some compilers disobey section attribute on statics when not
-   initialized -- RR */
-static DEFINE_PER_CPU(struct tasklet_head, tasklet_vec) = { NULL };
-static DEFINE_PER_CPU(struct tasklet_head, tasklet_hi_vec) = { NULL };
+static DEFINE_PER_CPU(struct tasklet_head, tasklet_vec);
+static DEFINE_PER_CPU(struct tasklet_head, tasklet_hi_vec);
 
 void __tasklet_schedule(struct tasklet_struct *t)
 {
-- 
1.5.4.1

