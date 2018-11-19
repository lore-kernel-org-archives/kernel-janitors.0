From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 19 Nov 2018 02:10:41 +0000
Subject: [PATCH -next] Input: olpc_apsp - remove set but not used variable 'np'
Message-Id: <1542593441-169671-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/input/serio/olpc_apsp.c: In function 'olpc_apsp_probe':
drivers/input/serio/olpc_apsp.c:192:22: warning:
 variable 'np' set but not used [-Wunused-but-set-variable]

It never used since intrdduction in commit
b56ece9a3ac3 ("Input: add OLPC AP-SP driver")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/input/serio/olpc_apsp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/serio/olpc_apsp.c b/drivers/input/serio/olpc_apsp.c
index 91d6fb8..b360847 100644
--- a/drivers/input/serio/olpc_apsp.c
+++ b/drivers/input/serio/olpc_apsp.c
@@ -189,14 +189,12 @@ static int olpc_apsp_probe(struct platform_device *pdev)
 	struct serio *kb_serio, *pad_serio;
 	struct olpc_apsp *priv;
 	struct resource *res;
-	struct device_node *np;
 	int error;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(struct olpc_apsp), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	np = pdev->dev.of_node;
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(priv->base)) {
