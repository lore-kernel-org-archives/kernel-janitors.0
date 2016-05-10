From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 May 2016 19:20:37 +0000
Subject: [patch] airo: prevent potential underflow in airo_set_freq()
Message-Id: <20160510192037.GB30712@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Ondrej Zary <linux@rainbow-software.org>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Felipe Balbi <felipe.balbi@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

I'm not sure if this can underflow but Smatch complains.  It seems
harmless to add a check for negatives.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/cisco/airo.c b/drivers/net/wireless/cisco/airo.c
index 55456f7..ca3cd21 100644
--- a/drivers/net/wireless/cisco/airo.c
+++ b/drivers/net/wireless/cisco/airo.c
@@ -5794,7 +5794,7 @@ static int airo_set_freq(struct net_device *dev,
 		fwrq->m = ieee80211_frequency_to_channel(f);
 	}
 	/* Setting by channel number */
-	if((fwrq->m > 1000) || (fwrq->e > 0))
+	if (fwrq->m < 0 || fwrq->m > 1000 || fwrq->e > 0)
 		rc = -EOPNOTSUPP;
 	else {
 		int channel = fwrq->m;
