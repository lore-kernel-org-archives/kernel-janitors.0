From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Jun 2017 10:47:40 +0000
Subject: [PATCH][net-next] net/mlxfw: remove redundant goto on error check
Message-Id: <20170606104740.15712-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yotam Gigi <yotamg@mellanox.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check to see of err is set and the subsequent goto is extraneous
as the next statement is where the goto is jumping to. Remove this
redundant check and goto.

Detected by CoverityScan, CID#1437734 ("Identical code for
different branches")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c b/drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c
index 7e9589061d30..628150d28061 100644
--- a/drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c
+++ b/drivers/net/ethernet/mellanox/mlxfw/mlxfw_mfa2.c
@@ -492,8 +492,6 @@ static int mlxfw_mfa2_file_cb_offset_xz(const struct mlxfw_mfa2_file *mfa2_file,
 	dec_buf.out_pos = 0;
 	dec_buf.out_size = size;
 	err = mlxfw_mfa2_xz_dec_run(xz_dec, &dec_buf, &finished);
-	if (err)
-		goto out;
 out:
 	xz_dec_end(xz_dec);
 	return err;
-- 
2.11.0

