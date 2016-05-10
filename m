From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 May 2016 19:21:17 +0000
Subject: [patch] atmel: potential underflow in atmel_set_freq()
Message-Id: <20160510192117.GC30712@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Kelley <simon@thekelleys.org.uk>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that we cap the upper bound of "fwrq->m" but not the
lower bound.  I don't know if it can actually happen but it's simple
enough to check for negatives.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/atmel/atmel.c b/drivers/net/wireless/atmel/atmel.c
index 8f8f37f..bf2e9a0 100644
--- a/drivers/net/wireless/atmel/atmel.c
+++ b/drivers/net/wireless/atmel/atmel.c
@@ -2275,7 +2275,7 @@ static int atmel_set_freq(struct net_device *dev,
 		fwrq->m = ieee80211_frequency_to_channel(f);
 	}
 	/* Setting by channel number */
-	if ((fwrq->m > 1000) || (fwrq->e > 0))
+	if (fwrq->m < 0 || fwrq->m > 1000 || fwrq->e > 0)
 		rc = -EOPNOTSUPP;
 	else {
 		int channel = fwrq->m;
