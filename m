From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 28 Apr 2007 14:33:11 +0000
Subject: [KJ] [PATCH] Grammatical fixes in arch/i386/Kconfig.
Message-Id: <Pine.LNX.4.64.0704281031520.25951@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


A couple cheap grammar fixes in arch/i386/Kconfig.

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

diff --git a/arch/i386/Kconfig b/arch/i386/Kconfig
index 2f76725..b7a3b2f 100644
--- a/arch/i386/Kconfig
+++ b/arch/i386/Kconfig
@@ -850,9 +850,9 @@ config RELOCATABLE
 	bool "Build a relocatable kernel(EXPERIMENTAL)"
 	depends on EXPERIMENTAL
 	help
-	  This build a kernel image that retains relocation information
+	  This builds a kernel image that retains relocation information
           so it can be loaded someplace besides the default 1MB.
-	  The relocations tend to the kernel binary about 10% larger,
+	  The relocations tend to make the kernel binary about 10% larger,
           but are discarded at runtime.

 	  One use is for the kexec on panic case where the recovery kernel
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
