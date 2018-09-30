From: Colin King <colin.king@canonical.com>
Date: Sun, 30 Sep 2018 22:38:09 +0000
Subject: [PATCH] ipw2x00: clean up clang warning on extraneous parentheses
Message-Id: <20180930223809.18136-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are extraneous parantheses that are causing clang to produce a
warning so remove these.

Clean up clang warning:
equality comparison with extraneous parentheses [-Wparentheses-equality]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
index 9644e7b93645..bbdca13c5a9f 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
@@ -5652,7 +5652,7 @@ static void ipw_merge_adhoc_network(struct work_struct *work)
 		}
 
 		mutex_lock(&priv->mutex);
-		if ((priv->ieee->iw_mode = IW_MODE_ADHOC)) {
+		if (priv->ieee->iw_mode = IW_MODE_ADHOC) {
 			IPW_DEBUG_MERGE("remove network %*pE\n",
 					priv->essid_len, priv->essid);
 			ipw_remove_current_network(priv);
-- 
2.17.1
