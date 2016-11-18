From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Nov 2016 11:30:57 +0000
Subject: [patch] snsc: restore IRQs on error path in scdrv_write()
Message-Id: <20161118113057.GB3150@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This bug is as old as git.  We need to be calling spin_unlock_irqrestore()
instead of regular spin_unlock() here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/snsc.c b/drivers/char/snsc.c
index 10e5632..ec07f0e 100644
--- a/drivers/char/snsc.c
+++ b/drivers/char/snsc.c
@@ -285,7 +285,7 @@ scdrv_write(struct file *file, const char __user *buf,
 		DECLARE_WAITQUEUE(wait, current);
 
 		if (file->f_flags & O_NONBLOCK) {
-			spin_unlock(&sd->sd_wlock);
+			spin_unlock_irqrestore(&sd->sd_wlock, flags);
 			up(&sd->sd_wbs);
 			return -EAGAIN;
 		}
