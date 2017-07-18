From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Jul 2017 13:03:59 +0000
Subject: [PATCH 2/3][staging-next] staging: pi433: Make functions rf69_set_bandwidth_intern static
Message-Id: <20170718130400.25436-2-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718130400.25436-1-colin.king@canonical.com>
In-Reply-To: <20170718130400.25436-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function rf69_set_bandwidth_intern is local to the source
and do not need to be in global scope, so make it static. Also
break overly wide line.

Cleans up sparse warning:
symbol 'update_share_count' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/pi433/rf69.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index e391ce777bc7..04af906476e3 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -433,7 +433,8 @@ int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPer
 	return rf69_set_dc_cut_off_frequency_intern(spi, REG_AFCBW, dccPercent);
 }
 
-int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg, enum mantisse mantisse, u8 exponent)
+static int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg,
+				     enum mantisse mantisse, u8 exponent)
 {
 	u8 newValue;
 
-- 
2.11.0

