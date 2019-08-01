From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 01 Aug 2019 08:32:31 +0000
Subject: [PATCH 1/2] powerpc/xive: Use GFP_KERNEL instead of GFP_ATOMIC in 'xive_irq_bitmap_add()'
Message-Id: <85d5d247ce753befd6aa63c473f7823de6520ccd.1564647619.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564647619.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1564647619.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, allison@lohutok.net, tglx@linutronix.de, clg@kaod.org, groug@kaod.org
Cc: kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

There is no need to use GFP_ATOMIC here. GFP_KERNEL should be enough.
GFP_KERNEL is also already used for another allocation just a few lines
below.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/sysdev/xive/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 8ef9cf4ebb1c..b4f5eb9e0f82 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -45,7 +45,7 @@ static int xive_irq_bitmap_add(int base, int count)
 {
 	struct xive_irq_bitmap *xibm;
 
-	xibm = kzalloc(sizeof(*xibm), GFP_ATOMIC);
+	xibm = kzalloc(sizeof(*xibm), GFP_KERNEL);
 	if (!xibm)
 		return -ENOMEM;
 
-- 
2.20.1
