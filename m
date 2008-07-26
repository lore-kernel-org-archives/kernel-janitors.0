From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 16:50:07 +0000
Subject: [PATCH] fix warning in arch/x86/mm/pgtable.c
Message-Id: <1217091007.6107.8.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes the following compile warning:

arch/x86/mm/pgtable.c: In function ‘pgd_mop_up_pmds’:
arch/x86/mm/pgtable.c:194: warning: unused variable ‘pmd’

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 557b2ab..2d57735 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -163,7 +163,8 @@ static int preallocate_pmds(pmd_t *pmds[])
        bool failed = false;
 
        for(i = 0; i < PREALLOCATED_PMDS; i++) {
-               pmd_t *pmd = (pmd_t *)get_zeroed_page(GFP_KERNEL|
__GFP_REPEAT);
+               pmd_t *pmd;
+               pmd = (pmd_t *)get_zeroed_page(GFP_KERNEL|__GFP_REPEAT);
                if (pmd = NULL)
                        failed = true;
                pmds[i] = pmd;


