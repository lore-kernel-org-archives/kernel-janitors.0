From: Colin King <colin.king@canonical.com>
Date: Thu, 13 Apr 2017 15:59:12 +0000
Subject: [PATCH] x86/boot/e820: remove a redundant self assignment
Message-Id: <20170413155912.12078-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Denys Vlasenko <dvlasenk@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Remove a redundant self assignment of table->nr_entries, it does
nothing and is an artifact of code simplification re-work.

Detected by CoverityScan, CID#1428450 ("Self assignment")

Fixes: 441ac2f33dd7 ("x86/boot/e820: Simplify e820__update_table()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/e820.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 6e9b26fa6d05..d78a586ba8dc 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -270,7 +270,6 @@ int __init e820__update_table(struct e820_table *table)
 	if (table->nr_entries < 2)
 		return -1;
 
-	table->nr_entries = table->nr_entries;
 	BUG_ON(table->nr_entries > max_nr_entries);
 
 	/* Bail out if we find any unreasonable addresses in the map: */
-- 
2.11.0

