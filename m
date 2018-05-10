From: Colin King <colin.king@canonical.com>
Date: Thu, 10 May 2018 14:03:27 +0000
Subject: [PATCH] qed: fix spelling mistake: "taskelt" -> "tasklet"
Message-Id: <20180510140327.15991-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DP_VERBOSE message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_main.c b/drivers/net/ethernet/qlogic/qed/qed_main.c
index 70bc5634675c..9feed3b79cd4 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_main.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_main.c
@@ -680,7 +680,7 @@ static int qed_nic_stop(struct qed_dev *cdev)
 			tasklet_disable(p_hwfn->sp_dpc);
 			p_hwfn->b_sp_dpc_enabled = false;
 			DP_VERBOSE(cdev, NETIF_MSG_IFDOWN,
-				   "Disabled sp taskelt [hwfn %d] at %p\n",
+				   "Disabled sp tasklet [hwfn %d] at %p\n",
 				   i, p_hwfn->sp_dpc);
 		}
 	}
-- 
2.17.0

