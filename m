From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Mar 2017 09:01:45 +0000
Subject: [patch] mtd: nand: hynix: Fix an error code in init
Message-Id: <20170322090145.GA14520@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

We should be return -ENOMEM instead of success.

Fixes: 626994e07480 ("mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
index 2a5d0efea498..b12dc7325378 100644
--- a/drivers/mtd/nand/nand_hynix.c
+++ b/drivers/mtd/nand/nand_hynix.c
@@ -270,8 +270,10 @@ static int hynix_mlc_1xnm_rr_init(struct nand_chip *chip,
 		goto out;
 
 	rr = kzalloc(sizeof(*rr) + (nregs * nmodes), GFP_KERNEL);
-	if (!rr)
+	if (!rr) {
+		ret = -ENOMEM;
 		goto out;
+	}
 
 	for (i = 0; i < nmodes; i++) {
 		for (j = 0; j < nregs; j++) {
