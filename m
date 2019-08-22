From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 22 Aug 2019 07:05:57 +0000
Subject: [PATCH -next] usb: udc: lpc32xx: remove set but not used 3 variables
Message-Id: <20190822070557.74874-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: balbi@kernel.org, gregkh@linuxfoundation.org, vz@mleia.com, slemieux.tyco@gmail.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:
drivers/usb/gadget/udc/lpc32xx_udc.c: In function ‘udc_protocol_cmd_r’:
drivers/usb/gadget/udc/lpc32xx_udc.c:744:6: warning: variable ‘tmp’ set but not used [-Wunused-but-set-variable]

drivers/usb/gadget/udc/lpc32xx_udc.c: In function ‘udc_handle_dma_ep’:
drivers/usb/gadget/udc/lpc32xx_udc.c:1994:14: warning: variable ‘epstatus’ set but not used [-Wunused-but-set-variable]

drivers/usb/gadget/udc/lpc32xx_udc.c: In function ‘udc_handle_ep0_setup’:
drivers/usb/gadget/udc/lpc32xx_udc.c:2200:22: warning: variable ‘wLength’ set but not used [-Wunused-but-set-variable]

It is not used since commit 90fccb529d24 ("usb: gadget: Gadget directory cleanup - group UDC drivers")

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 606c8bc..b3e073f 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -741,7 +741,6 @@ static inline void udc_protocol_cmd_data_w(struct lpc32xx_udc *udc, u32 cmd,
  * response data */
 static u32 udc_protocol_cmd_r(struct lpc32xx_udc *udc, u32 cmd)
 {
-	u32 tmp;
 	int to = 1000;
 
 	/* Write a command and read data from the protocol engine */
@@ -751,7 +750,6 @@ static u32 udc_protocol_cmd_r(struct lpc32xx_udc *udc, u32 cmd)
 	/* Write command code */
 	udc_protocol_cmd_w(udc, cmd);
 
-	tmp = readl(USBD_DEVINTST(udc->udp_baseaddr));
 	while ((!(readl(USBD_DEVINTST(udc->udp_baseaddr)) & USBD_CDFULL))
 	       && (to > 0))
 		to--;
@@ -1991,7 +1989,7 @@ void udc_handle_eps(struct lpc32xx_udc *udc, struct lpc32xx_ep *ep)
 /* DMA end of transfer completion */
 static void udc_handle_dma_ep(struct lpc32xx_udc *udc, struct lpc32xx_ep *ep)
 {
-	u32 status, epstatus;
+	u32 status;
 	struct lpc32xx_request *req;
 	struct lpc32xx_usbd_dd_gad *dd;
 
@@ -2085,7 +2083,7 @@ static void udc_handle_dma_ep(struct lpc32xx_udc *udc, struct lpc32xx_ep *ep)
 		if (udc_clearep_getsts(udc, ep->hwep_num) & EP_SEL_F) {
 			udc_clearep_getsts(udc, ep->hwep_num);
 			uda_enable_hwepint(udc, ep->hwep_num);
-			epstatus = udc_clearep_getsts(udc, ep->hwep_num);
+			udc_clearep_getsts(udc, ep->hwep_num);
 
 			/* Let the EP interrupt handle the ZLP */
 			return;
@@ -2197,7 +2195,7 @@ static void udc_handle_ep0_setup(struct lpc32xx_udc *udc)
 	struct lpc32xx_ep *ep, *ep0 = &udc->ep[0];
 	struct usb_ctrlrequest ctrlpkt;
 	int i, bytes;
-	u16 wIndex, wValue, wLength, reqtype, req, tmp;
+	u16 wIndex, wValue, reqtype, req, tmp;
 
 	/* Nuke previous transfers */
 	nuke(ep0, -EPROTO);
@@ -2213,7 +2211,6 @@ static void udc_handle_ep0_setup(struct lpc32xx_udc *udc)
 	/* Native endianness */
 	wIndex = le16_to_cpu(ctrlpkt.wIndex);
 	wValue = le16_to_cpu(ctrlpkt.wValue);
-	wLength = le16_to_cpu(ctrlpkt.wLength);
 	reqtype = le16_to_cpu(ctrlpkt.bRequestType);
 
 	/* Set direction of EP0 */
-- 
2.7.4
