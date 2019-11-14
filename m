From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Nov 2019 09:54:30 +0000
Subject: [PATCH] staging: rtl8192u: fix indentation issue
Message-Id: <20191114095430.132120-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a block of statements that are indented
too deeply, remove the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r819xU_cmdpkt.c | 25 ++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192u/r819xU_cmdpkt.c b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
index e064f43fd8b6..bc98cdaf61ec 100644
--- a/drivers/staging/rtl8192u/r819xU_cmdpkt.c
+++ b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
@@ -169,19 +169,20 @@ static void cmdpkt_beacontimerinterrupt_819xusb(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
 	u16 tx_rate;
-		/* 87B have to S/W beacon for DTM encryption_cmn. */
-		if (priv->ieee80211->current_network.mode = IEEE_A ||
-		    priv->ieee80211->current_network.mode = IEEE_N_5G ||
-		    (priv->ieee80211->current_network.mode = IEEE_N_24G &&
-		     (!priv->ieee80211->pHTInfo->bCurSuppCCK))) {
-			tx_rate = 60;
-			DMESG("send beacon frame  tx rate is 6Mbpm\n");
-		} else {
-			tx_rate = 10;
-			DMESG("send beacon frame  tx rate is 1Mbpm\n");
-		}
 
-		rtl819xusb_beacon_tx(dev, tx_rate); /* HW Beacon */
+	/* 87B have to S/W beacon for DTM encryption_cmn. */
+	if (priv->ieee80211->current_network.mode = IEEE_A ||
+	    priv->ieee80211->current_network.mode = IEEE_N_5G ||
+	    (priv->ieee80211->current_network.mode = IEEE_N_24G &&
+	     (!priv->ieee80211->pHTInfo->bCurSuppCCK))) {
+		tx_rate = 60;
+		DMESG("send beacon frame  tx rate is 6Mbpm\n");
+	} else {
+		tx_rate = 10;
+		DMESG("send beacon frame  tx rate is 1Mbpm\n");
+	}
+
+	rtl819xusb_beacon_tx(dev, tx_rate); /* HW Beacon */
 }
 
 /*-----------------------------------------------------------------------------
-- 
2.20.1
