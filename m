From: Colin King <colin.king@canonical.com>
Date: Fri, 12 May 2017 05:50:28 +0000
Subject: [PATCH] parisc: fix spelling mistake: "page_tye" -> "page_type"
Message-Id: <20170512055028.3030-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in a pr_warn message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/parisc/kernel/pdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 261e134ee7f8..6362614c5160 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -131,7 +131,7 @@ void __init pdc_pdt_init(void)
 	}
 
 	for (i = 0; i < pdt_status.pdt_entries; i++) {
-		pr_warn("PDT: BAD PAGE at 0x%08lx (error_tye = %lu)\n",
+		pr_warn("PDT: BAD PAGE at 0x%08lx (error_type = %lu)\n",
 			pdt_entry[i] & PAGE_MASK,
 			pdt_entry[i] & 1);
 
-- 
2.11.0

