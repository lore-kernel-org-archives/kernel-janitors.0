From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Mar 2016 10:07:45 +0000
Subject: [patch] rtc: ds1685: passing bogus values to irq_restore
Message-Id: <20160302100745.GB5533@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Kinard <kumba@gentoo.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We call spin_lock_irqrestore with "flags" set to zero instead of to the
value from spin_lock_irqsave().

Fixes: aaaf5fbf56f1 ('rtc: add driver for DS1685 family of real time clocks')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 535050f..08e0ff8 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -187,9 +187,9 @@ ds1685_rtc_end_data_access(struct ds1685_priv *rtc)
  * Only use this where you are certain another lock will not be held.
  */
 static inline void
-ds1685_rtc_begin_ctrl_access(struct ds1685_priv *rtc, unsigned long flags)
+ds1685_rtc_begin_ctrl_access(struct ds1685_priv *rtc, unsigned long *flags)
 {
-	spin_lock_irqsave(&rtc->lock, flags);
+	spin_lock_irqsave(&rtc->lock, *flags);
 	ds1685_rtc_switch_to_bank1(rtc);
 }
 
@@ -1300,7 +1300,7 @@ ds1685_rtc_sysfs_ctrl_regs_store(struct device *dev,
 {
 	struct ds1685_priv *rtc = dev_get_drvdata(dev);
 	u8 reg = 0, bit = 0, tmp;
-	unsigned long flags = 0;
+	unsigned long flags;
 	long int val = 0;
 	const struct ds1685_rtc_ctrl_regs *reg_info  		ds1685_rtc_sysfs_ctrl_regs_lookup(attr->attr.name);
@@ -1321,7 +1321,7 @@ ds1685_rtc_sysfs_ctrl_regs_store(struct device *dev,
 	bit = reg_info->bit;
 
 	/* Safe to spinlock during a write. */
-	ds1685_rtc_begin_ctrl_access(rtc, flags);
+	ds1685_rtc_begin_ctrl_access(rtc, &flags);
 	tmp = rtc->read(rtc, reg);
 	rtc->write(rtc, reg, (val ? (tmp | bit) : (tmp & ~(bit))));
 	ds1685_rtc_end_ctrl_access(rtc, flags);
