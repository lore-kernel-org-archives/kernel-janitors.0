From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 02 Aug 2017 15:29:27 +0000
Subject: [PATCH] usb: gadget: fsl_qe_udc: constify qe_ep0_desc
Message-Id: <1501687767-12768-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Li Yang <leoyang.li@nxp.com>
Cc: kernel-janitors@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

qe_ep0_desc is only passed as the second argument to qe_ep_init, which is
const, so qe_ep0_desc can be const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
I got a lot of warnings when compiling this file, but none seemed to be
related to the change.

 drivers/usb/gadget/udc/fsl_qe_udc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 303328ce..a3e72d6 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -62,7 +62,7 @@
 	"ep3",
 };
 
-static struct usb_endpoint_descriptor qe_ep0_desc = {
+static const struct usb_endpoint_descriptor qe_ep0_desc = {
 	.bLength =		USB_DT_ENDPOINT_SIZE,
 	.bDescriptorType =	USB_DT_ENDPOINT,
 

