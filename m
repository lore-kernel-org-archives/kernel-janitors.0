From: Colin King <colin.king@canonical.com>
Date: Sun, 05 Apr 2020 13:49:14 +0000
Subject: [PATCH] qed: remove redundant assignment to variable 'rc'
Message-Id: <20200405134914.382716-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190531132738.17221-1-colin.king@canonical.com>
In-Reply-To: <20190531132738.17221-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable 'rc' is being assigned a value that is never read
and it is being updated later with a new value. The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_l2.c b/drivers/net/ethernet/qlogic/qed/qed_l2.c
index 1a5fc2ae351c..29810a1aa210 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_l2.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_l2.c
@@ -369,8 +369,8 @@ int qed_sp_eth_vport_start(struct qed_hwfn *p_hwfn,
 	struct qed_spq_entry *p_ent =  NULL;
 	struct qed_sp_init_data init_data;
 	u8 abs_vport_id = 0;
-	int rc = -EINVAL;
 	u16 rx_mode = 0;
+	int rc;
 
 	rc = qed_fw_vport(p_hwfn, p_params->vport_id, &abs_vport_id);
 	if (rc)
-- 
2.25.1
