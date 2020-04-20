From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Apr 2020 08:42:41 +0000
Subject: [PATCH][V2][next] selftests: khugepaged: fix several spelling mistakes
Message-Id: <20200420084241.65433-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, William Kucharski <william.kucharski@oracle.com>, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There a are several spelling mistakes in various messages. Fix these.

There are three spelling mistakes in various messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/vm/khugepaged.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/vm/khugepaged.c b/tools/testing/selftests/vm/khugepaged.c
index 490055290d7f..399a67d54e52 100644
--- a/tools/testing/selftests/vm/khugepaged.c
+++ b/tools/testing/selftests/vm/khugepaged.c
@@ -537,7 +537,7 @@ static void collapse_max_ptes_none(void)
 	p = alloc_mapping();
 
 	fill_memory(p, 0, (hpage_pmd_nr - max_ptes_none - 1) * page_size);
-	if (wait_for_scan("Do not collapse with max_ptes_none exeeded", p))
+	if (wait_for_scan("Do not collapse with max_ptes_none exceeded", p))
 		fail("Timeout");
 	else if (check_huge(p))
 		fail("Fail");
@@ -576,7 +576,7 @@ static void collapse_swapin_single_pte(void)
 		goto out;
 	}
 
-	if (wait_for_scan("Collapse with swaping in single PTE entry", p))
+	if (wait_for_scan("Collapse with swapping in single PTE entry", p))
 		fail("Timeout");
 	else if (check_huge(p))
 		success("OK");
@@ -607,7 +607,7 @@ static void collapse_max_ptes_swap(void)
 		goto out;
 	}
 
-	if (wait_for_scan("Do not collapse with max_ptes_swap exeeded", p))
+	if (wait_for_scan("Do not collapse with max_ptes_swap exceeded", p))
 		fail("Timeout");
 	else if (check_huge(p))
 		fail("Fail");
@@ -654,14 +654,14 @@ static void collapse_single_pte_entry_compound(void)
 		fail("Fail");
 	madvise(p, hpage_pmd_size, MADV_NOHUGEPAGE);
 
-	printf("Split huge page leaving single PTE mapping compount page...");
+	printf("Split huge page leaving single PTE mapping compound page...");
 	madvise(p + page_size, hpage_pmd_size - page_size, MADV_DONTNEED);
 	if (!check_huge(p))
 		success("OK");
 	else
 		fail("Fail");
 
-	if (wait_for_scan("Collapse PTE table with single PTE mapping compount page", p))
+	if (wait_for_scan("Collapse PTE table with single PTE mapping compound page", p))
 		fail("Timeout");
 	else if (check_huge(p))
 		success("OK");
@@ -685,7 +685,7 @@ static void collapse_full_of_compound(void)
 	else
 		fail("Fail");
 
-	printf("Split huge page leaving single PTE page table full of compount pages...");
+	printf("Split huge page leaving single PTE page table full of compound pages...");
 	madvise(p, page_size, MADV_NOHUGEPAGE);
 	madvise(p, hpage_pmd_size, MADV_NOHUGEPAGE);
 	if (!check_huge(p))
@@ -908,7 +908,7 @@ static void collapse_max_ptes_shared()
 		else
 			fail("Fail");
 
-		if (wait_for_scan("Do not collapse with max_ptes_shared exeeded", p))
+		if (wait_for_scan("Do not collapse with max_ptes_shared exceeded", p))
 			fail("Timeout");
 		else if (!check_huge(p))
 			success("OK");
-- 
2.25.1
