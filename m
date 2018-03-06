From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Mar 2018 10:03:56 +0000
Subject: [PATCH] staging: emxx_udc: Remove unnecessary NULL checks
Message-Id: <20180306100356.GC10474@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These pointers can't be NULL so I have removed the checks.

The checking was sort of problematic as well because it didn't make
sense.  In _nbu2ss_read_request_data() the && should have been ||.  In
nbu2ss_gad_get_frame() we know that "pgadget" is non-NULL and "udc" is
an offset from "pgadget" so it can't be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index ad69a1e536a7..3e51476a7045 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -1672,9 +1672,6 @@ static int std_req_set_configuration(struct nbu2ss_udc *udc)
 /*-------------------------------------------------------------------------*/
 static inline void _nbu2ss_read_request_data(struct nbu2ss_udc *udc, u32 *pdata)
 {
-	if ((!udc) && (!pdata))
-		return;
-
 	*pdata = _nbu2ss_readl(&udc->p_regs->SETUP_DATA0);
 	pdata++;
 	*pdata = _nbu2ss_readl(&udc->p_regs->SETUP_DATA1);
@@ -2941,11 +2938,6 @@ static int nbu2ss_gad_get_frame(struct usb_gadget *pgadget)
 	}
 
 	udc = container_of(pgadget, struct nbu2ss_udc, gadget);
-	if (!udc) {
-		dev_err(&pgadget->dev, "%s, udc = NULL\n", __func__);
-		return -EINVAL;
-	}
-
 	data = gpio_get_value(VBUS_VALUE);
 	if (data = 0)
 		return -EINVAL;
