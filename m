From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 21:36:00 +0000
Subject: [PATCH 8/9][v2] mISDN: timerdev: use __user for mISDN_read's buffer argument
Message-Id: <49419a3f.0710660a.4800.7087@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Karsten Keil <kkeil@suse.de>

Fix this warning:

  drivers/isdn/mISDN/timerdev.c:264:11: warning: incorrect type in initializer (incompatible argument 2 (different address spaces))
  drivers/isdn/mISDN/timerdev.c:264:11:    expected int ( *read )( ... )
  drivers/isdn/mISDN/timerdev.c:264:11:    got int ( static [toplevel] *<noident> )( ... )

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
Acked-by: Karsten Keil <kkeil@suse.de>
---
 drivers/isdn/mISDN/timerdev.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/isdn/mISDN/timerdev.c b/drivers/isdn/mISDN/timerdev.c
index 62b5e49..f2b3218 100644
--- a/drivers/isdn/mISDN/timerdev.c
+++ b/drivers/isdn/mISDN/timerdev.c
@@ -86,7 +86,7 @@ mISDN_close(struct inode *ino, struct file *filep)
 }
 
 static ssize_t
-mISDN_read(struct file *filep, char *buf, size_t count, loff_t *off)
+mISDN_read(struct file *filep, char __user *buf, size_t count, loff_t *off)
 {
 	struct mISDNtimerdev	*dev = filep->private_data;
 	struct mISDNtimer	*timer;
@@ -116,7 +116,7 @@ mISDN_read(struct file *filep, char *buf, size_t count, loff_t *off)
 		timer = (struct mISDNtimer *)dev->expired.next;
 		list_del(&timer->list);
 		spin_unlock_irqrestore(&dev->lock, flags);
-		if (put_user(timer->id, (int *)buf))
+		if (put_user(timer->id, (int __user *)buf))
 			ret = -EFAULT;
 		else
 			ret = sizeof(int);
-- 
1.5.6.3

