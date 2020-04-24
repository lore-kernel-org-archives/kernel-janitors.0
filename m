From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Apr 2020 10:42:35 +0000
Subject: [PATCH] staging: wfx: check ssidlen and prevent an array overflow
Message-Id: <20200424104235.GA416402@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

We need to cap "ssidlen" to prevent a memcpy() overflow.

Fixes: 40115bbc40e2 ("staging: wfx: implement the rest of mac80211 API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/wfx/sta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
index c73dbb3a0de8c..3bff0f1e3d9ba 100644
--- a/drivers/staging/wfx/sta.c
+++ b/drivers/staging/wfx/sta.c
@@ -479,7 +479,9 @@ static void wfx_do_join(struct wfx_vif *wvif)
 		ssidie = ieee80211_bss_get_ie(bss, WLAN_EID_SSID);
 	if (ssidie) {
 		ssidlen = ssidie[1];
-		memcpy(ssid, &ssidie[2], ssidie[1]);
+		if (ssidlen > IEEE80211_MAX_SSID_LEN)
+			ssidlen = IEEE80211_MAX_SSID_LEN;
+		memcpy(ssid, &ssidie[2], ssidlen);
 	}
 	rcu_read_unlock();
 
-- 
2.26.1
