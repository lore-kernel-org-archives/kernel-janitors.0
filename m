From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Apr 2017 11:05:57 +0000
Subject: [PATCH] powerpc/xive: fix spelling mistake: "initialize"
Message-Id: <20170418110557.5934-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_info message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/powerpc/sysdev/xive/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index d9cd7f705f21..480364c1293c 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1287,7 +1287,7 @@ bool xive_core_init(const struct xive_ops *ops, void __iomem *area, u32 offset,
 	/* Get ready for interrupts */
 	xive_setup_cpu();
 
-	pr_info("Interrupt handling intialized with %s backend\n",
+	pr_info("Interrupt handling initialized with %s backend\n",
 		xive_ops->name);
 	pr_info("Using priority %d for all interrupts\n", max_prio);
 
-- 
2.11.0

