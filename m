From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Oct 2012 18:04:26 +0000
Subject: [patch] ar5523: make buffer size variable unsigned
Message-Id: <20121030180425.GA17127@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pontus Fuchs <pontus.fuchs@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

A negative buffer size doesn't make sense and it breaks this check in
ar5523_get_max_rxsz():

	if (!ar->rxbufsz || ar->rxbufsz > AR5523_SANE_RXBUFSZ) { ...

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ar5523/ar5523.h b/drivers/net/wireless/ath/ar5523/ar5523.h
index 6086ba3..00c6fd3 100644
--- a/drivers/net/wireless/ath/ar5523/ar5523.h
+++ b/drivers/net/wireless/ath/ar5523/ar5523.h
@@ -122,7 +122,7 @@ struct ar5523 {
 
 	struct work_struct	rx_refill_work;
 
-	int			rxbufsz;
+	unsigned int		rxbufsz;
 	u8			serial[16];
 
 	struct ieee80211_channel channels[14];
