From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Jun 2015 12:20:25 +0000
Subject: [patch] staging: ozwpan: prevent a couple of underflows
Message-Id: <20150602122025.GA30789@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The underflow in OZ_DATA_F_ISOC_FIXED seems not harmful, but this patch
is a clean up and makes my static checker a bit happier.

The underflow in OZ_VENDOR_CLASS_RSP seems like it could result in
memory corruption.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/ozwpan/ozusbsvc1.c b/drivers/staging/ozwpan/ozusbsvc1.c
index f660bb1..301fee8 100644
--- a/drivers/staging/ozwpan/ozusbsvc1.c
+++ b/drivers/staging/ozwpan/ozusbsvc1.c
@@ -342,12 +342,16 @@ static void oz_usb_handle_ep_data(struct oz_usb_ctx *usb_ctx,
 	case OZ_DATA_F_ISOC_FIXED: {
 			struct oz_isoc_fixed *body  				(struct oz_isoc_fixed *)data_hdr;
-			int data_len = len-sizeof(struct oz_isoc_fixed)+1;
+			int data_len;
 			int unit_size = body->unit_size;
 			u8 *data = body->data;
 			int count;
 			int i;
 
+			if (len < sizeof(struct oz_isoc_fixed) - 1)
+				break;
+			data_len = len - (sizeof(struct oz_isoc_fixed) - 1);
+
 			if (!unit_size)
 				break;
 			count = data_len/unit_size;
@@ -427,6 +431,11 @@ void oz_usb_rx(struct oz_pd *pd, struct oz_elt *elt)
 	case OZ_VENDOR_CLASS_RSP: {
 			struct oz_vendor_class_rsp *body  				(struct oz_vendor_class_rsp *)usb_hdr;
+
+			if (elt->length <
+			    sizeof(struct oz_vendor_class_rsp) - 1)
+				break;
+
 			oz_hcd_control_cnf(usb_ctx->hport, body->req_id,
 				body->rcode, body->data, elt->length-
 				sizeof(struct oz_vendor_class_rsp)+1);
