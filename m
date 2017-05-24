From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 18:04:54 +0000
Subject: [PATCH 2/2] blackfin: Delete an error message for a failed memory allocation in isram_test_init()
Message-Id: <c4e70db8-2f26-6704-c918-babf99d950bd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a8f92213-f0c5-8a4f-2b9e-60645f426210@users.sourceforge.net>
In-Reply-To: <a8f92213-f0c5-8a4f-2b9e-60645f426210@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, Ingo Molnar <mingo@kernel.org>, Steven Miao <realmz6@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 19:39:32 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/blackfin/mm/isram-driver.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/blackfin/mm/isram-driver.c b/arch/blackfin/mm/isram-driver.c
index aaa1e64b753b..4221b07a61dc 100644
--- a/arch/blackfin/mm/isram-driver.c
+++ b/arch/blackfin/mm/isram-driver.c
@@ -374,6 +374,5 @@ static __init int isram_test_init(void)
 	if (!sdram) {
 		sram_free(l1inst);
-		pr_warning("SKIP: could not allocate sdram\n");
 		return 0;
 	}
 
-- 
2.13.0

