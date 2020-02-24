From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Feb 2020 15:21:01 +0000
Subject: [PATCH][next] net/mlxfw: fix spelling mistake: "progamming" -> "programming"
Message-Id: <20200224152101.361648-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlxsw@mellanox.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlxfw/mlxfw_fsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxfw/mlxfw_fsm.c b/drivers/net/ethernet/mellanox/mlxfw/mlxfw_fsm.c
index c7e882eb8f35..046a0cb82ed8 100644
--- a/drivers/net/ethernet/mellanox/mlxfw/mlxfw_fsm.c
+++ b/drivers/net/ethernet/mellanox/mlxfw/mlxfw_fsm.c
@@ -150,7 +150,7 @@ mlxfw_fsm_reactivate_err(struct mlxfw_dev *mlxfw_dev,
 		MLXFW_REACT_ERR("device reset required", err);
 		break;
 	case MLXFW_FSM_REACTIVATE_STATUS_ERR_FW_PROGRAMMING_NEEDED:
-		MLXFW_REACT_ERR("fw progamming needed", err);
+		MLXFW_REACT_ERR("fw programming needed", err);
 		break;
 	case MLXFW_FSM_REACTIVATE_STATUS_FW_ALREADY_ACTIVATED:
 		MLXFW_REACT_ERR("fw already activated", err);
-- 
2.25.0
