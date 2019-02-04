From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Feb 2019 14:10:05 +0000
Subject: [PATCH] soc: fsl: dpio: Use after free in dpaa2_dpio_remove()
Message-Id: <20190204141005.GA915@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roy Pledge <Roy.Pledge@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>

The dpaa2_io_down(priv->io) call frees "priv->io" so I've shifted the
code around a little bit to avoid the use after free.

Fixes: 991e873223e9 ("soc: fsl: dpio: use a cpumask to identify which cpus are unused")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/fsl/dpio/dpio-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index 2d4af32a0dec..a28799b62d53 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -220,12 +220,12 @@ static int dpaa2_dpio_remove(struct fsl_mc_device *dpio_dev)
 
 	dev = &dpio_dev->dev;
 	priv = dev_get_drvdata(dev);
+	cpu = dpaa2_io_get_cpu(priv->io);
 
 	dpaa2_io_down(priv->io);
 
 	dpio_teardown_irqs(dpio_dev);
 
-	cpu = dpaa2_io_get_cpu(priv->io);
 	cpumask_set_cpu(cpu, cpus_unused_mask);
 
 	err = dpio_open(dpio_dev->mc_io, 0, dpio_dev->obj_desc.id,
-- 
2.17.1
