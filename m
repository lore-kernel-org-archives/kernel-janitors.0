From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Apr 2017 09:19:49 +0000
Subject: [PATCH] mtd: oxnas_nand: Allocating more than necessary in probe()
Message-Id: <20170425091949.uindhaxmbtsksqc7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, linux-oxnas@lists.tuxfamily.org, kernel-janitors@vger.kernel.org

We only need to allocate sizeof(struct oxnas_nand_ctrl) which is 192
bytes and not sizeof(struct nand_chip) which is a much larger 3056
bytes.

Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/oxnas_nand.c b/drivers/mtd/nand/oxnas_nand.c
index 3e3bf3b364d2..1b207aac840c 100644
--- a/drivers/mtd/nand/oxnas_nand.c
+++ b/drivers/mtd/nand/oxnas_nand.c
@@ -91,7 +91,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	oxnas = devm_kzalloc(&pdev->dev, sizeof(struct nand_chip),
+	oxnas = devm_kzalloc(&pdev->dev, sizeof(*oxnas),
 			     GFP_KERNEL);
 	if (!oxnas)
 		return -ENOMEM;
