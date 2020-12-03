From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 08:39:48 +0000
Subject: [PATCH] mtd: rawnand: meson: Fix a resource leak in init
Message-Id: <X8ikVCnUsfTpffFB@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liang Yang <liang.yang@amlogic.com>
Cc: kernel-janitors@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Yixun Lan <yixun.lan@amlogic.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>

Call clk_disable_unprepare(nfc->phase_rx) if the clk_set_rate() function
fails to avoid a resource leak.

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index a76afea6ea77..817bddccb775 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1044,9 +1044,12 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 
 	ret = clk_set_rate(nfc->device_clk, 24000000);
 	if (ret)
-		goto err_phase_rx;
+		goto err_disable_rx;
 
 	return 0;
+
+err_disable_rx:
+	clk_disable_unprepare(nfc->phase_rx);
 err_phase_rx:
 	clk_disable_unprepare(nfc->phase_tx);
 err_phase_tx:
-- 
2.29.2
