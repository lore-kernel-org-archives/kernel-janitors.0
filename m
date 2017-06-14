From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 10:41:52 +0000
Subject: [PATCH net-next] net/mlxfw: fix a NULL dereference
Message-Id: <20170614104152.GM29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yotam Gigi <yotamg@mellanox.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If we hit this error path we end up returning ERR_PTR(0) which is NULL.
The caller is not expecting that so it results in a NULL dereference.

Fixes: 410ed13cae39 ("Add the mlxfw module for Mellanox firmware flash process")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c b/drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c
index 628150d28061..993cb5ba934e 100644
--- a/drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c
+++ b/drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c
@@ -594,6 +594,7 @@ struct mlxfw_mfa2_component *
 	if (memcmp(comp_data->buff, mlxfw_mfa2_comp_magic,
 		   mlxfw_mfa2_comp_magic_len) != 0) {
 		pr_err("Component has wrong magic\n");
+		err = -EINVAL;
 		goto err_out;
 	}
 
