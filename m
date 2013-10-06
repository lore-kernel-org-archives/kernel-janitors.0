From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 06 Oct 2013 00:32:53 +0000
Subject: [patch] USB: cyberjack: fix buggy integer overflow test
Message-Id: <20131006003253.GA16592@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"old_rdtodo" and "size" are short type.  They are type promoted to int
and the condition is never true.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/serial/cyberjack.c b/drivers/usb/serial/cyberjack.c
index 7814262..6e1b69d 100644
--- a/drivers/usb/serial/cyberjack.c
+++ b/drivers/usb/serial/cyberjack.c
@@ -279,7 +279,7 @@ static void cyberjack_read_int_callback(struct urb *urb)
 
 		old_rdtodo = priv->rdtodo;
 
-		if (old_rdtodo + size < old_rdtodo) {
+		if (old_rdtodo > SHRT_MAX - size) {
 			dev_dbg(dev, "To many bulk_in urbs to do.\n");
 			spin_unlock(&priv->lock);
 			goto resubmit;
