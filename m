From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 09 Oct 2017 12:44:24 +0000
Subject: [PATCH 3.16 044/192] x86/nmi: Fix timeout test in test_nmi_ipi()
Message-Id: <lsq.1507553064.759890887@decadent.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <lsq.1507553063.449494954@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Dan Carpenter <dan.carpenter@oracle.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, kernel-janitors@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Don Zickus <dzickus@redhat.com>

3.16.49-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Dan Carpenter <dan.carpenter@oracle.com>

commit c133c7615751008f6c32ccae7cdfc5ff6e989c35 upstream.

We're supposed to exit the loop with "timeout" set to zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Don Zickus <dzickus@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org
Fixes: 99e8b9ca90d6 ("x86, NMI: Add NMI IPI selftest")
Link: http://lkml.kernel.org/r/20170619105304.GA23995@elgon.mountain
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/x86/kernel/nmi_selftest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/x86/kernel/nmi_selftest.c
+++ b/arch/x86/kernel/nmi_selftest.c
@@ -78,7 +78,7 @@ static void __init test_nmi_ipi(struct c
 
 	/* Don't wait longer than a second */
 	timeout = USEC_PER_SEC;
-	while (!cpumask_empty(mask) && timeout--)
+	while (!cpumask_empty(mask) && --timeout)
 	        udelay(1);
 
 	/* What happens if we timeout, do we still unregister?? */

