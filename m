From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Sep 2011 07:17:04 +0000
Subject: [patch] Staging: rtl8192e: off by one in rtl8192_get_channel_map()
Message-Id: <20110921071704.GI4999@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

COUNTRY_CODE_MAX is not a valid country code.  We're off by one here.
This gets passed to Dot11d_Channelmap() where it's used as an offset
into the ChannelPlan[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl_core.c
index 6530058..1beb04f 100644
--- a/drivers/staging/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl_core.c
@@ -1308,7 +1308,7 @@ static short rtl8192_get_channel_map(struct net_device *dev)
 		return -1;
 	}
 
-	if (priv->ChannelPlan > COUNTRY_CODE_MAX) {
+	if (priv->ChannelPlan >= COUNTRY_CODE_MAX) {
 		printk(KERN_INFO "rtl819x_init:Error channel plan! Set to "
 		       "default.\n");
 		priv->ChannelPlan = COUNTRY_CODE_FCC;
