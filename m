From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Apr 2017 13:36:02 +0000
Subject: [PATCH] NFC: trf7970a: fix check of clock frequencies, use && instead of ||
Message-Id: <20170424133603.3697-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geoff Lansberry <geoff@kuvee.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The "or" condition (clk_freq != TRF7970A_27MHZ_CLOCK_FREQUENCY) ||
(clk_freq != TRF7970A_13MHZ_CLOCK_FREQUE) will always be true because
clk_freq cannot be equal to two different values at the same time. Use
the  && operator instead of || to fix this.

Detected by CoverityScan, CID#1430468 ("Constant expression result")

Fixes: 837eb4d21ecde7 ("NFC: trf7970a: add device tree option for 27MHz clock")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nfc/trf7970a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 2d1c8ca6e679..00eb6cd2b22f 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2071,8 +2071,8 @@ static int trf7970a_probe(struct spi_device *spi)
 	}
 
 	of_property_read_u32(np, "clock-frequency", &clk_freq);
-	if ((clk_freq != TRF7970A_27MHZ_CLOCK_FREQUENCY) ||
-		(clk_freq != TRF7970A_13MHZ_CLOCK_FREQUENCY)) {
+	if ((clk_freq != TRF7970A_27MHZ_CLOCK_FREQUENCY) &&
+		(clk_freq != TRF7970A_13MHZ_CLOCK_FREQUENCY)) {
 		dev_err(trf->dev,
 			"clock-frequency (%u Hz) unsupported\n",
 			clk_freq);
-- 
2.11.0

