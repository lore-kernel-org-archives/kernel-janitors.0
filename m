From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Jun 2017 09:33:27 +0000
Subject: [PATCH] mfd: rtsx: make arrays depth and cd_mask static const
Message-Id: <20170630093327.8595-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays depath and cd_mask on the stack but make
them static const.  Makes the object code smaller:

   text    data     bss     dec     hex filename
  25413    7216     448   33077    8135 drivers/mfd/rtsx_pcr.o

   text    data     bss     dec     hex filename
  25151    7360     448   32959    80bf drivers/mfd/rtsx_pcr.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mfd/rtsx_pcr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/rtsx_pcr.c b/drivers/mfd/rtsx_pcr.c
index a0ac89dfdf0f..3cf69e5c5703 100644
--- a/drivers/mfd/rtsx_pcr.c
+++ b/drivers/mfd/rtsx_pcr.c
@@ -644,7 +644,7 @@ int rtsx_pci_switch_clock(struct rtsx_pcr *pcr, unsigned int card_clock,
 {
 	int err, clk;
 	u8 n, clk_divider, mcu_cnt, div;
-	u8 depth[] = {
+	static const u8 depth[] = {
 		[RTSX_SSC_DEPTH_4M] = SSC_DEPTH_4M,
 		[RTSX_SSC_DEPTH_2M] = SSC_DEPTH_2M,
 		[RTSX_SSC_DEPTH_1M] = SSC_DEPTH_1M,
@@ -768,7 +768,7 @@ EXPORT_SYMBOL_GPL(rtsx_pci_card_power_off);
 
 int rtsx_pci_card_exclusive_check(struct rtsx_pcr *pcr, int card)
 {
-	unsigned int cd_mask[] = {
+	static const unsigned int cd_mask[] = {
 		[RTSX_SD_CARD] = SD_EXIST,
 		[RTSX_MS_CARD] = MS_EXIST
 	};
-- 
2.11.0

