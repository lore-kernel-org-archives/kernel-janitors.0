From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Sep 2011 07:13:29 +0000
Subject: [patch 1/2] mwifiex: add a kfree() to an error path
Message-Id: <20110921071329.GF4999@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We're not likely to hit this small memory leak, but lets fix it
anyway to keep the static checkers happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/mwifiex/sta_ioctl.c b/drivers/net/wireless/mwifiex/sta_ioctl.c
index eb569fa..215c65a 100644
--- a/drivers/net/wireless/mwifiex/sta_ioctl.c
+++ b/drivers/net/wireless/mwifiex/sta_ioctl.c
@@ -203,6 +203,7 @@ int mwifiex_bss_start(struct mwifiex_private *priv, struct cfg80211_bss *bss,
 		beacon_ie = kmemdup(bss->information_elements,
 					bss->len_beacon_ies, GFP_KERNEL);
 		if (!beacon_ie) {
+			kfree(bss_desc);
 			dev_err(priv->adapter->dev, " failed to alloc beacon_ie\n");
 			return -ENOMEM;
 		}
