From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:02:24 +0000
Subject: [PATCH 1/7] mtd: docg3: drop dead code
Message-Id: <1425117750-22298-2-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: Joe Perches <joe@perches.com>, Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

If no devices were found, we would already have skipped over this code.

Detected by Coverity, CID #744270

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/docg3.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 448ce42f951e..01eddea1f0d9 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2079,8 +2079,6 @@ static int __init docg3_probe(struct platform_device *pdev)
 	ret = doc_register_sysfs(pdev, cascade);
 	if (ret)
 		goto err_probe;
-	if (!found)
-		goto notfound;
 
 	platform_set_drvdata(pdev, cascade);
 	doc_dbg_register(cascade->floors[0]->priv);
-- 
2.1.0

