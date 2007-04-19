From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Thu, 19 Apr 2007 09:47:16 +0000
Subject: [KJ][PATCH]SPIN_LOCK_UNLOCKED cleanup in arch/mips
Message-Id: <20070419093516.GA9486@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070419041440.GB14283@arun.site>
In-Reply-To: <20070419041440.GB14283@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@lists.osdl.org>, MIPS <linux-mips@linux-mips.org>
Cc: Andrw Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, thomas.koeller@baslerweb.com, ralf@linux-mips.org

SPIN_LOCK_UNLOCKED cleanup,use DEFINE_SPINLOCK instead 

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>
---
 excite_setup.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/basler/excite/excite_setup.c b/arch/mips/basler/excite/excite_setup.c
index 42f0eda..2f0e4c0 100644
--- a/arch/mips/basler/excite/excite_setup.c
+++ b/arch/mips/basler/excite/excite_setup.c
@@ -63,7 +63,7 @@ volatile void __iomem * const ocd_base = (void *) (EXCITE_ADDR_OCD);
 volatile void __iomem * const titan_base = (void *) (EXCITE_ADDR_TITAN);
 
 /* Protect access to shared GPI registers */
-spinlock_t titan_lock = SPIN_LOCK_UNLOCKED;
+DEFINE_SPINLOCK(titan_lock);
 int titan_irqflags;
 
 
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
