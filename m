From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Sep 2018 11:27:27 +0000
Subject: [PATCH] ARC: fix spelling mistake "entires" -> "entries"
Message-Id: <20180914112727.4276-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-snps-arc@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in Kconfig

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/arc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index b4441b0764d7..a045f3086047 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -149,7 +149,7 @@ config ARC_CPU_770
 	  Support for ARC770 core introduced with Rel 4.10 (Summer 2011)
 	  This core has a bunch of cool new features:
 	  -MMU-v3: Variable Page Sz (4k, 8k, 16k), bigger J-TLB (128x4)
-                   Shared Address Spaces (for sharing TLB entires in MMU)
+                   Shared Address Spaces (for sharing TLB entries in MMU)
 	  -Caches: New Prog Model, Region Flush
 	  -Insns: endian swap, load-locked/store-conditional, time-stamp-ctr
 
-- 
2.17.1
