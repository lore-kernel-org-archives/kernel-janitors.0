From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Jan 2015 10:19:21 +0000
Subject: [patch] usb: gadget: gadgetfs: fix an oops in ep_write()
Message-Id: <20150106101921.GD8698@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We try to free an ERR_PTR on this error path.

Fixes: b44be2462dbe ('usb: gadget: gadgetfs: Free memory allocated by memdup_user()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 0804861..db49ec4 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -441,6 +441,7 @@ ep_write (struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 	kbuf = memdup_user(buf, len);
 	if (IS_ERR(kbuf)) {
 		value = PTR_ERR(kbuf);
+		kbuf = NULL;
 		goto free1;
 	}
 
