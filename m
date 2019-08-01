From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 01 Aug 2019 08:32:42 +0000
Subject: [PATCH 2/2] powerpc/xive: Add a check for memory allocation failure
Message-Id: <cc53462734dfeaf15b6bad0e626b483de18656b4.1564647619.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564647619.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1564647619.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, allison@lohutok.net, tglx@linutronix.de, clg@kaod.org, groug@kaod.org
Cc: kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

The result of this kzalloc is not checked. Add a check and corresponding
error handling code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Note that 'xive_irq_bitmap_add()' failures are not handled in
'xive_spapr_init()'
I guess that it is not really an issue. This function is _init, so if a
memory allocation occures here, it is likely that the system will
already be in bad shape.
Anyway, the check added here would at least keep the data linked in
'xive_irq_bitmaps' usable.
---
 arch/powerpc/sysdev/xive/spapr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index b4f5eb9e0f82..52198131c75e 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -53,6 +53,10 @@ static int xive_irq_bitmap_add(int base, int count)
 	xibm->base = base;
 	xibm->count = count;
 	xibm->bitmap = kzalloc(xibm->count, GFP_KERNEL);
+	if (!xibm->bitmap) {
+		kfree(xibm);
+		return -ENOMEM;
+	}
 	list_add(&xibm->list, &xive_irq_bitmaps);
 
 	pr_info("Using IRQ range [%x-%x]", xibm->base,
-- 
2.20.1
