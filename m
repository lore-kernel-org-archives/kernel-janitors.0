From: Julia Lawall <julia@diku.dk>
Date: Sat, 21 Nov 2009 15:09:26 +0000
Subject: [PATCH] drivers/usb/wusbcore: introduce missing usb_free_urb
Message-Id: <Pine.LNX.4.64.0911211608590.26930@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Vrabel <david.vrabel@csr.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a usb_alloc_urb should free the allocated data.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,f1,l;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = usb_alloc_urb(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...x...+> }
(
x->f1 = E
|
 (x->f1 = NULL || ...)
|
 f(...,x->f1,...)
)
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s alloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 drivers/usb/wusbcore/devconnect.c   |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/wusbcore/devconnect.c b/drivers/usb/wusbcore/devconnect.c
index 4ac4300..828310c 100644
--- a/drivers/usb/wusbcore/devconnect.c
+++ b/drivers/usb/wusbcore/devconnect.c
@@ -122,7 +122,7 @@ static struct wusb_dev *wusb_dev_alloc(struct wusbhc *wusbhc)
 
 	req = kmalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
 	if (req = NULL)
-		goto err;
+		goto err2;
 
 	req->bRequestType = USB_DIR_OUT | USB_TYPE_STANDARD | USB_RECIP_DEVICE;
 	req->bRequest = USB_REQ_SET_DESCRIPTOR;
@@ -134,6 +134,8 @@ static struct wusb_dev *wusb_dev_alloc(struct wusbhc *wusbhc)
 	wusb_dev->set_gtk_req = req;
 
 	return wusb_dev;
+err2:
+	usb_free_urb(urb);
 err:
 	wusb_dev_free(wusb_dev);
 	return NULL;
