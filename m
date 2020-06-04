From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Jun 2020 14:39:02 +0000
Subject: [PATCH][next] RDMA/mlx5: remove duplicated assignment to resp.response_length
Message-Id: <20200604143902.56021-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507151610.52636-1-colin.king@canonical.com>
In-Reply-To: <20200507151610.52636-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment to resp.response_length is never read since it is being
updated again on the next statement. The assignment is redundant so
removed it.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/mlx5/qp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/qp.c b/drivers/infiniband/hw/mlx5/qp.c
index 81bf6b975e0e..d61ca85033de 100644
--- a/drivers/infiniband/hw/mlx5/qp.c
+++ b/drivers/infiniband/hw/mlx5/qp.c
@@ -4162,8 +4162,6 @@ static int mlx5_ib_modify_dct(struct ib_qp *ibqp, struct ib_qp_attr *attr,
 
 		if (udata->outlen < min_resp_len)
 			return -EINVAL;
-		resp.response_length = min_resp_len;
-
 		/*
 		 * If we don't have enough space for the ECE options,
 		 * simply indicate it with resp.response_length.
-- 
2.25.1
