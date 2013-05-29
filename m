From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2013 08:12:18 +0000
Subject: [patch] Staging: rtl8192e: fix an endian bug
Message-Id: <20130529081136.GA12950@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Passing the high bits of "ratr_value" to rtl8192_config_rate() only
works on little endian systems.  We should be passing a u16 value.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index a9d78e9..50c7bb7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -2128,10 +2128,11 @@ void rtl8192_update_ratr_table(struct net_device *dev)
 	struct rtllib_device *ieee = priv->rtllib;
 	u8 *pMcsRate = ieee->dot11HTOperationalRateSet;
 	u32 ratr_value = 0;
+	u16 rate_config = 0;
 	u8 rate_index = 0;
 
-	rtl8192_config_rate(dev, (u16 *)(&ratr_value));
-	ratr_value |= (*(u16 *)(pMcsRate)) << 12;
+	rtl8192_config_rate(dev, &rate_config);
+	ratr_value = rate_config | *pMcsRate << 12;
 	switch (ieee->mode) {
 	case IEEE_A:
 		ratr_value &= 0x00000FF0;
