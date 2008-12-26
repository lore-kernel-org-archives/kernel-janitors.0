From: Julia Lawall <julia@diku.dk>
Date: Fri, 26 Dec 2008 07:28:58 +0000
Subject: [PATCH 6/7] drivers/staging/comedi: Move a dereference below a NULL
Message-Id: <Pine.LNX.4.64.0812260828350.25450@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/).

// <smpl>
@disable is_null@
identifier f;
expression E;
identifier fld;
statement S;
@@

+ if (E = NULL) S
  f(...,E->fld,...);
- if (E = NULL) S

@@
identifier f;
expression E;
identifier fld;
statement S;
@@

+ if (!E) S
  f(...,E->fld,...);
- if (!E) S
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/comedi/drivers/usbduxfast.c    |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/comedi/drivers/usbduxfast.c b/drivers/staging/comedi/drivers/usbduxfast.c
index 3a00ff0..5c8db77 100644
--- a/drivers/staging/comedi/drivers/usbduxfast.c
+++ b/drivers/staging/comedi/drivers/usbduxfast.c
@@ -1671,15 +1671,15 @@ static int usbduxfast_detach(comedi_device * dev)
 {
 	usbduxfastsub_t *usbduxfastsub_tmp;
 
-#ifdef CONFIG_COMEDI_DEBUG
-	printk("comedi%d: usbduxfast: detach usb device\n", dev->minor);
-#endif
-
 	if (!dev) {
 		printk("comedi?: usbduxfast: detach without dev variable...\n");
 		return -EFAULT;
 	}
 
+#ifdef CONFIG_COMEDI_DEBUG
+	printk("comedi%d: usbduxfast: detach usb device\n", dev->minor);
+#endif
+
 	usbduxfastsub_tmp = dev->private;
 	if (!usbduxfastsub_tmp) {
 		printk("comedi?: usbduxfast: detach without ptr to usbduxfastsub[]\n");
