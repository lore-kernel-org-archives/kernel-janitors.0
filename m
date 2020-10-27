From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Oct 2020 18:34:30 +0000
Subject: [PATCH] MIPS: Kconfig: fix a few trivial spelling mistakes
Message-Id: <20201027183430.56772-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiri Kosina <trivial@kernel.org>, linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a few spelling mistakes in the Kconfig, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2000bb2b0220..ddaff19a9580 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2645,7 +2645,7 @@ config WAR_R4600_V1_INDEX_ICACHEOP
 #  18. The CACHE instructions Hit_Writeback_Invalidate_D, Hit_Writeback_D,
 #      Hit_Invalidate_D and Create_Dirty_Excl_D should only be
 #      executed if there is no other dcache activity. If the dcache is
-#      accessed for another instruction immeidately preceding when these
+#      accessed for another instruction immediately preceding when these
 #      cache instructions are executing, it is possible that the dcache
 #      tag match outputs used by these cache instructions will be
 #      incorrect. These cache instructions should be preceded by at least
@@ -3086,7 +3086,7 @@ config MIPS_O32_FP64_SUPPORT
 
 	  Although binutils currently supports use of this flag the details
 	  concerning its effect upon the O32 ABI in userland are still being
-	  worked on. In order to avoid userland becoming dependant upon current
+	  worked on. In order to avoid userland becoming dependent upon current
 	  behaviour before the details have been finalised, this option should
 	  be considered experimental and only enabled by those working upon
 	  said details.
@@ -3124,7 +3124,7 @@ choice
 
 		    objcopy --update-section .appended_dtb=<filename>.dtb vmlinux
 
-		  This is meant as a backward compatiblity convenience for those
+		  This is meant as a backward compatibility convenience for those
 		  systems with a bootloader that can't be upgraded to accommodate
 		  the documented boot protocol using a device tree.
 
-- 
2.27.0
