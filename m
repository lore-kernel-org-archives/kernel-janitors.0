From: Sasha Levin <Alexander.Levin@microsoft.com>
Date: Mon, 09 Apr 2018 00:24:14 +0000
Subject: [PATCH AUTOSEL for 4.9 103/293] x86/nmi: Fix timeout test in test_nmi_ipi()
Message-Id: <20180409002239.163177-103-alexander.levin@microsoft.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180409002239.163177-1-alexander.levin@microsoft.com>
In-Reply-To: <20180409002239.163177-1-alexander.levin@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, Sasha Levin <Alexander.Levin@microsoft.com>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit c133c7615751008f6c32ccae7cdfc5ff6e989c35 ]

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
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 arch/x86/kernel/nmi_selftest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/nmi_selftest.c b/arch/x86/kernel/nmi_selftest.c
index 6d9582ec0324..d27f8d84c4ff 100644
--- a/arch/x86/kernel/nmi_selftest.c
+++ b/arch/x86/kernel/nmi_selftest.c
@@ -78,7 +78,7 @@ static void __init test_nmi_ipi(struct cpumask *mask)
 
 	/* Don't wait longer than a second */
 	timeout = USEC_PER_SEC;
-	while (!cpumask_empty(mask) && timeout--)
+	while (!cpumask_empty(mask) && --timeout)
 	        udelay(1);
 
 	/* What happens if we timeout, do we still unregister?? */
-- 
2.15.1
