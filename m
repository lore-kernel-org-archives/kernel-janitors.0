From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Sep 2019 09:23:05 +0000
Subject: [PATCH v2] ethernet: gemini: Use devm_platform_ioremap_resource() in gemini_ethernet_probe()
Message-Id: <bd860b05-f493-20e6-083d-66ef3cb61f60@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af65355e-c2f8-9142-4d0b-6903f23a98b2@web.de>
 <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
In-Reply-To: <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, Radhey Shyam Pandey <radheys@xilinx.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 10:52:56 +0200

Simplify this function implementation by using the wrapper function
“devm_platform_ioremap_resource” instead of calling the functions
“platform_get_resource” and “devm_ioremap_resource” directly.

* Thus reduce also a bit of exception handling code here.
* Delete the local variable “res”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Further changes were requested by Radhey Shyam Pandey.

https://lore.kernel.org/r/CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com/



* Updates for three modules were split into
 a separate patch for each driver.
* The commit description was adjusted.



 drivers/net/ethernet/cortina/gemini.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index e736ce2c58ca..f009415ee4d8 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -2549,17 +2549,13 @@ static int gemini_ethernet_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gemini_ethernet *geth;
 	unsigned int retry = 5;
-	struct resource *res;
 	u32 val;

 	/* Global registers */
 	geth = devm_kzalloc(dev, sizeof(*geth), GFP_KERNEL);
 	if (!geth)
 		return -ENOMEM;
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-	geth->base = devm_ioremap_resource(dev, res);
+	geth->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(geth->base))
 		return PTR_ERR(geth->base);
 	geth->dev = dev;
--
2.23.0
