From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Apr 2012 06:30:22 +0000
Subject: [patch] usb: gadget: add a sparse endian notation
Message-Id: <20120417063022.GC26756@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original code works fine, but Sparse complains because it isn't
annotated properly.

drivers/usb/gadget/composite.c:793:26: warning: incorrect type in assignment (different base types)
drivers/usb/gadget/composite.c:793:26:    expected unsigned short [unsigned] [usertype] language
devel/drivers/usb/gadget/composite.c:793:26:    got restricted __le16 [usertype] <noident>
devel/drivers/usb/gadget/composite.c:795:29: warning: restricted __le16 degrades to integer
drivers/usb/gadget/composite.c:798:24: warning: incorrect type in assignment (different base types)
drivers/usb/gadget/composite.c:798:24:    expected restricted __le16 [usertype] <noident>
devel/drivers/usb/gadget/composite.c:798:24:    got unsigned short [unsigned] [usertype] language

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index baaebf2..4672651 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -785,7 +785,7 @@ done:
 static void collect_langs(struct usb_gadget_strings **sp, __le16 *buf)
 {
 	const struct usb_gadget_strings	*s;
-	u16				language;
+	__le16				language;
 	__le16				*tmp;
 
 	while (*sp) {
