From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Fri, 03 Jun 2011 03:24:06 +0000
Subject: [PATCH 5/5 v2] iwlegacy: add missing null check
Message-Id: <1307071446-28730-1-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110603030746.GA4834@joana>
In-Reply-To: <20110603030746.GA4834@joana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sgruszka@redhat.com, linville@tuxdriver.com
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>

lq_sta has other null checks in this function.
assuming they are correct, this additional null check
should be added too.

Incorporating suggestion from Gustavo Padovan.

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 drivers/net/wireless/iwlegacy/iwl-4965-rs.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/iwlegacy/iwl-4965-rs.c b/drivers/net/wireless/iwlegacy/iwl-4965-rs.c
index 24d1499..9b65153 100644
--- a/drivers/net/wireless/iwlegacy/iwl-4965-rs.c
+++ b/drivers/net/wireless/iwlegacy/iwl-4965-rs.c
@@ -2275,6 +2275,9 @@ iwl4965_rs_get_rate(void *priv_r, struct ieee80211_sta *sta, void *priv_sta,
 	if (rate_control_send_low(sta, priv_sta, txrc))
 		return;
 
+	if (!lq_sta)
+		return;
+
 	rate_idx  = lq_sta->last_txrate_idx;
 
 	if (lq_sta->last_rate_n_flags & RATE_MCS_HT_MSK) {
-- 
1.7.2.5

