From: Hannes Eder <hannes@hanneseder.net>
Date: Tue, 09 Dec 2008 22:07:02 +0000
Subject: [PATCH 8/9] mISDN: fix sparse warnings
Message-Id: <493feac0.09cc660a.02d5.6e27@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <kkeil@suse.de>
Cc: linux-kernel@vger.kernel.org

Impact: use the address space modifier __user

Fix this warning:

  drivers/isdn/mISDN/timerdev.c:264:11: warning: incorrect type in initializer (incompatible argument 2 (different address spaces))
  drivers/isdn/mISDN/timerdev.c:264:11:    expected int ( *read )( ... )
  drivers/isdn/mISDN/timerdev.c:264:11:    got int ( static [toplevel] *<noident> )( ... )

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
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

