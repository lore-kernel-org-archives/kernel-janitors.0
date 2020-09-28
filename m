From: Colin King <colin.king@canonical.com>
Date: Mon, 28 Sep 2020 12:30:42 +0000
Subject: [PATCH][next] spi: hisi-sfc-v3xx: fix spelling mistake "occured" -> "occurred"
Message-Id: <20200928123042.125359-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Garry <john.garry@huawei.com>, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/spi/spi-hisi-sfc-v3xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
index 46454dc2d109..4650b483a33d 100644
--- a/drivers/spi/spi-hisi-sfc-v3xx.c
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -121,7 +121,7 @@ static int hisi_sfc_v3xx_handle_completion(struct hisi_sfc_v3xx_host *host)
 	 * happens, we regard it as an unsupported error here.
 	 */
 	if (!(reg & HISI_SFC_V3XX_INT_MASK_CPLT)) {
-		dev_err(host->dev, "unsupported error occured, status=0x%x\n", reg);
+		dev_err(host->dev, "unsupported error occurred, status=0x%x\n", reg);
 		return -EIO;
 	}
 
-- 
2.27.0
