From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Aug 2016 05:35:25 +0000
Subject: [patch] powerpc/fsl_rio: fix a missing error code
Message-Id: <20160804053525.GM775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Alexandre Bounine <alexandre.bounine@idt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

We should set the error code here.  Otherwise static checkers complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index 984e816..68e7c0d 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -491,6 +491,7 @@ int fsl_rio_setup(struct platform_device *dev)
 	rmu_node = of_parse_phandle(dev->dev.of_node, "fsl,srio-rmu-handle", 0);
 	if (!rmu_node) {
 		dev_err(&dev->dev, "No valid fsl,srio-rmu-handle property\n");
+		rc = -ENOENT;
 		goto err_rmu;
 	}
 	rc = of_address_to_resource(rmu_node, 0, &rmu_regs);
