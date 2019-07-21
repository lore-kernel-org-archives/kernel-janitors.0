From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 21:35:33 +0000
Subject: [PATCH] iio: magnetometer: mmc35240: Fix a typo in the name of a constant
Message-Id: <20190721213533.9214-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, tglx@linutronix.de, alexios.zavras@intel.com, gregkh@linuxfoundation.org, kstewart@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Everything is about mmc35240_ except MMC53240_WAIT_SET_RESET (3 and 5
switched).

This is likely a typo. Define and use MMC35240_WAIT_SET_RESET instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iio/magnetometer/mmc35240.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc35240.c b/drivers/iio/magnetometer/mmc35240.c
index 7de10281ad9e..425cdd07b4e5 100644
--- a/drivers/iio/magnetometer/mmc35240.c
+++ b/drivers/iio/magnetometer/mmc35240.c
@@ -53,7 +53,7 @@
 #define MMC35240_CTRL1_BW_SHIFT		0
 
 #define MMC35240_WAIT_CHARGE_PUMP	50000	/* us */
-#define MMC53240_WAIT_SET_RESET		1000	/* us */
+#define MMC35240_WAIT_SET_RESET		1000	/* us */
 
 /*
  * Memsic OTP process code piece is put here for reference:
@@ -225,7 +225,7 @@ static int mmc35240_init(struct mmc35240_data *data)
 	ret = mmc35240_hw_set(data, true);
 	if (ret < 0)
 		return ret;
-	usleep_range(MMC53240_WAIT_SET_RESET, MMC53240_WAIT_SET_RESET + 1);
+	usleep_range(MMC35240_WAIT_SET_RESET, MMC35240_WAIT_SET_RESET + 1);
 
 	ret = mmc35240_hw_set(data, false);
 	if (ret < 0)
-- 
2.20.1
