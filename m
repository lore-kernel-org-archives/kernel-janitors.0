From: Colin King <colin.king@canonical.com>
Date: Thu, 04 May 2017 12:11:00 +0000
Subject: [PATCH] mtd: nand: make nand_ooblayout_lp_hamming_ops static
Message-Id: <20170504121100.2709-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

nand_ooblayout_lp_hamming_ops can be made static as it does not need to be
in global scope.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d474378ed810..d3a735012b81 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -202,7 +202,7 @@ static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
+static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
 	.ecc = nand_ooblayout_ecc_lp_hamming,
 	.free = nand_ooblayout_free_lp_hamming,
 };
-- 
2.11.0

