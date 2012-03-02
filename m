From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Mar 2012 18:51:00 +0000
Subject: [patch] usb: gadget: dummy_hcd: signedness bug in transfer()
Message-Id: <20120302185051.GA3951@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"len" is unsigned so it's never less than zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/dummy_hcd.c b/drivers/usb/gadget/dummy_hcd.c
index 8cc1a88..e1cd56c 100644
--- a/drivers/usb/gadget/dummy_hcd.c
+++ b/drivers/usb/gadget/dummy_hcd.c
@@ -1352,7 +1352,7 @@ top:
 			len = dummy_perform_transfer(urb, req, len);
 
 			ep->last_io = jiffies;
-			if (len < 0) {
+			if ((int)len < 0) {
 				req->req.status = len;
 			} else {
 				limit -= len;
