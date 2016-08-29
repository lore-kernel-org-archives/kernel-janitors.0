From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Aug 2016 11:09:08 +0000
Subject: [PATCH 2/5] powerpc-MSI: Use kmalloc_array() in ppc4xx_setup_msi_irqs()
Message-Id: <01cf542d-c65e-ff66-6fb0-5ce75af184de@users.sourceforge.net>
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
Date: Mon, 29 Aug 2016 11:11:24 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/sysdev/ppc4xx_msi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/ppc4xx_msi.c b/arch/powerpc/sysdev/ppc4xx_msi.c
index 8fb8061..0bd5e4b 100644
--- a/arch/powerpc/sysdev/ppc4xx_msi.c
+++ b/arch/powerpc/sysdev/ppc4xx_msi.c
@@ -89,7 +89,9 @@ static int ppc4xx_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 	if (type = PCI_CAP_ID_MSIX)
 		pr_debug("ppc4xx msi: MSI-X untested, trying anyway.\n");
 
-	msi_data->msi_virqs = kmalloc((msi_irqs) * sizeof(int), GFP_KERNEL);
+	msi_data->msi_virqs = kmalloc_array(msi_irqs,
+					    sizeof(*msi_data->msi_virqs),
+					    GFP_KERNEL);
 	if (!msi_data->msi_virqs)
 		return -ENOMEM;
 
-- 
2.9.3

