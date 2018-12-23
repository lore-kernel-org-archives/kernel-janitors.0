From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:57:11 +0000
Subject: [PATCH 16/20] mlxsw: spectrum: drop useless LIST_HEAD
Message-Id: <1545555435-24576-17-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: kernel-janitors@vger.kernel.org, Ido Schimmel <idosch@mellanox.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares is never used.

The uses were removed in 244cd96adb5f ("net_sched: remove
list_head from tc_action"), but not the declaration.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: 244cd96adb5f ("net_sched: remove list_head from tc_action")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 drivers/net/ethernet/mellanox/mlxsw/spectrum.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
index c742a581f0d0..eed1045e4d96 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
@@ -1347,7 +1347,6 @@ static int mlxsw_sp_port_add_cls_matchall(struct mlxsw_sp_port *mlxsw_sp_port,
 	struct mlxsw_sp_port_mall_tc_entry *mall_tc_entry;
 	__be16 protocol = f->common.protocol;
 	const struct tc_action *a;
-	LIST_HEAD(actions);
 	int err;
 
 	if (!tcf_exts_has_one_action(f->exts)) {
