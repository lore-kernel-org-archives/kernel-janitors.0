From: Colin King <colin.king@canonical.com>
Date: Tue, 29 May 2018 09:14:12 +0000
Subject: [PATCH] mac80211_hwsim: add error check to call to rhashtable_init
Message-Id: <20180529091412.8530-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to rhashtable_init is missing an error return check, it is
possible for this to fail various different ways, so fix this by adding
an error check.

Detected by: CoverityScan, CID#1469446 ("Unchecked return value")

Fixes: c6509cc3b3e8 ("mac80211_hwsim: add hashtable with mac address keys for faster lookup")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/mac80211_hwsim.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mac80211_hwsim.c b/drivers/net/wireless/mac80211_hwsim.c
index 89fc22520d40..f4b4f5690b16 100644
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@ -3573,7 +3573,9 @@ static int __init init_mac80211_hwsim(void)
 	hwsim_wq = alloc_workqueue("hwsim_wq", 0, 0);
 	if (!hwsim_wq)
 		return -ENOMEM;
-	rhashtable_init(&hwsim_radios_rht, &hwsim_rht_params);
+	err = rhashtable_init(&hwsim_radios_rht, &hwsim_rht_params);
+	if (err)
+		return err;
 
 	err = register_pernet_device(&hwsim_net_ops);
 	if (err)
-- 
2.17.0

