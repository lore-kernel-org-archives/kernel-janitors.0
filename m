From: Julia Lawall <julia@diku.dk>
Date: Wed, 04 Feb 2009 21:43:04 +0000
Subject: [PATCH] arch/powerpc: Eliminate double sizeof
Message-Id: <Pine.LNX.4.64.0902042236200.3091@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: galak@kernel.crashing.org, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Taking sizeof the result of sizeof is quite strange and does not seem to be
what is wanted here.

This was fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E;
@@

- sizeof (
  sizeof (E)
- )

@@
type T;
@@

- sizeof (
  sizeof (T)
- )
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
--- a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
+++ b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
@@ -186,7 +186,7 @@ out_unmap_regs:
 	iounmap(priv->regs);
 out_free_bootmem:
 	free_bootmem((unsigned long)priv,
-	             sizeof(sizeof(struct pq2ads_pci_pic)));
+	             sizeof(struct pq2ads_pci_pic));
 	of_node_put(np);
 out_unmap_irq:
 	irq_dispose_mapping(irq);
