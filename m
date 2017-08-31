From: Colin King <colin.king@canonical.com>
Date: Thu, 31 Aug 2017 11:40:15 +0000
Subject: [PATCH] staging: rts5208: rename mmc_ddr_tunning_rx_cmd to mmc_ddr_tuning_rx_cmd
Message-Id: <20170831114015.26330-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wayne Porter <wporter82@gmail.com>, Jia-Ju Bai <baijiaju1990@163.com>, Rehas Sachdeva <aquannie@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Gaurav Pathak <gauravpathak129@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trival fix to spelling mistake in function name

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rts5208/sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index b1fd0a10d065..4033a2cf7ac9 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -1654,7 +1654,7 @@ static int sd_ddr_tuning_rx_cmd(struct rtsx_chip *chip, u8 sample_point)
 	return STATUS_SUCCESS;
 }
 
-static int mmc_ddr_tunning_rx_cmd(struct rtsx_chip *chip, u8 sample_point)
+static int mmc_ddr_tuning_rx_cmd(struct rtsx_chip *chip, u8 sample_point)
 {
 	struct sd_info *sd_card = &chip->sd_card;
 	int retval;
@@ -1933,7 +1933,7 @@ static int sd_tuning_rx(struct rtsx_chip *chip)
 
 	} else {
 		if (CHK_MMC_DDR52(sd_card)) {
-			tuning_cmd = mmc_ddr_tunning_rx_cmd;
+			tuning_cmd = mmc_ddr_tuning_rx_cmd;
 		} else {
 			rtsx_trace(chip);
 			return STATUS_FAIL;
-- 
2.14.1

