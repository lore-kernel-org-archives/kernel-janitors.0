From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 26 May 2014 15:21:20 +0000
Subject: [PATCH 11/18] usb: gadget: Use kmemdup instead of kmalloc + memcpy
Message-Id: <1401117687-28911-12-git-send-email-benoit.taine@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: benoit.taine@lip6.fr, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This issue was reported by coccicheck using the semantic patch 
at scripts/coccinelle/api/memdup.cocci

Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>
---
Tested by compilation without errors.

 drivers/usb/gadget/configfs.c    |    4 +---
 drivers/usb/gadget/lpc32xx_udc.c |    3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 2ddcd63..bcc2a62 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1021,12 +1021,10 @@ static ssize_t ext_prop_data_store(struct usb_os_desc_ext_prop *ext_prop,
 
 	if (page[len - 1] = '\n' || page[len - 1] = '\0')
 		--len;
-	new_data = kzalloc(len, GFP_KERNEL);
+	new_data = kmemdup(page, len, GFP_KERNEL);
 	if (!new_data)
 		return -ENOMEM;
 
-	memcpy(new_data, page, len);
-
 	if (desc->opts_mutex)
 		mutex_lock(desc->opts_mutex);
 	kfree(ext_prop->data);
diff --git a/drivers/usb/gadget/lpc32xx_udc.c b/drivers/usb/gadget/lpc32xx_udc.c
index e471580..0588231 100644
--- a/drivers/usb/gadget/lpc32xx_udc.c
+++ b/drivers/usb/gadget/lpc32xx_udc.c
@@ -3045,11 +3045,10 @@ static int __init lpc32xx_udc_probe(struct platform_device *pdev)
 	dma_addr_t dma_handle;
 	struct device_node *isp1301_node;
 
-	udc = kzalloc(sizeof(*udc), GFP_KERNEL);
+	udc = kmemdup(&controller_template, sizeof(*udc), GFP_KERNEL);
 	if (!udc)
 		return -ENOMEM;
 
-	memcpy(udc, &controller_template, sizeof(*udc));
 	for (i = 0; i <= 15; i++)
 		udc->ep[i].udc = udc;
 	udc->gadget.ep0 = &udc->ep[0].ep;

