From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Apr 2017 05:12:20 +0000
Subject: [PATCH] ath9k: off by one in ath9k_hw_nvram_read_array()
Message-Id: <20170406051220.GA23650@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Gabor Juhos <juhosg@openwrt.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The > should be >= or we read one space beyond the end of the array.

Fixes: ab5c4f71d8c7 ("ath9k: allow to load EEPROM content via firmware API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath9k/eeprom.c b/drivers/net/wireless/ath/ath9k/eeprom.c
index fb80ec86e53d..6ccf24814514 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom.c
+++ b/drivers/net/wireless/ath/ath9k/eeprom.c
@@ -112,7 +112,7 @@ void ath9k_hw_usb_gen_fill_eeprom(struct ath_hw *ah, u16 *eep_data,
 static bool ath9k_hw_nvram_read_array(u16 *blob, size_t blob_size,
 				      off_t offset, u16 *data)
 {
-	if (offset > blob_size)
+	if (offset >= blob_size)
 		return false;
 
 	*data =  blob[offset];
