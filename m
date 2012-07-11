From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Jul 2012 08:58:38 +0000
Subject: [PATCH] drivers/mtd/devices/spear_smi.c: failure test for null rather than negative integer
Message-Id: <1341997118-25042-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Stefan Roese <sr@denx.de>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

dev_get_platdata returns a pointer, so the failure value would be NULL
rather than a negative integer.

The semantic match that finds this problem is: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,e;
statement S1,S2;
@@

*x = dev_get_platdata(...)
... when != x = e
*if (x < 0) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/devices/spear_smi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index b85f183..7c10466 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -935,7 +935,7 @@ static int __devinit spear_smi_probe(struct platform_device *pdev)
 		}
 	} else {
 		pdata = dev_get_platdata(&pdev->dev);
-		if (pdata < 0) {
+		if (!pdata) {
 			ret = -ENODEV;
 			dev_err(&pdev->dev, "no platform data\n");
 			goto err;

