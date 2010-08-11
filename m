From: Julia Lawall <julia@diku.dk>
Date: Wed, 11 Aug 2010 10:10:48 +0000
Subject: [PATCH 1/5] drivers/usb/gadget: Return -ENOMEM on memory allocation
Message-Id: <Pine.LNX.4.64.1008111210291.8669@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this code, 0 is returned on memory allocation failure, even though other
failures return -ENOMEM or other similar values.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ret;
expression x,e1,e2,e3;
@@

ret = 0
... when != ret = e1
*x = \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != ret = e2
if (x = NULL) { ... when != ret = e3
  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/gadget/m66592-udc.c   |    1 +
 drivers/usb/gadget/r8a66597-udc.c |    1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/r8a66597-udc.c b/drivers/usb/gadget/r8a66597-udc.c
index 70a8178..2456ccd 100644
--- a/drivers/usb/gadget/r8a66597-udc.c
+++ b/drivers/usb/gadget/r8a66597-udc.c
@@ -1557,6 +1557,7 @@ static int __init r8a66597_probe(struct platform_device *pdev)
 	/* initialize ucd */
 	r8a66597 = kzalloc(sizeof(struct r8a66597), GFP_KERNEL);
 	if (r8a66597 = NULL) {
+		ret = -ENOMEM;
 		printk(KERN_ERR "kzalloc error\n");
 		goto clean_up;
 	}
diff --git a/drivers/usb/gadget/m66592-udc.c b/drivers/usb/gadget/m66592-udc.c
index 166bf71..e03058f 100644
--- a/drivers/usb/gadget/m66592-udc.c
+++ b/drivers/usb/gadget/m66592-udc.c
@@ -1609,6 +1609,7 @@ static int __init m66592_probe(struct platform_device *pdev)
 	/* initialize ucd */
 	m66592 = kzalloc(sizeof(struct m66592), GFP_KERNEL);
 	if (m66592 = NULL) {
+		ret = -ENOMEM;
 		pr_err("kzalloc error\n");
 		goto clean_up;
 	}
