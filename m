From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Jun 2017 18:12:19 +0000
Subject: [PATCH] mmc: rtsx_usb_sdmmc: make array 'width' static const
Message-Id: <20170629181219.12837-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mmc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

array width is on-stack and not modified and should be
made static const.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index 12d2fbe9c520..76da1687ab37 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -909,7 +909,7 @@ static int sd_set_bus_width(struct rtsx_usb_sdmmc *host,
 		unsigned char bus_width)
 {
 	int err = 0;
-	u8 width[] = {
+	static const u8 width[] = {
 		[MMC_BUS_WIDTH_1] = SD_BUS_WIDTH_1BIT,
 		[MMC_BUS_WIDTH_4] = SD_BUS_WIDTH_4BIT,
 		[MMC_BUS_WIDTH_8] = SD_BUS_WIDTH_8BIT,
-- 
2.11.0

