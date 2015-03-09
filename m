From: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 09 Mar 2015 17:18:16 +0000
Subject: [PATCH v2 1/7] mtd: docg3: drop dead code
Message-Id: <20150309171816.GR18140@ld-irv-0074>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
 <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

If no devices were found, we would already have skipped over this code.

Detected by Coverity, CID #744270

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
v2: kill 'found' entirely

 drivers/mtd/devices/docg3.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 448ce42f951e..0310f9174dcc 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2033,7 +2033,7 @@ static int __init docg3_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	struct resource *ress;
 	void __iomem *base;
-	int ret, floor, found = 0;
+	int ret, floor;
 	struct docg3_cascade *cascade;
 
 	ret = -ENXIO;
@@ -2073,14 +2073,11 @@ static int __init docg3_probe(struct platform_device *pdev)
 						0);
 		if (ret)
 			goto err_probe;
-		found++;
 	}
 
 	ret = doc_register_sysfs(pdev, cascade);
 	if (ret)
 		goto err_probe;
-	if (!found)
-		goto notfound;
 
 	platform_set_drvdata(pdev, cascade);
 	doc_dbg_register(cascade->floors[0]->priv);
-- 
1.9.1

