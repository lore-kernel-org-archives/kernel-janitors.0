From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Aug 2016 11:10:05 +0000
Subject: [PATCH 3/5] powerpc-MSI-HSTA: Use kmalloc_array() in hsta_msi_probe()
Message-Id: <0c2c17e0-aed2-4b66-371d-fada59cd0861@users.sourceforge.net>
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
Date: Mon, 29 Aug 2016 11:20:39 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/sysdev/ppc4xx_hsta_msi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/ppc4xx_hsta_msi.c b/arch/powerpc/sysdev/ppc4xx_hsta_msi.c
index 52a93dc..691db9a 100644
--- a/arch/powerpc/sysdev/ppc4xx_hsta_msi.c
+++ b/arch/powerpc/sysdev/ppc4xx_hsta_msi.c
@@ -156,7 +156,9 @@ static int hsta_msi_probe(struct platform_device *pdev)
 	if (ret)
 		goto out;
 
-	ppc4xx_hsta_msi.irq_map = kmalloc(sizeof(int) * irq_count, GFP_KERNEL);
+	ppc4xx_hsta_msi.irq_map = kmalloc_array(irq_count,
+						sizeof(*ppc4xx_hsta_msi.irq_map),
+						GFP_KERNEL);
 	if (!ppc4xx_hsta_msi.irq_map) {
 		ret = -ENOMEM;
 		goto out1;
-- 
2.9.3

