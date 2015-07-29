From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jul 2015 21:30:58 +0000
Subject: [patch] usb: gadget: m66592-udc: forever loop in set_feature()
Message-Id: <20150729213057.GC21784@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is an "&&" vs "||" typo here so this loops 3000 times or if we get
unlucky it could loop forever.

Fixes: ceaa0a6eeadf ('usb: gadget: m66592-udc: add support for TEST_MODE')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index 309706f..9704053 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1052,7 +1052,7 @@ static void set_feature(struct m66592 *m66592, struct usb_ctrlrequest *ctrl)
 				tmp = m66592_read(m66592, M66592_INTSTS0) &
 								M66592_CTSQ;
 				udelay(1);
-			} while (tmp != M66592_CS_IDST || timeout-- > 0);
+			} while (tmp != M66592_CS_IDST && timeout-- > 0);
 
 			if (tmp = M66592_CS_IDST)
 				m66592_bset(m66592,
