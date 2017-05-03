From: Colin King <colin.king@canonical.com>
Date: Wed, 03 May 2017 14:26:00 +0000
Subject: [PATCH] ath5k: fix memory leak on buf on failed eeprom read
Message-Id: <20170503142600.32609-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, "Luis R . Rodriguez" <mcgrof@do-not-panic.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The AR5K_EEPROM_READ macro returns with -EIO if a read error
occurs causing a memory leak on the allocated buffer buf. Fix
this by explicitly calling ath5k_hw_nvram_read and exiting on
the via the freebuf label that performs the necessary free'ing
of buf when a read error occurs.

Detected by CoverityScan, CID#1248782 ("Resource Leak")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath5k/debug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath5k/debug.c b/drivers/net/wireless/ath/ath5k/debug.c
index d068df520e7a..bd7f6d7b199e 100644
--- a/drivers/net/wireless/ath/ath5k/debug.c
+++ b/drivers/net/wireless/ath/ath5k/debug.c
@@ -938,7 +938,10 @@ static int open_file_eeprom(struct inode *inode, struct file *file)
 	}
 
 	for (i = 0; i < eesize; ++i) {
-		AR5K_EEPROM_READ(i, val);
+		if (!ath5k_hw_nvram_read(ah, i, &val)) {
+			ret = -EIO;
+			goto freebuf;
+		}
 		buf[i] = val;
 	}
 
-- 
2.11.0

