From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Fri, 03 Jun 2011 02:06:07 +0000
Subject: [PATCH 2/5] iwlegacy: remove unecessary if statement
Message-Id: <1307066770-27309-2-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1307066770-27309-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1307066770-27309-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sgruszka@redhat.com, linville@tuxdriver.com
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>

the code always returns ret regardless, so if(ret) check is unecessary.
Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 drivers/net/wireless/iwlegacy/iwl-4965.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/iwlegacy/iwl-4965.c b/drivers/net/wireless/iwlegacy/iwl-4965.c
index f5433c7..ffda05c 100644
--- a/drivers/net/wireless/iwlegacy/iwl-4965.c
+++ b/drivers/net/wireless/iwlegacy/iwl-4965.c
@@ -1185,8 +1185,6 @@ static int iwl4965_send_rxon_assoc(struct iwl_priv *priv,
 
 	ret = iwl_legacy_send_cmd_pdu_async(priv, REPLY_RXON_ASSOC,
 				     sizeof(rxon_assoc), &rxon_assoc, NULL);
-	if (ret)
-		return ret;
 
 	return ret;
 }
-- 
1.7.2.5

