From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 09:15:56 +0000
Subject: [PATCH] IB/mlx5: Fix a warning message
Message-Id: <20170614091556.GF29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matan Barak <matanb@mellanox.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Leon Romanovsky <leonro@mellanox.com>, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

"umem" is a valid pointer.  We intended to print "*umem" instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 763bb5b36144..86af54b0e414 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -825,7 +825,7 @@ static int mr_umem_get(struct ib_pd *pd, u64 start, u64 length,
 			    access_flags, 0);
 	err = PTR_ERR_OR_ZERO(*umem);
 	if (err < 0) {
-		mlx5_ib_err(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
+		mlx5_ib_err(dev, "umem get failed (%ld)\n", PTR_ERR(*umem));
 		return err;
 	}
 
