From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Aug 2016 11:13:12 +0000
Subject: [PATCH 5/5] powerpc-MSI-HSTA: Move three assignments in hsta_msi_probe()
Message-Id: <4fd422ec-6133-65dd-0a0c-e8613fd4820d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <fe8faf9e-01bb-4f3e-8258-ecb37ba15c9f@users.sourceforge.net>
In-Reply-To: <fe8faf9e-01bb-4f3e-8258-ecb37ba15c9f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Adam Buchbinder <adam.buchbinder@gmail.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Scott Wood <scottwood@freescale.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Aug 2016 11:30:48 +0200

Move the assignments for three data structure members to the end
so that they will only be performed if the desired resource allocations
succeeded by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/sysdev/ppc4xx_hsta_msi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/ppc4xx_hsta_msi.c b/arch/powerpc/sysdev/ppc4xx_hsta_msi.c
index 3097ddd..57014ce 100644
--- a/arch/powerpc/sysdev/ppc4xx_hsta_msi.c
+++ b/arch/powerpc/sysdev/ppc4xx_hsta_msi.c
@@ -143,10 +143,7 @@ static int hsta_msi_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ppc4xx_hsta_msi.dev = dev;
-	ppc4xx_hsta_msi.address = mem->start;
 	ppc4xx_hsta_msi.data = ioremap(mem->start, resource_size(mem));
-	ppc4xx_hsta_msi.irq_count = irq_count;
 	if (!ppc4xx_hsta_msi.data) {
 		dev_err(dev, "Unable to map memory\n");
 		return -ENOMEM;
@@ -179,6 +176,10 @@ static int hsta_msi_probe(struct platform_device *pdev)
 		phb->controller_ops.setup_msi_irqs = hsta_setup_msi_irqs;
 		phb->controller_ops.teardown_msi_irqs = hsta_teardown_msi_irqs;
 	}
+
+	ppc4xx_hsta_msi.dev = dev;
+	ppc4xx_hsta_msi.address = mem->start;
+	ppc4xx_hsta_msi.irq_count = irq_count;
 	return 0;
  free_irq_map:
 	kfree(ppc4xx_hsta_msi.irq_map);
-- 
2.9.3

