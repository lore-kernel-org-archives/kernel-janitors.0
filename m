From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 30 Dec 2015 11:20:49 +0000
Subject: [PATCH] iwlegacy: 4965-mac: constify il_sensitivity_ranges structure
Message-Id: <1451474449-17912-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislaw Gruszka <sgruszka@redhat.com>
Cc: kernel-janitors@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

The il_sensitivity_ranges is never modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/wireless/intel/iwlegacy/4965-mac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/4965-mac.c b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
index 6656215..fd38aa0 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
@@ -6416,7 +6416,7 @@ il4965_hw_detect(struct il_priv *il)
 	D_INFO("HW Revision ID = 0x%X\n", il->rev_id);
 }
 
-static struct il_sensitivity_ranges il4965_sensitivity = {
+static const struct il_sensitivity_ranges il4965_sensitivity = {
 	.min_nrg_cck = 97,
 	.max_nrg_cck = 0,	/* not used, set to 0 */
 

