From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 27 Aug 2019 08:26:43 +0000
Subject: [PATCH 1/2] powerpc/82xx: Delete an unnecessary of_node_put() call in pq2ads_pci_init_irq()
Message-Id: <9c060a41-438b-6fb8-d549-37c72fae4898@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
In-Reply-To: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Enrico Weigelt <lkml@metux.net>, Kate Stewart <kstewart@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 08:44:20 +0200

A null pointer would be passed to a call of the function “of_node_put”
immediately after a call of the function “of_find_compatible_node” failed
at one place.
Remove this superfluous function call.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
index 096cc0d59fd8..6cc054db7043 100644
--- a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
+++ b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
@@ -123,7 +123,6 @@ int __init pq2ads_pci_init_irq(void)
 	np = of_find_compatible_node(NULL, NULL, "fsl,pq2ads-pci-pic");
 	if (!np) {
 		printk(KERN_ERR "No pci pic node in device tree.\n");
-		of_node_put(np);
 		goto out;
 	}

--
2.23.0
