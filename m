From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2013 07:42:34 +0000
Subject: [PATCH] net: cdc_ncm: cleanup a type issue in cdc_ncm_setup()
Message-Id: <20131113074234.GB25541@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Neukum <oliver-GvhC2dPhHPQdnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is harmless but cdc_ncm_setup() returns negative error codes
truncated to u8 values.  There is only one caller and treats all
non-zero returns as errors but doesn't store the the return code.  So
the code works correctly but it's messy and upsets the static checkers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index f74786a..e15ec2b 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -66,7 +66,7 @@ static void cdc_ncm_tx_timeout_start(struct cdc_ncm_ctx *ctx);
 static enum hrtimer_restart cdc_ncm_tx_timer_cb(struct hrtimer *hr_timer);
 static struct usb_driver cdc_ncm_driver;
 
-static u8 cdc_ncm_setup(struct usbnet *dev)
+static int cdc_ncm_setup(struct usbnet *dev)
 {
 	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
 	struct usb_cdc_ncm_ntb_parameters ncm_parm;
