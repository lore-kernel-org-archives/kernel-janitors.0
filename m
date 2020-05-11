From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 May 2020 18:37:42 +0000
Subject: [PATCH] RDMA/rxe: Return -EFAULT if copy_from_user() fails
Message-Id: <20200511183742.GB225608@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhu Yanjun <yanjunz@mellanox.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

This function used to always return -EINVAL but we updated it to try
preserve the error codes.  Unfortunately the copy_to_user() is returning
the number of bytes remaining to be copied instead of a negative error
code.

Fixes: a3a974b4654d ("RDMA/rxe: Always return ERR_PTR from rxe_create_mmap_info()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/sw/rxe/rxe_queue.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_queue.c b/drivers/infiniband/sw/rxe/rxe_queue.c
index fef2ab5112de5..245040c3a35d0 100644
--- a/drivers/infiniband/sw/rxe/rxe_queue.c
+++ b/drivers/infiniband/sw/rxe/rxe_queue.c
@@ -50,9 +50,10 @@ int do_mmap_info(struct rxe_dev *rxe, struct mminfo __user *outbuf,
 			goto err1;
 		}
 
-		err = copy_to_user(outbuf, &ip->info, sizeof(ip->info));
-		if (err)
+		if (copy_to_user(outbuf, &ip->info, sizeof(ip->info))) {
+			err = -EFAULT;
 			goto err2;
+		}
 
 		spin_lock_bh(&rxe->pending_lock);
 		list_add(&ip->pending_mmaps, &rxe->pending_mmaps);
-- 
2.26.2
