From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 08 Dec 2017 21:11:05 +0000
Subject: [PATCH 2/2] mtd: onenand: samsung: return an error if 'mtd_device_parse_register()' fails
Message-Id: <ef95e7cafe155e80f80808072d84456dd9bbd712.1512765898.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kyungmin.park@samsung.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'mtd_device_parse_register()' fails, we still return 0 which mean
success.
Return the error code instead, as done in all the other error handling
paths.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/mtd/onenand/samsung.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 04039b967d59..5410e654d3cf 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -987,6 +987,10 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	err = mtd_device_parse_register(mtd, NULL, NULL,
 					pdata ? pdata->parts : NULL,
 					pdata ? pdata->nr_parts : 0);
+	if (err) {
+		dev_err(&pdev->dev, "failed to parse partitions and register the MTD device\n");
+		return err;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
-- 
2.14.1

