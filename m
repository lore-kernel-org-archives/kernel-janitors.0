From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Jan 2018 18:04:54 +0000
Subject: [PATCH 5/5] powerpc/4xx: Delete an unnecessary return statement in two functions
Message-Id: <de85bbcd-36a8-7de5-8d18-96e1530a23c2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2b9b4285-f1c0-5dc7-35c6-df901c9ca0eb@users.sourceforge.net>
In-Reply-To: <2b9b4285-f1c0-5dc7-35c6-df901c9ca0eb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Jan 2018 18:40:23 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/4xx/ocm.c | 2 --
 arch/powerpc/platforms/4xx/pci.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/ocm.c b/arch/powerpc/platforms/4xx/ocm.c
index 11418f090bf4..aee5f041ff14 100644
--- a/arch/powerpc/platforms/4xx/ocm.c
+++ b/arch/powerpc/platforms/4xx/ocm.c
@@ -226,8 +226,6 @@ static void __init ocm_init_node(int count, struct device_node *node)
 	INIT_LIST_HEAD(&ocm->c.list);
 
 	ocm->ready = 1;
-
-	return;
 }
 
 static int ocm_debugfs_show(struct seq_file *m, void *v)
diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index 73e6b36bcd51..b73ea8f4be1f 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -1399,7 +1399,6 @@ static void __init ppc_476fpe_pciex_check_link(struct ppc4xx_pciex_port *port)
 		printk(KERN_WARNING "PCIE%d: Link up failed\n", port->index);
 
 	iounmap(mbase);
-	return;
 }
 
 static struct ppc4xx_pciex_hwops ppc_476fpe_pcie_hwops __initdata -- 
2.15.1

