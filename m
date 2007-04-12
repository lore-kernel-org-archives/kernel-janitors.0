From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Thu, 12 Apr 2007 04:33:50 +0000
Subject: [KJ] [PATCH] ROUND_UP macro cleanup in arch/sh64/kernel/pci_sh5.c
Message-Id: <20070412042150.GA11888@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070401073646.GA11444@arun.site>
In-Reply-To: <20070401073646.GA11444@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, linuxsh-shmedia-dev@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, lethal@linux-sh.org

ROUND_UP macro cleanup, use ALIGN where ever appropriate.

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 pci_sh5.c |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/sh64/kernel/pci_sh5.c b/arch/sh64/kernel/pci_sh5.c
index 9dae689..11d1fef 100644
--- a/arch/sh64/kernel/pci_sh5.c
+++ b/arch/sh64/kernel/pci_sh5.c
@@ -376,8 +376,6 @@ irqreturn_t pcish5_serr_irq(int irq, void *dev_id, struct pt_regs *regs)
 	return IRQ_NONE;
 }
 
-#define ROUND_UP(x, a)		(((x) + (a) - 1) & ~((a) - 1))
-
 static void __init
 pcibios_size_bridge(struct pci_bus *bus, struct resource *ior,
 		    struct resource *memr)
@@ -434,8 +432,8 @@ pcibios_size_bridge(struct pci_bus *bus, struct resource *ior,
 	mem_res.end -= mem_res.start;
 
 	/* Align the sizes up by bridge rules */
-	io_res.end = ROUND_UP(io_res.end, 4*1024) - 1;
-	mem_res.end = ROUND_UP(mem_res.end, 1*1024*1024) - 1;
+	io_res.end = ALIGN(io_res.end, 4*1024) - 1;
+	mem_res.end = ALIGN(mem_res.end, 1*1024*1024) - 1;
 
 	/* Adjust the bridge's allocation requirements */
 	bridge->resource[0].end = bridge->resource[0].start + io_res.end;
@@ -448,18 +446,16 @@ pcibios_size_bridge(struct pci_bus *bus, struct resource *ior,
 
 	/* adjust parent's resource requirements */
 	if (ior) {
-		ior->end = ROUND_UP(ior->end, 4*1024);
+		ior->end = ALIGN(ior->end, 4*1024);
 		ior->end += io_res.end;
 	}
 
 	if (memr) {
-		memr->end = ROUND_UP(memr->end, 1*1024*1024);
+		memr->end = ALIGN(memr->end, 1*1024*1024);
 		memr->end += mem_res.end;
 	}
 }
 
-#undef ROUND_UP
-
 static void __init pcibios_size_bridges(void)
 {
 	struct resource io_res, mem_res;

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
