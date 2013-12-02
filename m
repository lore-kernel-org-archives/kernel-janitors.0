From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 02 Dec 2013 14:56:46 +0000
Subject: [PATCH] proposed consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131202145646.GA5126@opentech.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From 5b3d0b88438846cbdd888798c2fb04e20c69e95d Mon Sep 17 00:00:00 2001
From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Sun, 1 Dec 2013 22:53:18 -0500
Subject: [PATCH] consolidate spin_lock/unlock waiting with spin_unlock_wait

Hi !

 Not sure if this is the right place to put this...
 This patch proposes a small API consolidation. 

 in the following files there is a spin_lock/unlock in use for waiting on
 some possibly concurrent thread - that is there is a

	spin_lock(lock);
	spin_unlock(lock);

 so in the contended case the calling thread will wait for any concurrent
 access.

  arch/blackfin/mach-bf561/smp.c lock/unlock at lines 72 73
  arch/arm/mach-sti/platsmp.c lock/unlock at lines 53 54
  arch/cris/arch-v32/drivers/mach-fs/gpio.c lock/unlock at lines 764 765
  drivers/staging/lustre/lustre/obdclass/llog_obd.c lock/unlock at lines 87 89
  drivers/net/ethernet/chelsio/cxgb/cxgb2.c lock/unlock at lines 287 288
  drivers/net/ethernet/ti/cpmac.c lock/unlock at lines 582 583
  fs/fscache/object.c lock/unlock at lines 692 693

 in 
 commit c2f21ce2e31286a0a32f8da0a7856e9ca1122ef3
 Author: Thomas Gleixner <tglx@linutronix.de>
 Date:   Wed Dec 2 20:02:59 2009 +0100

    locking: Implement new raw_spinlock
 
 the api was extended with include/linux/spinlock.h:spin_unlock_wait() for 
 just this purpose (I think atleast) so the below patch changes these 
 currently hard-coded spin_lock/unlock to use the available API.
 so as its in spinlock.h and the code in question is using spin_lock/unlock
 no new header file inclusion is needed.

 all the above listed cases are consecutive spin_lock/spin_unlock.
 the one-line offset in llog_obd.c at lines 87 89 is due to a comment not code
 so it also is a consecutive spin_lock/spin_unlock, 

 If these changes make any sense should this go out to all of the code authors
 for review/ack or is this simple enough for it to just go out via 
 kernel-janitors/LKML for review ?

 patch is against 3.13.0-rc1 (linux-stable Greg KH tree)


Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
 arch/arm/mach-sti/platsmp.c                       |    3 +--
 arch/blackfin/mach-bf561/smp.c                    |    3 +--
 arch/cris/arch-v32/drivers/mach-fs/gpio.c         |    3 +--
 drivers/net/ethernet/chelsio/cxgb/cxgb2.c         |    3 +--
 drivers/net/ethernet/ti/cpmac.c                   |    3 +--
 drivers/staging/lustre/lustre/obdclass/llog_obd.c |    3 +--
 fs/fscache/object.c                               |    3 +--
 7 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-sti/platsmp.c b/arch/arm/mach-sti/platsmp.c
index dce50d9..e05b29e 100644
--- a/arch/arm/mach-sti/platsmp.c
+++ b/arch/arm/mach-sti/platsmp.c
@@ -50,8 +50,7 @@ void sti_secondary_init(unsigned int cpu)
 	/*
 	 * Synchronise with the boot thread.
 	 */
-	spin_lock(&boot_lock);
-	spin_unlock(&boot_lock);
+	spin_unlock_wait(&boot_lock);
 }
 
 int sti_boot_secondary(unsigned int cpu, struct task_struct *idle)
diff --git a/arch/blackfin/mach-bf561/smp.c b/arch/blackfin/mach-bf561/smp.c
index 11789be..463d839 100644
--- a/arch/blackfin/mach-bf561/smp.c
+++ b/arch/blackfin/mach-bf561/smp.c
@@ -69,8 +69,7 @@ void platform_secondary_init(unsigned int cpu)
 	SSYNC();
 
 	/* We are done with local CPU inits, unblock the boot CPU. */
-	spin_lock(&boot_lock);
-	spin_unlock(&boot_lock);
+	spin_unlock_wait(&boot_lock);
 }
 
 int platform_boot_secondary(unsigned int cpu, struct task_struct *idle)
diff --git a/arch/cris/arch-v32/drivers/mach-fs/gpio.c b/arch/cris/arch-v32/drivers/mach-fs/gpio.c
index a2ac091..dec2e43 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/gpio.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/gpio.c
@@ -761,8 +761,7 @@ virtual_gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		/* Clear alarm for bits with 1 in arg. */
 		priv->highalarm &= ~arg;
 		priv->lowalarm  &= ~arg;
-		spin_lock(&alarm_lock);
-		spin_unlock(&alarm_lock);
+		spin_unlock_wait(&alarm_lock);
 		break;
 	case IO_CFG_WRITE_MODE:
 	{
diff --git a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
index 1d02105..1aef5f2 100644
--- a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
+++ b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
@@ -284,8 +284,7 @@ static int cxgb_close(struct net_device *dev)
 	    !(adapter->open_device_map & PORT_MASK)) {
 		/* Stop statistics accumulation. */
 		smp_mb__after_clear_bit();
-		spin_lock(&adapter->work_lock);   /* sync with update task */
-		spin_unlock(&adapter->work_lock);
+		spin_unlock_wait(&adapter->work_lock);
 		cancel_mac_stats_update(adapter);
 	}
 
diff --git a/drivers/net/ethernet/ti/cpmac.c b/drivers/net/ethernet/ti/cpmac.c
index 2dc16b6..e62f812 100644
--- a/drivers/net/ethernet/ti/cpmac.c
+++ b/drivers/net/ethernet/ti/cpmac.c
@@ -579,8 +579,7 @@ static int cpmac_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_BUSY;
 	}
 
-	spin_lock(&priv->lock);
-	spin_unlock(&priv->lock);
+	spin_unlock_wait(&priv->lock);
 	desc->dataflags = CPMAC_SOP | CPMAC_EOP | CPMAC_OWN;
 	desc->skb = skb;
 	desc->data_mapping = dma_map_single(&dev->dev, skb->data, len,
diff --git a/drivers/staging/lustre/lustre/obdclass/llog_obd.c b/drivers/staging/lustre/lustre/obdclass/llog_obd.c
index 71817af..e6c0b90 100644
--- a/drivers/staging/lustre/lustre/obdclass/llog_obd.c
+++ b/drivers/staging/lustre/lustre/obdclass/llog_obd.c
@@ -84,9 +84,8 @@ int __llog_ctxt_put(const struct lu_env *env, struct llog_ctxt *ctxt)
 	spin_unlock(&olg->olg_lock);
 
 	obd = ctxt->loc_obd;
-	spin_lock(&obd->obd_dev_lock);
 	/* sync with llog ctxt user thread */
-	spin_unlock(&obd->obd_dev_lock);
+	spin_unlock_wait(&obd->obd_dev_lock);
 
 	/* obd->obd_starting is needed for the case of cleanup
 	 * in error case while obd is starting up. */
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index 53d35c5..43e1331 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -692,8 +692,7 @@ static const struct fscache_state *fscache_drop_object(struct fscache_object *ob
 	/* Prevent a race with our last child, which has to signal EV_CLEARED
 	 * before dropping our spinlock.
 	 */
-	spin_lock(&object->lock);
-	spin_unlock(&object->lock);
+	spin_unlock_wait(&object->lock);
 
 	/* Discard from the cache's collection of objects */
 	spin_lock(&cache->object_list_lock);
-- 
1.7.2.5


----- End forwarded message -----
