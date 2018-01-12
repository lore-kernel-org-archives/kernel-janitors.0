From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 12 Jan 2018 21:44:33 +0000
Subject: [PATCH 4/4] usb: gadget: fotg210-udc: Fix a potential invalid pointer dereference
Message-Id: <401ba0ff47de1c12c0798ed38fc9b0124f5de269.1515791144.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org, bhumirks@gmail.com, leoyang.li@nxp.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We should not call 'fotg210_ep_free_request()' with NULL as a 2nd parameter.
Depending of the layout of 'struct fotg210_request', this could lead to an
un-expected behavior.

So, if 'fotg210_ep_alloc_request()' fails, we should return directly.
This also gives the opportunity to further simplify code.


(In fact, this change should be a no-op, because 'req' is the first field of
'struct fotg210_request'. So passing NULL would result in 'free(NULL)' in
'fotg210_ep_free_request()'. Anyway avoiding the goto is cleaner.)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 99a18b14c8c2..03adfcb58548 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -1075,8 +1075,7 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 {
 	struct resource *res, *ires;
 	struct fotg210_udc *fotg210 = NULL;
-	int ret = 0;
-	int i;
+	int ret, i;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -1090,8 +1089,6 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = -ENOMEM;
-
 	/* initialize udc */
 	fotg210 = devm_kzalloc(&pdev->dev, sizeof(struct fotg210_udc),
 			       GFP_KERNEL);
@@ -1155,8 +1152,8 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 
 	fotg210->ep0_req = fotg210_ep_alloc_request(&fotg210->ep[0]->ep,
 				GFP_KERNEL);
-	if (fotg210->ep0_req = NULL)
-		goto err_req;
+	if (!fotg210->ep0_req)
+		return -ENOMEM;
 
 	fotg210_init(fotg210);
 
-- 
2.14.1

