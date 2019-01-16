From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Jan 2019 17:25:33 +0000
Subject: [PATCH] libertas: fix indentation issue
Message-Id: <20190116172533.22972-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is incorrectly indented, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/marvell/libertas_tf/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/libertas_tf/main.c b/drivers/net/wireless/marvell/libertas_tf/main.c
index 1d45da187b9b..a7cb7d06e5e6 100644
--- a/drivers/net/wireless/marvell/libertas_tf/main.c
+++ b/drivers/net/wireless/marvell/libertas_tf/main.c
@@ -676,7 +676,7 @@ int lbtf_remove_card(struct lbtf_private *priv)
 	ieee80211_unregister_hw(hw);
 	ieee80211_free_hw(hw);
 
-    lbtf_deb_leave(LBTF_DEB_MAIN);
+	lbtf_deb_leave(LBTF_DEB_MAIN);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(lbtf_remove_card);
-- 
2.19.1
