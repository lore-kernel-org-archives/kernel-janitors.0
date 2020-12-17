From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Dec 2020 17:24:27 +0000
Subject: [PATCH] xtensa: fix spelling mistake in Kconfig "wont" -> "won't"
Message-Id: <20201217172427.58009-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/xtensa/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 37ce1489364e..97beddc9d645 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -467,7 +467,7 @@ config INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
 	  then enter your normal kernel breakpoints once the MMU was mapped
 	  to the kernel mappings (0XC0000000).
 
-	  This unfortunately won't work for U-Boot and likely also wont
+	  This unfortunately won't work for U-Boot and likely also won't
 	  work for using KEXEC to have a hot kernel ready for doing a
 	  KDUMP.
 
-- 
2.29.2
