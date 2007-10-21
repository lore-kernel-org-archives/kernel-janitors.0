From: Roel Kluin <12o3l@tiscali.nl>
Date: Sun, 21 Oct 2007 17:53:54 +0000
Subject: [PATCH addition to nr 1] SuperH CPU Frequency and SMP debugging
Message-Id: <471B9232.2010702@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This should be applied in combination with my first patch:
module debugging

---
    SuperH CPU Frequency and SMP debugging

    Signed-off-by: Roel Kluin <12o3l@tiscali.nl>
---
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 247f8a6..47497d1 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -485,6 +485,11 @@ config SH_CPU_FREQ
 
 	  If unsure, say N.
 
+config SH_CPU_FREQ_DEBUG
+	bool "SuperH CPU Frequency driver debugging"
+	depends on SH_CPU_FREQ
+	default n
+
 endmenu
 
 source "arch/sh/drivers/Kconfig"
diff --git a/arch/x86_64/Kconfig b/arch/x86_64/Kconfig
index aab25f3..dc76d43 100644
--- a/arch/x86_64/Kconfig
+++ b/arch/x86_64/Kconfig
@@ -326,6 +326,11 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
+config SMP_DEBUG
+	bool "Symmetric multi-processing debugging"
+	depends on SMP
+	default n
+
 config SCHED_SMT
 	bool "SMT (Hyperthreading) scheduler support"
 	depends on SMP
