From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:13:47 +0000
Subject: [PATCH 04/12] arch/mips: Remove duplicate includes.
Message-Id: <472F797B.7060704@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/mips/kernel/rtlx.c |    1 -
 arch/mips/kernel/vpe.c  |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/rtlx.c b/arch/mips/kernel/rtlx.c
index 1ba00c1..0233798 100644
--- a/arch/mips/kernel/rtlx.c
+++ b/arch/mips/kernel/rtlx.c
@@ -40,7 +40,6 @@
 #include <asm/atomic.h>
 #include <asm/cpu.h>
 #include <asm/processor.h>
-#include <asm/mips_mt.h>
 #include <asm/system.h>
 #include <asm/vpe.h>
 #include <asm/rtlx.h>
diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index 436a64f..adbe62f 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -53,7 +53,6 @@
 #include <asm/system.h>
 #include <asm/vpe.h>
 #include <asm/kspd.h>
-#include <asm/mips_mt.h>
 
 typedef void *vpe_handle;
 
-- 


