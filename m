From: Pradeep Singh Rautela <rautelap@gmail.com>
Date: Thu, 29 May 2008 17:57:02 +0000
Subject: Change deprecated SPIN_LOCK_UNLOCKED for static intialization of
Message-Id: <20080529174502.GA4926@kernelpanic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

arm: Replace deprecated SPIN_LOCK_UNLOCKED for static initialization of 
lock to .lock = __SPIN_LOCK_UNLOCKED.

PATCH FOLLOWS

KernelVersion: 2.6.26-rc4

Signed-off-by: Pradeep Singh <rautelap@gmail.com>
---
 arch/arm/kernel/irq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index 11dcd52..8d3188e 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -100,7 +100,7 @@ unlock:
 /* Handle bad interrupts */
 static struct irq_desc bad_irq_desc = {
 	.handle_irq = handle_bad_irq,
-	.lock = SPIN_LOCK_UNLOCKED
+	.lock = __SPIN_LOCK_UNLOCKED(bad_irq_desc.lock),
 };
 
 /*
-- 
1.5.5.1

