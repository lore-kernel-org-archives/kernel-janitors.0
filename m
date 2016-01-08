From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jan 2016 10:59:36 +0000
Subject: [patch] usb: gadget: zero: fix MODULE_PARM_DESC typo
Message-Id: <20160108105936.GE32195@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Opasiak <k.opasiak@samsung.com>, Li Jun <jun.li@freescale.com>, Roger Quadros <rogerq@ti.com>, Arnd Bergmann <arnd@arndb.de>, Igor Kotrasinski <i.kotrasinsk@samsung.com>, Peter Chen <peter.chen@freescale.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ss_" prefixes were missing.  It was supposed to be "ss_bulk_qlen"
instead of "bulk_qlen" and "ss_iso_qlen" instead of "iso_qlen".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/legacy/zero.c b/drivers/usb/gadget/legacy/zero.c
index d02e2ce..ee3f491 100644
--- a/drivers/usb/gadget/legacy/zero.c
+++ b/drivers/usb/gadget/legacy/zero.c
@@ -259,11 +259,11 @@ MODULE_PARM_DESC(qlen, "depth of loopback queue");
 
 module_param_named(ss_bulk_qlen, gzero_options.ss_bulk_qlen, uint,
 		S_IRUGO|S_IWUSR);
-MODULE_PARM_DESC(bulk_qlen, "depth of sourcesink queue for bulk transfer");
+MODULE_PARM_DESC(ss_bulk_qlen, "depth of sourcesink queue for bulk transfer");
 
 module_param_named(ss_iso_qlen, gzero_options.ss_iso_qlen, uint,
 		S_IRUGO|S_IWUSR);
-MODULE_PARM_DESC(iso_qlen, "depth of sourcesink queue for iso transfer");
+MODULE_PARM_DESC(ss_iso_qlen, "depth of sourcesink queue for iso transfer");
 
 static int zero_bind(struct usb_composite_dev *cdev)
 {
