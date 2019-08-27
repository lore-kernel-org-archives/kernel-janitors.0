From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 27 Aug 2019 08:28:18 +0000
Subject: [PATCH 2/2] powerpc/82xx: Use common error handling code in pq2ads_pci_init_irq()
Message-Id: <1a4bafee-562f-5eb4-d2bd-34704f8c5ab3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
In-Reply-To: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Enrico Weigelt <lkml@metux.net>, Kate Stewart <kstewart@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 09:19:32 +0200

Adjust jump targets so that a bit of exception handling can be better
reused at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
index 6cc054db7043..f82f75a6085c 100644
--- a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
+++ b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
@@ -129,13 +129,11 @@ int __init pq2ads_pci_init_irq(void)
 	irq = irq_of_parse_and_map(np, 0);
 	if (!irq) {
 		printk(KERN_ERR "No interrupt in pci pic node.\n");
-		of_node_put(np);
-		goto out;
+		goto out_put_node;
 	}

 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
-		of_node_put(np);
 		ret = -ENOMEM;
 		goto out_unmap_irq;
 	}
@@ -160,17 +158,17 @@ int __init pq2ads_pci_init_irq(void)
 	priv->host = host;
 	irq_set_handler_data(irq, priv);
 	irq_set_chained_handler(irq, pq2ads_pci_irq_demux);
-
-	of_node_put(np);
-	return 0;
+	ret = 0;
+	goto out_put_node;

 out_unmap_regs:
 	iounmap(priv->regs);
 out_free_kmalloc:
 	kfree(priv);
-	of_node_put(np);
 out_unmap_irq:
 	irq_dispose_mapping(irq);
+out_put_node:
+	of_node_put(np);
 out:
 	return ret;
 }
--
2.23.0
