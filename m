From: Dan Carpenter <error27@gmail.com>
Date: Wed, 11 Aug 2010 18:01:46 +0000
Subject: [patch] synclink: add mutex_unlock() on error path
Message-Id: <20100811180146.GB645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a path which still holds its mutex here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/char/synclink_gt.c b/drivers/char/synclink_gt.c
index fef80cf..e63b830 100644
--- a/drivers/char/synclink_gt.c
+++ b/drivers/char/synclink_gt.c
@@ -691,8 +691,10 @@ static int open(struct tty_struct *tty, struct file *filp)
 	if (info->port.count = 1) {
 		/* 1st open on this device, init hardware */
 		retval = startup(info);
-		if (retval < 0)
+		if (retval < 0) {
+			mutex_unlock(&info->port.mutex);
 			goto cleanup;
+		}
 	}
 	mutex_unlock(&info->port.mutex);
 	retval = block_til_ready(tty, filp, info);
