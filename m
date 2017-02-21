From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 21 Feb 2017 21:33:11 +0000
Subject: [PATCH] USB: gadgetfs: Fix a potential memory leak in 'dev_config()'
Message-Id: <20170221213311.11299-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'kbuf' is allocated just a few lines above using 'memdup_user()'.
If the 'if (dev->buf)' test fails, this memory is never released.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/legacy/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 79a2d8fba6b6..a2c916869293 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1781,8 +1781,10 @@ dev_config (struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 
 	spin_lock_irq (&dev->lock);
 	value = -EINVAL;
-	if (dev->buf)
+	if (dev->buf) {
+		kfree(kbuf);
 		goto fail;
+	}
 	dev->buf = kbuf;
 
 	/* full or low speed config */
-- 
2.9.3

