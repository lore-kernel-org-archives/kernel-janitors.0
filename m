From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 May 2014 12:26:55 +0000
Subject: [patch] usb: gadget: f_rndis: fix an error code on allocation failure
Message-Id: <20140521122655.GC23396@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This should be return -ENOMEM.  The current code returns successs.

Fixes: de7a8d2d534f ('usb: gadget: f_rndis: OS descriptors support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/f_rndis.c b/drivers/usb/gadget/f_rndis.c
index eed3ad8..31274f7 100644
--- a/drivers/usb/gadget/f_rndis.c
+++ b/drivers/usb/gadget/f_rndis.c
@@ -687,7 +687,7 @@ rndis_bind(struct usb_configuration *c, struct usb_function *f)
 		f->os_desc_table = kzalloc(sizeof(*f->os_desc_table),
 					   GFP_KERNEL);
 		if (!f->os_desc_table)
-			return PTR_ERR(f->os_desc_table);
+			return -ENOMEM;
 		f->os_desc_n = 1;
 		f->os_desc_table[0].os_desc = &rndis_opts->rndis_os_desc;
 	}
