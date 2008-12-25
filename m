From: Julia Lawall <julia@diku.dk>
Date: Thu, 25 Dec 2008 14:34:04 +0000
Subject: [PATCH 3/7] arch/powerpc/platforms/pasemi: Use DEFINE_SPINLOCK
Message-Id: <Pine.LNX.4.64.0812251533350.22039@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: olof@lixom.net, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

SPIN_LOCK_UNLOCKED is deprecated.  The following makes the change suggested
in Documentation/spinlocks.txt

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
declarer name DEFINE_SPINLOCK;
identifier xxx_lock;
@@

- spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;
+ DEFINE_SPINLOCK(xxx_lock);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/arch/powerpc/platforms/pasemi/dma_lib.c b/arch/powerpc/platforms/pasemi/dma_lib.c
--- a/arch/powerpc/platforms/pasemi/dma_lib.c
+++ b/arch/powerpc/platforms/pasemi/dma_lib.c
@@ -509,7 +509,7 @@ fallback:
  */
 int pasemi_dma_init(void)
 {
-	static spinlock_t init_lock = SPIN_LOCK_UNLOCKED;
+	static DEFINE_SPINLOCK(init_lock);
 	struct pci_dev *iob_pdev;
 	struct pci_dev *pdev;
 	struct resource res;
