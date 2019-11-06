From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 Nov 2019 14:52:31 +0000
Subject: [PATCH net-next] mlxsw: spectrum: Fix error return code in mlxsw_sp_port_module_info_init()
Message-Id: <20191106145231.39128-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 4a7f970f1240 ("mlxsw: spectrum: Replace port_to_module array with array of structs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
index ea4cc2aa99e0..838c014f6ed1 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
@@ -4079,8 +4079,10 @@ static int mlxsw_sp_port_module_info_init(struct mlxsw_sp *mlxsw_sp)
 		mlxsw_sp->port_mapping[i] = kmemdup(&port_mapping,
 						    sizeof(port_mapping),
 						    GFP_KERNEL);
-		if (!mlxsw_sp->port_mapping[i])
+		if (!mlxsw_sp->port_mapping[i]) {
+			err = -ENOMEM;
 			goto err_port_module_info_dup;
+		}
 	}
 	return 0;
