From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 11:26:15 +0000
Subject: [PATCH 03/14] dpaa2-eth: drop double zeroing
Message-Id: <1600601186-7420-4-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: kernel-janitors@vger.kernel.org, Ioana Radulescu <ruxandra.radulescu@nxp.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

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
  (n,sizeof(struct scatterlist),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -607,7 +607,7 @@ static int dpaa2_eth_build_sg_fd(struct
 	if (unlikely(PAGE_SIZE / sizeof(struct scatterlist) < nr_frags + 1))
 		return -EINVAL;
 
-	scl = kcalloc(nr_frags + 1, sizeof(struct scatterlist), GFP_ATOMIC);
+	scl = kmalloc_array(nr_frags + 1, sizeof(struct scatterlist), GFP_ATOMIC);
 	if (unlikely(!scl))
 		return -ENOMEM;
 
