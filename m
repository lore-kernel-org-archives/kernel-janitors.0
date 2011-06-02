From: Julia Lawall <julia@diku.dk>
Date: Thu, 02 Jun 2011 08:26:26 +0000
Subject: [PATCH] drivers/usb/gadget/inode.c: add missing kfree
Message-Id: <1307003186-23244-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <dbrownell@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The label fail frees dev->buf, but kbuf hasn't yet been stored there at
this point.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@exists@
local idexpression x;
statement S;
expression E;
expression *ptr != NULL;
@@

x = memdup_user(...);
...
if (IS_ERR(x)) S
... when != x
    when != x = E
(
 return \(0\|<+...x...+>\|ptr\);
|
*return ...;
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
I wonder if it is really correct to free dev->buf at fail in this case.
Because it is freeing the previously allocated value of dev->buf, not the
current one as done in subsequent cases.

 drivers/usb/gadget/inode.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/inode.c b/drivers/usb/gadget/inode.c
index a01383f..316547a 100644
--- a/drivers/usb/gadget/inode.c
+++ b/drivers/usb/gadget/inode.c
@@ -1870,8 +1870,10 @@ dev_config (struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 
 	spin_lock_irq (&dev->lock);
 	value = -EINVAL;
-	if (dev->buf)
+	if (dev->buf) {
+		kfree(kbuf);
 		goto fail;
+	}
 	dev->buf = kbuf;
 
 	/* full or low speed config */

