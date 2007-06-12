From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Tue, 12 Jun 2007 06:16:53 +0000
Subject: [KJ] [PATCH] Fix 'obviously wrong' header guards
Message-Id: <466E3A55.8010907@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Apparently this doesn't really matter, but it's nice to be nice.


From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Tue, 29 May 2007 12:33:51 +0200
Subject: [PATCH] Fix 'obviously wrong' header guards

---
  include/asm-arm/arch-iop13xx/dma.h |    2 +-
  include/asm-i386/seccomp.h         |    1 +
  include/asm-parisc/psw.h           |    1 +
  include/asm-sparc64/seccomp.h      |    1 +
  include/asm-x86_64/seccomp.h       |    1 +
  5 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/include/asm-arm/arch-iop13xx/dma.h 
b/include/asm-arm/arch-iop13xx/dma.h
index 2e15da5..d79846f 100644
--- a/include/asm-arm/arch-iop13xx/dma.h
+++ b/include/asm-arm/arch-iop13xx/dma.h
@@ -1,3 +1,3 @@
  #ifndef _IOP13XX_DMA_H
-#define _IOP13XX_DMA_H_
+#define _IOP13XX_DMA_H
  #endif
diff --git a/include/asm-i386/seccomp.h b/include/asm-i386/seccomp.h
index 18da19e..36e71c5 100644
--- a/include/asm-i386/seccomp.h
+++ b/include/asm-i386/seccomp.h
@@ -1,4 +1,5 @@
  #ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H

  #include <linux/thread_info.h>

diff --git a/include/asm-parisc/psw.h b/include/asm-parisc/psw.h
index 5a3e23c..5baddc4 100644
--- a/include/asm-parisc/psw.h
+++ b/include/asm-parisc/psw.h
@@ -1,4 +1,5 @@
  #ifndef _PARISC_PSW_H
+#define _PARISC_PSW_H


  #define	PSW_I	0x00000001
diff --git a/include/asm-sparc64/seccomp.h b/include/asm-sparc64/seccomp.h
index 7fcd996..9b20c34 100644
--- a/include/asm-sparc64/seccomp.h
+++ b/include/asm-sparc64/seccomp.h
@@ -1,4 +1,5 @@
  #ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H

  #include <linux/thread_info.h> /* already defines TIF_32BIT */

diff --git a/include/asm-x86_64/seccomp.h b/include/asm-x86_64/seccomp.h
index 553af65..76cfe69 100644
--- a/include/asm-x86_64/seccomp.h
+++ b/include/asm-x86_64/seccomp.h
@@ -1,4 +1,5 @@
  #ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H

  #include <linux/thread_info.h>

-- 
1.5.0.6

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
