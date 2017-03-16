From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Mar 2017 23:21:45 +0000
Subject: [PATCH] staging: wilc1000: fix incorrect copy of pmkid data
Message-Id: <20170316232145.7704-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aditya Shankar <aditya.shankar@microchip.com>, Ganesh Krishna <ganesh.krishna@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pmkid data is meant be be copied to the previous item in the
pmkidlist, however the code is just copying the data to itself because
the src index into pmkidlist is the same as the dst index into pmkidlist.
Fix this with i + 1 instead of i.

Detected by CoverityScan,CID#13339465 ("Overlapping buffer in memory copy")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
index a37896f..4034f40 100644
--- a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
+++ b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
@@ -1346,7 +1346,7 @@ static int del_pmksa(struct wiphy *wiphy, struct net_device *netdev,
 			       priv->pmkid_list.pmkidlist[i + 1].bssid,
 			       ETH_ALEN);
 			memcpy(priv->pmkid_list.pmkidlist[i].pmkid,
-			       priv->pmkid_list.pmkidlist[i].pmkid,
+			       priv->pmkid_list.pmkidlist[i + 1].pmkid,
 			       PMKID_LEN);
 		}
 		priv->pmkid_list.numpmkid--;
-- 
2.10.2

