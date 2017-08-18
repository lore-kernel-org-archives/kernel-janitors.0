From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Aug 2017 13:34:16 +0000
Subject: [PATCH] staging/rts5208: fix incorrect shift to extract upper nybble
Message-Id: <20170818133416.16329-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wayne Porter <wporter82@gmail.com>, Namrata A Shettar <namrataashettar@gmail.com>, Jonas Rickert <jrickertkc@gmail.com>, Louie Lu <louie.lu@hopebaytech.com>, Daniel Micay <danielmicay@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The mask of sns_key_info1 suggests the upper nybble is being extracted
however the following shift of 8 bits is too large and always results in
0.  Fix this by shifting only by 4 bits to correctly get the upper nybble.

Detected by CoverityScan, CID#142891 ("Operands don't affect result")

Fixes: fa590c222fba ("staging: rts5208: add support for rts5208 and rts5288")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rts5208/rtsx_scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
index 36b5a11f21d2..a401b13f5f5e 100644
--- a/drivers/staging/rts5208/rtsx_scsi.c
+++ b/drivers/staging/rts5208/rtsx_scsi.c
@@ -414,7 +414,7 @@ void set_sense_data(struct rtsx_chip *chip, unsigned int lun, u8 err_code,
 	sense->ascq = ascq;
 	if (sns_key_info0 != 0) {
 		sense->sns_key_info[0] = SKSV | sns_key_info0;
-		sense->sns_key_info[1] = (sns_key_info1 & 0xf0) >> 8;
+		sense->sns_key_info[1] = (sns_key_info1 & 0xf0) >> 4;
 		sense->sns_key_info[2] = sns_key_info1 & 0x0f;
 	}
 }
-- 
2.11.0

