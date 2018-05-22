From: Colin King <colin.king@canonical.com>
Date: Tue, 22 May 2018 08:37:28 +0000
Subject: [PATCH] net/mlx4: fix spelling mistake: "Inrerface" -> "Interface"
Message-Id: <20180522083728.5874-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816090511.10463-1-colin.king@canonical.com>
In-Reply-To: <20170816090511.10463-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tariq Toukan <tariqt@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in mlx4_dbg debug message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx4/intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/intf.c b/drivers/net/ethernet/mellanox/mlx4/intf.c
index 2edcce98ab2d..6bd4103265d2 100644
--- a/drivers/net/ethernet/mellanox/mlx4/intf.c
+++ b/drivers/net/ethernet/mellanox/mlx4/intf.c
@@ -172,7 +172,7 @@ int mlx4_do_bond(struct mlx4_dev *dev, bool enable)
 		list_add_tail(&dev_ctx->list, &priv->ctx_list);
 		spin_unlock_irqrestore(&priv->ctx_lock, flags);
 
-		mlx4_dbg(dev, "Inrerface for protocol %d restarted with when bonded mode is %s\n",
+		mlx4_dbg(dev, "Interface for protocol %d restarted with when bonded mode is %s\n",
 			 dev_ctx->intf->protocol, enable ?
 			 "enabled" : "disabled");
 	}
-- 
2.17.0

