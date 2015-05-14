From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 May 2015 08:37:50 +0000
Subject: [patch] rndis_wlan: harmless issue calling set_bit()
Message-Id: <20150514083750.GD1665@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jussi Kivilinna <jussi.kivilinna@iki.fi>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>

These are used like:

	set_bit(WORK_LINK_UP, &priv->work_pending);

The problem is that set_bit() takes the actual bit number and not a mask
so static checkers get upset.  It doesn't affect run time because we do
it consistently, but we may as well clean it up.

Fixes: 6010ce07a66c ('rndis_wlan: do link-down state change in worker thread')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/rndis_wlan.c b/drivers/net/wireless/rndis_wlan.c
index d72ff8e..96175a7 100644
--- a/drivers/net/wireless/rndis_wlan.c
+++ b/drivers/net/wireless/rndis_wlan.c
@@ -356,9 +356,9 @@ struct ndis_80211_pmkid {
 #define CAP_MODE_80211G		4
 #define CAP_MODE_MASK		7
 
-#define WORK_LINK_UP		(1<<0)
-#define WORK_LINK_DOWN		(1<<1)
-#define WORK_SET_MULTICAST_LIST	(1<<2)
+#define WORK_LINK_UP		0
+#define WORK_LINK_DOWN		1
+#define WORK_SET_MULTICAST_LIST	2
 
 #define RNDIS_WLAN_ALG_NONE	0
 #define RNDIS_WLAN_ALG_WEP	(1<<0)
