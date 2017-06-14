From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 10:20:09 +0000
Subject: [PATCH v2] IB/mlx5: Fix a warning message
Message-Id: <20170614102009.GA5171@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAAKD3BDGH1STMhcCgz=K6-8EtnGGOYkx7KPS+iPidUiuLmpjNw@mail.gmail.com>
In-Reply-To: <CAAKD3BDGH1STMhcCgz=K6-8EtnGGOYkx7KPS+iPidUiuLmpjNw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

"umem" is a valid pointer.  We intended to print "*umem" or even just
"err" instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: style change

diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 763bb5b36144..2c89757b0223 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -825,7 +825,7 @@ static int mr_umem_get(struct ib_pd *pd, u64 start, u64 length,
 			    access_flags, 0);
 	err = PTR_ERR_OR_ZERO(*umem);
 	if (err < 0) {
-		mlx5_ib_err(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
+		mlx5_ib_err(dev, "umem get failed (%d)\n", err);
 		return err;
 	}
 
