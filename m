From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Fri, 03 Jun 2011 02:06:09 +0000
Subject: [PATCH 4/5] iwlegacy: propagate error return value
Message-Id: <1307066770-27309-4-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1307066770-27309-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1307066770-27309-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sgruszka@redhat.com, linville@tuxdriver.com
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>

propogate the return value from iwl4965_get_tx_atten_grp instead
of implicitly returning -EINVAL in the error case.

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 drivers/net/wireless/iwlegacy/iwl-4965.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/iwlegacy/iwl-4965.c b/drivers/net/wireless/iwlegacy/iwl-4965.c
index 06dcee5..79e7ce6 100644
--- a/drivers/net/wireless/iwlegacy/iwl-4965.c
+++ b/drivers/net/wireless/iwlegacy/iwl-4965.c
@@ -915,7 +915,7 @@ static int iwl4965_fill_txpower_tbl(struct iwl_priv *priv, u8 band, u16 channel,
 	if (txatten_grp < 0) {
 		IWL_ERR(priv, "Can't find txatten group for channel %d.\n",
 			  channel);
-		return -EINVAL;
+		return txatten_grp;
 	}
 
 	IWL_DEBUG_TXPOWER(priv, "channel %d belongs to txatten group %d\n",
-- 
1.7.2.5

