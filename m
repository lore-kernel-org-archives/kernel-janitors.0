From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Feb 2017 17:47:51 +0000
Subject: [PATCH] wcn36xx: Fix error handling
Message-Id: <20170219174751.18966-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: k.eugene.e@gmail.com, kvalo@codeaurora.org
Cc: wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reorder 'out_free_dxe_pool' and 'out_free_dxe_ctl' error handling labels
in order to match the way resources have been allocated.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/wcn36xx/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index cee4f655bf36..6436235bc265 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -337,10 +337,10 @@ static int wcn36xx_start(struct ieee80211_hw *hw)
 	wcn36xx_smd_stop(wcn);
 out_free_smd_buf:
 	kfree(wcn->hal_buf);
-out_free_dxe_pool:
-	wcn36xx_dxe_free_mem_pools(wcn);
 out_free_dxe_ctl:
 	wcn36xx_dxe_free_ctl_blks(wcn);
+out_free_dxe_pool:
+	wcn36xx_dxe_free_mem_pools(wcn);
 out_smd_close:
 	wcn36xx_smd_close(wcn);
 out_err:
-- 
2.9.3

