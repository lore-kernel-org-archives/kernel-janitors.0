From: Dan Carpenter <error27@gmail.com>
Date: Sun, 18 Apr 2010 19:07:33 +0000
Subject: [patch] pcmcia: fix error handling in cm4000_cs.c
Message-Id: <20100418190732.GA7920@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@gnumonks.org>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, H Hartley Sweeten <hsweeten@visionengravers.com>, Andrew Morton <akpm@linux-foundation.org>, Roel Kluin <roel.kluin@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In the original code we used -ENODEV as the number of bytes to
copy_to_user() and we didn't release the locks.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/char/pcmcia/cm4000_cs.c b/drivers/char/pcmcia/cm4000_cs.c
index c9bc896..90b199f 100644
--- a/drivers/char/pcmcia/cm4000_cs.c
+++ b/drivers/char/pcmcia/cm4000_cs.c
@@ -1026,14 +1026,16 @@ static ssize_t cmm_read(struct file *filp, __user char *buf, size_t count,
 
 	xoutb(0, REG_FLAGS1(iobase));	/* clear detectCMM */
 	/* last check before exit */
-	if (!io_detect_cm4000(iobase, dev))
-		count = -ENODEV;
+	if (!io_detect_cm4000(iobase, dev)) {
+		rc = -ENODEV;
+		goto release_io;
+	}
 
 	if (test_bit(IS_INVREV, &dev->flags) && count > 0)
 		str_invert_revert(dev->rbuf, count);
 
 	if (copy_to_user(buf, dev->rbuf, count))
-		return -EFAULT;
+		rc = -EFAULT;
 
 release_io:
 	clear_bit(LOCK_IO, &dev->flags);
