From: Colin King <colin.king@canonical.com>
Date: Sun, 10 Nov 2019 22:14:13 +0000
Subject: [PATCH] usb: gadget: udc: lpc32xx: don't dereference ep until it has been null checked
Message-Id: <20191110221413.22321-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Roland Stigge <stigge@antcom.de>, Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer ep is currently being dereferenced when initializing pointer
udc before ep is being null checked.  Fix this by only dereferencing
ep after it has been null checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index d14b2bb3f67c..45b2a673ecba 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -1872,7 +1872,7 @@ static int lpc32xx_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 static int lpc32xx_ep_set_halt(struct usb_ep *_ep, int value)
 {
 	struct lpc32xx_ep *ep = container_of(_ep, struct lpc32xx_ep, ep);
-	struct lpc32xx_udc *udc = ep->udc;
+	struct lpc32xx_udc *udc;
 	unsigned long flags;
 
 	if ((!ep) || (ep->hwep_num <= 1))
@@ -1882,6 +1882,7 @@ static int lpc32xx_ep_set_halt(struct usb_ep *_ep, int value)
 	if (ep->is_in)
 		return -EAGAIN;
 
+	udc = ep->udc;
 	spin_lock_irqsave(&udc->lock, flags);
 
 	if (value = 1) {
-- 
2.20.1
