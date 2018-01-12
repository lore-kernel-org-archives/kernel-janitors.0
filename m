From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 12 Jan 2018 21:44:30 +0000
Subject: [PATCH 1/4] usb: gadget: fotg210-udc: Remove a useless
Message-Id: <0c3925c9ee4e56cd819347ab9ec515011b54d0ae.1515791144.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org, bhumirks@gmail.com, leoyang.li@nxp.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to use an intermediate array for these memory allocations,
so, axe it.

While at it, turn a '= NULL' into a shorter '!' when testing memory
allocation failure.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 53a48f561458..2fea32a153b7 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -1078,7 +1078,6 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 {
 	struct resource *res, *ires;
 	struct fotg210_udc *fotg210 = NULL;
-	struct fotg210_ep *_ep[FOTG210_MAX_NUM_EP];
 	int ret = 0;
 	int i;
 
@@ -1102,10 +1101,9 @@ static int fotg210_udc_probe(struct platform_device *pdev)
 		goto err_alloc;
 
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++) {
-		_ep[i] = kzalloc(sizeof(struct fotg210_ep), GFP_KERNEL);
-		if (_ep[i] = NULL)
+		fotg210->ep[i] = kzalloc(sizeof(struct fotg210_ep), GFP_KERNEL);
+		if (!fotg210->ep[i])
 			goto err_alloc;
-		fotg210->ep[i] = _ep[i];
 	}
 
 	fotg210->reg = ioremap(res->start, resource_size(res));
-- 
2.14.1

