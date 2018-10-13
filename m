From: Colin King <colin.king@canonical.com>
Date: Sat, 13 Oct 2018 15:48:25 +0000
Subject: [PATCH] qed: fix spelling mistake "Ireelevant" -> "Irrelevant"
Message-Id: <20181013154825.6285-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DP_INFO message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_int.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_int.c b/drivers/net/ethernet/qlogic/qed/qed_int.c
index af3a28ec04eb..0f0aba793352 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_int.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_int.c
@@ -228,7 +228,7 @@ static int qed_grc_attn_cb(struct qed_hwfn *p_hwfn)
 		attn_master_to_str(GET_FIELD(tmp, QED_GRC_ATTENTION_MASTER)),
 		GET_FIELD(tmp2, QED_GRC_ATTENTION_PF),
 		(GET_FIELD(tmp2, QED_GRC_ATTENTION_PRIV) =
-		 QED_GRC_ATTENTION_PRIV_VF) ? "VF" : "(Ireelevant)",
+		 QED_GRC_ATTENTION_PRIV_VF) ? "VF" : "(Irrelevant)",
 		GET_FIELD(tmp2, QED_GRC_ATTENTION_VF));
 
 out:
-- 
2.17.1
