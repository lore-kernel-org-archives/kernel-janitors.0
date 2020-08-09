From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 09 Aug 2020 07:29:48 +0000
Subject: [PATCH] usb: gadget: tegra-xudc: Avoid GFP_ATOMIC where it is not needed
Message-Id: <20200809072948.743269-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, nkristam@nvidia.com, yuehaibing@huawei.com, heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to use GFP_ATOMIC here. It is a probe function, no
spinlock is taken.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index d6ff68c06911..9aa4815c1c59 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3733,7 +3733,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	unsigned int i;
 	int err;
 
-	xudc = devm_kzalloc(&pdev->dev, sizeof(*xudc), GFP_ATOMIC);
+	xudc = devm_kzalloc(&pdev->dev, sizeof(*xudc), GFP_KERNEL);
 	if (!xudc)
 		return -ENOMEM;
 
-- 
2.25.1
