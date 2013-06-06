From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Jun 2013 07:43:00 +0000
Subject: [patch] cw1200: read beyond end of array in debug code
Message-Id: <20130606074300.GB12953@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solomon Peachy <pizza@shaftnet.org>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This has only one caller and rates[] is an array with
IEEE80211_TX_MAX_RATES (4) elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/cw1200/txrx.c b/drivers/net/wireless/cw1200/txrx.c
index 0e40890..a254747 100644
--- a/drivers/net/wireless/cw1200/txrx.c
+++ b/drivers/net/wireless/cw1200/txrx.c
@@ -190,13 +190,12 @@ static void tx_policy_build(const struct cw1200_common *priv,
 		policy->retry_count += retries;
 	}
 
-	pr_debug("[TX policy] Policy (%zu): %d:%d, %d:%d, %d:%d, %d:%d, %d:%d\n",
+	pr_debug("[TX policy] Policy (%zu): %d:%d, %d:%d, %d:%d, %d:%d\n",
 		 count,
 		 rates[0].idx, rates[0].count,
 		 rates[1].idx, rates[1].count,
 		 rates[2].idx, rates[2].count,
-		 rates[3].idx, rates[3].count,
-		 rates[4].idx, rates[4].count);
+		 rates[3].idx, rates[3].count);
 }
 
 static inline bool tx_policy_is_equal(const struct tx_policy *wanted,
