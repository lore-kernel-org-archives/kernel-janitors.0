From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 14:12:26 +0000
Subject: [PATCH][next] media: cxd2880-spi: fix two memory leaks of dvb_spi
Message-Id: <20181222141226.15775-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two return paths that do not kfree dvb_spi. Fix the memory
leaks by returning via the exit label fail_adapter that will free
dvi_spi.

Detected by CoverityScan, CID#1475991 ("Resource Leak")

Fixes: cb496cd472af ("media: cxd2880-spi: Add optional vcc regulator")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/spi/cxd2880-spi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
index d5c433e20d4a..3499c90dc695 100644
--- a/drivers/media/spi/cxd2880-spi.c
+++ b/drivers/media/spi/cxd2880-spi.c
@@ -522,13 +522,15 @@ cxd2880_spi_probe(struct spi_device *spi)
 
 	dvb_spi->vcc_supply = devm_regulator_get_optional(&spi->dev, "vcc");
 	if (IS_ERR(dvb_spi->vcc_supply)) {
-		if (PTR_ERR(dvb_spi->vcc_supply) = -EPROBE_DEFER)
-			return -EPROBE_DEFER;
+		if (PTR_ERR(dvb_spi->vcc_supply) = -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
+			goto fail_adapter;
+		}
 		dvb_spi->vcc_supply = NULL;
 	} else {
 		ret = regulator_enable(dvb_spi->vcc_supply);
-		if (ret)
-			return ret;
+		if (ret)
+			goto fail_adapter;
 	}
 
 	dvb_spi->spi = spi;
-- 
2.19.1
