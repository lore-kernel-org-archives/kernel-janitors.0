From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 04 Feb 2020 02:24:41 +0000
Subject: [PATCH net-next] qed: Remove set but not used variable 'p_link'
Message-Id: <20200204022442.109809-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538030706-138186-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538030706-138186-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, Michal Kalderon <michal.kalderon@marvell.com>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, GR-everest-linux-l2@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/qlogic/qed/qed_cxt.c: In function 'qed_qm_init_pf':
drivers/net/ethernet/qlogic/qed/qed_cxt.c:1401:29: warning:
 variable 'p_link' set but not used [-Wunused-but-set-variable]

commit 92fae6fb231f ("qed: FW 8.42.2.0 Queue Manager changes")
leave behind this unused variable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/qlogic/qed/qed_cxt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_cxt.c b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
index fbfff2b1dc93..1a636bad717d 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_cxt.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
@@ -1398,14 +1398,11 @@ void qed_qm_init_pf(struct qed_hwfn *p_hwfn,
 {
 	struct qed_qm_info *qm_info = &p_hwfn->qm_info;
 	struct qed_qm_pf_rt_init_params params;
-	struct qed_mcp_link_state *p_link;
 	struct qed_qm_iids iids;
 
 	memset(&iids, 0, sizeof(iids));
 	qed_cxt_qm_iids(p_hwfn, &iids);
 
-	p_link = &QED_LEADING_HWFN(p_hwfn->cdev)->mcp_info->link_output;
-
 	memset(&params, 0, sizeof(params));
 	params.port_id = p_hwfn->port_id;
 	params.pf_id = p_hwfn->rel_pf_id;
