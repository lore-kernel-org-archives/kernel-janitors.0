From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Dec 2020 17:27:17 +0000
Subject: [PATCH] mm: Fix spelling mistake in Kconfig "whats" -> "what's"
Message-Id: <20201217172717.58203-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index 7af1a55b708e..585d440a554a 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -713,7 +713,7 @@ config ZSMALLOC_STAT
 	select DEBUG_FS
 	help
 	  This option enables code in the zsmalloc to collect various
-	  statistics about whats happening in zsmalloc and exports that
+	  statistics about what's happening in zsmalloc and exports that
 	  information to userspace via debugfs.
 	  If unsure, say N.
 
-- 
2.29.2
