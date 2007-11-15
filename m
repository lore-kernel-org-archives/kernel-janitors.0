From: Jiri Olsa <olsajiri@gmail.com>
Date: Thu, 15 Nov 2007 08:41:31 +0000
Subject: [PATCH] m68knommu: Removing config variable DUMPTOFLASH
Message-Id: <473C063B.2060400@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing config variable DUMPTOFLASH, since it is not used

Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
---
 arch/m68knommu/Kconfig.debug |    7 -------
 arch/m68knommu/defconfig     |    1 -
 2 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/arch/m68knommu/Kconfig.debug b/arch/m68knommu/Kconfig.debug
index 9ff47bd..ed6d9a8 100644
--- a/arch/m68knommu/Kconfig.debug
+++ b/arch/m68knommu/Kconfig.debug
@@ -21,13 +21,6 @@ config BOOTPARAM_STRING
 	default 'console=ttyS0,19200'
 	depends on BOOTPARAM
 
-config DUMPTOFLASH
-	bool "Panic/Dump to FLASH"
-	depends on COLDFIRE
-	help
-	  Dump any panic of trap output into a flash memory segment
-	  for later analysis.
-
 config NO_KERNEL_MSG
 	bool "Suppress Kernel BUG Messages"
 	help
diff --git a/arch/m68knommu/defconfig b/arch/m68knommu/defconfig
index 5a0ecaa..6481130 100644
--- a/arch/m68knommu/defconfig
+++ b/arch/m68knommu/defconfig
@@ -597,7 +597,6 @@ CONFIG_MSDOS_PARTITION=y
 # CONFIG_FULLDEBUG is not set
 # CONFIG_HIGHPROFILE is not set
 # CONFIG_BOOTPARAM is not set
-# CONFIG_DUMPTOFLASH is not set
 # CONFIG_NO_KERNEL_MSG is not set
 # CONFIG_BDM_DISABLE is not set
 
