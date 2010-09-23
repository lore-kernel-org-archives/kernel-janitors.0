From: matt mooney <mfm@muteddisk.com>
Date: Thu, 23 Sep 2010 06:50:38 +0000
Subject: [PATCH 07/20] m68k: change to new flag variables
Message-Id: <1285224638-29684-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y and EXTRA_AFLAGS with asflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 arch/m68k/math-emu/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/math-emu/Makefile b/arch/m68k/math-emu/Makefile
index a0935bf..547c23c 100644
--- a/arch/m68k/math-emu/Makefile
+++ b/arch/m68k/math-emu/Makefile
@@ -2,8 +2,8 @@
 # Makefile for the linux kernel.
 #
 
-#EXTRA_AFLAGS += -DFPU_EMU_DEBUG
-#EXTRA_CFLAGS += -DFPU_EMU_DEBUG
+#asflags-y := -DFPU_EMU_DEBUG
+#ccflags-y := -DFPU_EMU_DEBUG
 
 obj-y		:= fp_entry.o fp_scan.o fp_util.o fp_move.o fp_movem.o \
 			fp_cond.o fp_arith.o fp_log.o fp_trig.o
-- 
1.7.2.1

