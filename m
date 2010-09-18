From: Dan Carpenter <error27@gmail.com>
Date: Sat, 18 Sep 2010 23:42:25 +0000
Subject: [patch -next] rds: signedness bug
Message-Id: <20100918234224.GC6236@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Grover <andy.grover@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In the original code if the copy_from_user() fails in rds_rdma_pages()
then the error handling fails and we get a stack trace from kmalloc().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/rds/rdma.c b/net/rds/rdma.c
index 4806467..1a41deb 100644
--- a/net/rds/rdma.c
+++ b/net/rds/rdma.c
@@ -522,7 +522,7 @@ int rds_cmsg_rdma_args(struct rds_sock *rs, struct rds_message *rm,
 	struct rds_rdma_args *args;
 	struct rds_iovec vec;
 	struct rm_rdma_op *op = &rm->rdma;
-	unsigned int nr_pages;
+	int nr_pages;
 	unsigned int nr_bytes;
 	struct page **pages = NULL;
 	struct rds_iovec __user *local_vec;
