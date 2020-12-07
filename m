From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Dec 2020 15:50:04 +0000
Subject: [PATCH] arch: fix spelling mistakes in Kconfig
Message-Id: <20201207155004.171962-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207153859.171441-1-colin.king@canonical.com>
In-Reply-To: <20201207153859.171441-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a few spelling mistakes in the Kconfig comments and help
text. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index f7f246e68ff5..a52f8e8d16ad 100644
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
2.29.2
