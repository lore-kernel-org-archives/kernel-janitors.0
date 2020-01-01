From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 17:49:44 +0000
Subject: [PATCH 04/10] fsl/fman: use resource_size
Message-Id: <1577900990-8588-5-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Madalin Bucur <madalin.bucur@nxp.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource ptr; @@
- (ptr.end + 1 - ptr.start)
+ resource_size(&ptr)

@@ struct resource *ptr; @@
- (ptr->end + 1 - ptr->start)
+ resource_size(ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/net/ethernet/freescale/fman/mac.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index f0806ace1ae2..55f2122c3217 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -692,7 +692,7 @@ static int mac_probe(struct platform_device *_of_dev)
 
 	mac_dev->res = __devm_request_region(dev,
 					     fman_get_mem_region(priv->fman),
-					     res.start, res.end + 1 - res.start,
+					     res.start, resource_size(&res),
 					     "mac");
 	if (!mac_dev->res) {
 		dev_err(dev, "__devm_request_mem_region(mac) failed\n");
@@ -701,7 +701,7 @@ static int mac_probe(struct platform_device *_of_dev)
 	}
 
 	priv->vaddr = devm_ioremap(dev, mac_dev->res->start,
-				   mac_dev->res->end + 1 - mac_dev->res->start);
+				   resource_size(mac_dev->res));
 	if (!priv->vaddr) {
 		dev_err(dev, "devm_ioremap() failed\n");
 		err = -EIO;
