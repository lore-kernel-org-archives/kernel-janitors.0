From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2011 19:24:02 +0000
Subject: [patch -next] xshm: calling unlock improperly in xshmchr_chrpoll()
Message-Id: <20111208192402.GA8810@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sjur =?utf-8?B?QnLvv71uZGVsYW5k?= <sjur.brandeland@stericsson.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We got interrupted before we could take the lock here, and so we
shouldn't call unlock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xshm/xshm_chr.c b/drivers/xshm/xshm_chr.c
index 8593367..4df1287 100644
--- a/drivers/xshm/xshm_chr.c
+++ b/drivers/xshm/xshm_chr.c
@@ -620,7 +620,7 @@ static unsigned int xshmchr_chrpoll(struct file *filp, poll_table *waittab)
 	if (mutex_lock_interruptible(&dev->mutex)) {
 		xdev_dbg(dev, "mutex_lock_interruptible got signalled\n");
 		mask |= POLLERR;
-		goto out;
+		goto out_unlocked;
 	}
 	xshmchr_get(dev);
 
@@ -644,6 +644,7 @@ static unsigned int xshmchr_chrpoll(struct file *filp, poll_table *waittab)
 
 out:
 	mutex_unlock(&dev->mutex);
+out_unlocked:
 	xdev_devl(dev, "poll return mask=0x%04x\n", mask);
 	xshmchr_put(dev);
 	return mask;
