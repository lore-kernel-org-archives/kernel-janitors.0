From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 12 Jan 2018 21:44:32 +0000
Subject: [PATCH 3/4] usb: gadget: fotg210-udc: Simplify code
Message-Id: <5e33abfcfc7dc0c75fb5714b0cf5819cff72203d.1515791144.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org, bhumirks@gmail.com, leoyang.li@nxp.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use 'devm_kzalloc()' and 'devm_ioremap()' to simplify code.

While at it, turn some '= NULL' into shorter '!' when testing memory
allocation failure.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index a4d46b9759be..99a18b14c8c2 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -1065,11 +1065,8 @@ static int fotg210_udc_remove(struct platform_device *pdev)
 	struct fotg210_udc *fotg210 = platform_get_drvdata(pdev);
 
 	usb_del_gadget_udc(&fotg210->gadget);
-	iounmap(fotg210->reg);
 	free_irq(platform_get_irq(pdev, 0), fotg210);
-
 	fotg210_ep_free_request(&fotg210->ep[0]->ep, fotg210->ep0_req);
-	kfree(fotg210);
 
 	return 0;
 }
@@ -1096,21 +1093,22 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 	ret = -ENOMEM;
 
 	/* initialize udc */
-	fotg210 = kzalloc(sizeof(struct fotg210_udc), GFP_KERNEL);
-	if (fotg210 = NULL)
-		goto err_alloc;
+	fotg210 = devm_kzalloc(&pdev->dev, sizeof(struct fotg210_udc),
+			       GFP_KERNEL);
+	if (!fotg210)
+		return -ENOMEM;
 
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++) {
 		fotg210->ep[i] = devm_kzalloc(&pdev->dev,
 					sizeof(struct fotg210_ep), GFP_KERNEL);
 		if (!fotg210->ep[i])
-			goto err_alloc;
+			return -ENOMEM;
 	}
 
-	fotg210->reg = ioremap(res->start, resource_size(res));
-	if (fotg210->reg = NULL) {
+	fotg210->reg = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!fotg210->reg) {
 		pr_err("ioremap error.\n");
-		goto err_map;
+		return -ENOMEM;
 	}
 
 	spin_lock_init(&fotg210->lock);
@@ -1185,13 +1183,6 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 err_req:
 	fotg210_ep_free_request(&fotg210->ep[0]->ep, fotg210->ep0_req);
 
-err_map:
-	if (fotg210->reg)
-		iounmap(fotg210->reg);
-
-err_alloc:
-	kfree(fotg210);
-
 	return ret;
 }
 
-- 
2.14.1

