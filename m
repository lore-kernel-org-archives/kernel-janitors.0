From: Julia Lawall <julia@diku.dk>
Date: Thu, 25 Dec 2008 14:33:34 +0000
Subject: [PATCH 2/7] arch/powerpc/platforms/52xx: Use DEFINE_SPINLOCK
Message-Id: <Pine.LNX.4.64.0812251533130.22039@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tnt@246tNt.com, grant.likely@secretlab.ca, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
diff -u -p a/arch/powerpc/platforms/52xx/mpc52xx_common.c b/arch/powerpc/platforms/52xx/mpc52xx_common.c
--- a/arch/powerpc/platforms/52xx/mpc52xx_common.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_common.c
@@ -42,7 +42,7 @@ static struct of_device_id mpc52xx_bus_i
  * from interrupt context while node mapping (which calls ioremap())
  * cannot be used at such point.
  */
-static spinlock_t mpc52xx_lock = SPIN_LOCK_UNLOCKED;
+static DEFINE_SPINLOCK(mpc52xx_lock);
 static struct mpc52xx_gpt __iomem *mpc52xx_wdt;
 static struct mpc52xx_cdm __iomem *mpc52xx_cdm;
 
