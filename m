From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 12 Jan 2018 21:44:31 +0000
Subject: [PATCH 2/4] usb: gadget: fotg210-udc: Fix a memory leak
Message-Id: <74fd44ce7000aa0da44c1004ff08c75060a48b70.1515791144.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org, bhumirks@gmail.com, leoyang.li@nxp.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The memory referenced by the 'fotg210->ep[]' array, is never freed.
So there is a memory leak in the error handling path of the probe function
and when the driver is unloaded.
Use 'devm_kzalloc()' to fix these leaks.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 2fea32a153b7..a4d46b9759be 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -1101,7 +1101,8 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 		goto err_alloc;
 
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++) {
-		fotg210->ep[i] = kzalloc(sizeof(struct fotg210_ep), GFP_KERNEL);
+		fotg210->ep[i] = devm_kzalloc(&pdev->dev,
+					sizeof(struct fotg210_ep), GFP_KERNEL);
 		if (!fotg210->ep[i])
 			goto err_alloc;
 	}
-- 
2.14.1

