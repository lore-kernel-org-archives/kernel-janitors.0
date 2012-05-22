From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 May 2012 14:52:34 +0000
Subject: [patch] sched/numa: checking for NULL instead of IS_ERR()
Message-Id: <20120522145233.GA17419@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If mpol_new() is called with MPOL_BIND then it can't return a NULL
pointer.  We should be checking IS_ERR() here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/sched/numa.c b/kernel/sched/numa.c
index 1149993..36d27ac 100644
--- a/kernel/sched/numa.c
+++ b/kernel/sched/numa.c
@@ -1481,9 +1481,9 @@ SYSCALL_DEFINE4(numa_mbind, unsigned long, addr, unsigned long, len,
 
 	mask = nodemask_of_node(ng->numa_entity.node);
 	mpol = mpol_new(MPOL_BIND, 0, &mask);
-	if (!mpol) {
+	if (IS_ERR(mpol)) {
 		ng_put(ng);
-		return -ENOMEM;
+		return PTR_ERR(mpol);
 	}
 	mpol->flags |= MPOL_MF_LAZY;
 	mpol->numa_group = ng;
