From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Oct 2017 19:38:07 +0000
Subject: [PATCH 2/2] powerpc/platforms/cell: Improve a size determination in three functions
Message-Id: <cc0eadaa-6089-f01f-a7f5-b8307503b846@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <db9efaf4-f3d7-d5dc-b0b2-f20e418fa3c8@users.sourceforge.net>
In-Reply-To: <db9efaf4-f3d7-d5dc-b0b2-f20e418fa3c8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Oct 2017 21:12:41 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/cell/axon_msi.c          | 2 +-
 arch/powerpc/platforms/cell/spider-pci.c        | 2 +-
 arch/powerpc/platforms/cell/spufs/lscsa_alloc.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index 513d13d779b3..cc4987664841 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -342,7 +342,7 @@ static int axon_msi_probe(struct platform_device *device)
 
 	pr_devel("axon_msi: setting up dn %pOF\n", dn);
 
-	msic = kzalloc(sizeof(struct axon_msic), GFP_KERNEL);
+	msic = kzalloc(sizeof(*msic), GFP_KERNEL);
 	if (!msic)
 		goto out;
 
diff --git a/arch/powerpc/platforms/cell/spider-pci.c b/arch/powerpc/platforms/cell/spider-pci.c
index 0a9f00563144..31919ff00124 100644
--- a/arch/powerpc/platforms/cell/spider-pci.c
+++ b/arch/powerpc/platforms/cell/spider-pci.c
@@ -131,7 +131,7 @@ int __init spiderpci_iowa_init(struct iowa_bus *bus, void *data)
 	pr_debug("SPIDERPCI-IOWA:Bus initialize for spider(%pOF)\n",
 		 np);
 
-	priv = kzalloc(sizeof(struct spiderpci_iowa_private), GFP_KERNEL);
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -1;
 
diff --git a/arch/powerpc/platforms/cell/spufs/lscsa_alloc.c b/arch/powerpc/platforms/cell/spufs/lscsa_alloc.c
index b847e9403566..d9de848dae47 100644
--- a/arch/powerpc/platforms/cell/spufs/lscsa_alloc.c
+++ b/arch/powerpc/platforms/cell/spufs/lscsa_alloc.c
@@ -36,7 +36,7 @@ int spu_alloc_lscsa(struct spu_state *csa)
 	struct spu_lscsa *lscsa;
 	unsigned char *p;
 
-	lscsa = vzalloc(sizeof(struct spu_lscsa));
+	lscsa = vzalloc(sizeof(*lscsa));
 	if (!lscsa)
 		return -ENOMEM;
 	csa->lscsa = lscsa;
-- 
2.14.2

