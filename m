From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 11:26:19 +0000
Subject: [PATCH 07/14] RDS: drop double zeroing
Message-Id: <1600601186-7420-8-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, linux-kernel@vger.kernel.org

sg_init_table zeroes its first argument, so the allocation of that argument
doesn't have to.

the semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,n,flags;
@@

x = 
- kcalloc
+ kmalloc_array
  (n,sizeof(*x),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 net/rds/rdma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/net/rds/rdma.c b/net/rds/rdma.c
--- a/net/rds/rdma.c
+++ b/net/rds/rdma.c
@@ -269,7 +269,7 @@ static int __rds_rdma_map(struct rds_soc
 		goto out;
 	} else {
 		nents = ret;
-		sg = kcalloc(nents, sizeof(*sg), GFP_KERNEL);
+		sg = kmalloc_array(nents, sizeof(*sg), GFP_KERNEL);
 		if (!sg) {
 			ret = -ENOMEM;
 			goto out;
