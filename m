From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Aug 2018 11:57:24 +0000
Subject: [PATCH] powerpc: fix size calculation using resource_size()
Message-Id: <20180808115724.gh5mbbi6twzqbqao@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jia Hongtao <B38951@freescale.com>
Cc: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh@kernel.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

The problem is the the calculation should be "end - start + 1" but the
plus one is missing in this calculation.

Fixes: 8626816e905e ("powerpc: add support for MPIC message register API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  Not tested.

diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
index eb69a5186243..280e964e1aa8 100644
--- a/arch/powerpc/sysdev/mpic_msgr.c
+++ b/arch/powerpc/sysdev/mpic_msgr.c
@@ -196,7 +196,7 @@ static int mpic_msgr_probe(struct platform_device *dev)
 
 	/* IO map the message register block. */
 	of_address_to_resource(np, 0, &rsrc);
-	msgr_block_addr = ioremap(rsrc.start, rsrc.end - rsrc.start);
+	msgr_block_addr = ioremap(rsrc.start, resource_size(&rsrc));
 	if (!msgr_block_addr) {
 		dev_err(&dev->dev, "Failed to iomap MPIC message registers");
 		return -EFAULT;
