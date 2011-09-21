From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Sep 2011 07:13:56 +0000
Subject: [patch 2/2] mwifiex: remove unneeded NULL check
Message-Id: <20110921071356.GG4999@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We dereference "rate" on the lines before so the checks here are too
late to help.  This function is only called from
mwifiex_dump_station_info() and "rate" is always a non-NULL pointer
so the check can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/mwifiex/sta_ioctl.c b/drivers/net/wireless/mwifiex/sta_ioctl.c
index 215c65a..1df5ef6 100644
--- a/drivers/net/wireless/mwifiex/sta_ioctl.c
+++ b/drivers/net/wireless/mwifiex/sta_ioctl.c
@@ -868,10 +868,10 @@ int mwifiex_drv_get_data_rate(struct mwifiex_private *priv,
 	ret = mwifiex_rate_ioctl_cfg(priv, rate);
 
 	if (!ret) {
-		if (rate && rate->is_rate_auto)
+		if (rate->is_rate_auto)
 			rate->rate = mwifiex_index_to_data_rate(priv->tx_rate,
 							priv->tx_htinfo);
-		else if (rate)
+		else
 			rate->rate = priv->data_rate;
 	} else {
 		ret = -1;
