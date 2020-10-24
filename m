From: Colin King <colin.king@canonical.com>
Date: Sat, 24 Oct 2020 12:55:49 +0000
Subject: [PATCH] arch/Kconfig: fix a few trivial spelling mistakes in Kconfig
Message-Id: <20201024125549.78254-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of trivial spelling mistakes, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 56b6ccc0e32d..ce4e84366418 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -261,7 +261,7 @@ config ARCH_HAS_SET_DIRECT_MAP
 
 #
 # Select if the architecture provides the arch_dma_set_uncached symbol to
-# either provide an uncached segement alias for a DMA allocation, or
+# either provide an uncached segment alias for a DMA allocation, or
 # to remap the page tables in place.
 #
 config ARCH_HAS_DMA_SET_UNCACHED
@@ -314,14 +314,14 @@ config ARCH_32BIT_OFF_T
 config HAVE_ASM_MODVERSIONS
 	bool
 	help
-	  This symbol should be selected by an architecure if it provides
+	  This symbol should be selected by an architecture if it provides
 	  <asm/asm-prototypes.h> to support the module versioning for symbols
 	  exported from assembly code.
 
 config HAVE_REGS_AND_STACK_ACCESS_API
 	bool
 	help
-	  This symbol should be selected by an architecure if it supports
+	  This symbol should be selected by an architecture if it supports
 	  the API needed to access registers and stack entries from pt_regs,
 	  declared in asm/ptrace.h
 	  For example the kprobes-based event tracer needs this API.
@@ -336,7 +336,7 @@ config HAVE_RSEQ
 config HAVE_FUNCTION_ARG_ACCESS_API
 	bool
 	help
-	  This symbol should be selected by an architecure if it supports
+	  This symbol should be selected by an architecture if it supports
 	  the API needed to access function arguments from pt_regs,
 	  declared in asm/ptrace.h
 
-- 
2.27.0
