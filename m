From: Colin King <colin.king@canonical.com>
Date: Tue, 29 Jan 2019 10:57:57 +0000
Subject: [PATCH][next] mtd: rawnand: meson: fix missing assignment of ret on a call to meson_chip_buffer_init
Message-Id: <20190129105757.19138-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liang Yang <liang.yang@amlogic.com>, Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to meson_chip_buffer_init is not assigning ret, however, ret
is being checked for failure. Fix this by adding in the missing assignment.

Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index e858d58d97b0..b9c543d1054c 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1206,7 +1206,7 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
 		dev_err(nfc->dev, "16bits bus width not supported");
 		return -EINVAL;
 	}
-	meson_chip_buffer_init(nand);
+	ret = meson_chip_buffer_init(nand);
 	if (ret)
 		return -ENOMEM;
 
-- 
2.19.1
