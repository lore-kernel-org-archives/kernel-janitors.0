From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Oct 2016 05:09:21 +0000
Subject: [PATCH 4/6] FRV-setup: Move "else" closer to a brace
Message-Id: <6fe73d13-1672-1dec-c300-391195a8b69d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
In-Reply-To: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Oct 2016 22:12:27 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: else should follow close brace '}'

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/frv/kernel/setup.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/frv/kernel/setup.c b/arch/frv/kernel/setup.c
index 577bcf5..35a23fc 100644
--- a/arch/frv/kernel/setup.c
+++ b/arch/frv/kernel/setup.c
@@ -902,8 +902,7 @@ static void __init setup_linux_memory(void)
 #else
 		max_mapnr = physpages = low_top_pfn;
 #endif
-	}
-	else {
+	} else {
 		low_top_pfn = physpages;
 	}
 
@@ -934,8 +933,7 @@ static void __init setup_linux_memory(void)
 					BOOTMEM_DEFAULT);
 			initrd_start = INITRD_START + PAGE_OFFSET;
 			initrd_end = initrd_start + INITRD_SIZE;
-		}
-		else {
+		} else {
 			printk(KERN_ERR
 			       "initrd extends beyond end of memory (0x%08lx > 0x%08lx)\n"
 			       "disabling initrd\n",
-- 
2.10.1

