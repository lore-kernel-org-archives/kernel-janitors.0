From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jul 2019 14:16:30 +0000
Subject: [PATCH] mm/ksm: One function call less in __ksm_enter()
Message-Id: <997c8ec3-9af8-3db0-24dc-cd99fe3efe14@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Dave Jiang <dave.jiang@intel.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Kirill Tkhai <ktkhai@virtuozzo.com>, Ralph Campbell <rcampbell@nvidia.com>, Souptick Joarder <jrdr.linux@gmail.com>, Yang Shi <yang.shi@linux.alibaba.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 16:02:26 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 mm/ksm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 3dc4346411e4..7934bab8ceae 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2521,10 +2521,10 @@ int __ksm_enter(struct mm_struct *mm)
 	 * scanning cursor, otherwise KSM pages in newly forked mms will be
 	 * missed: then we might as well insert at the end of the list.
 	 */
-	if (ksm_run & KSM_RUN_UNMERGE)
-		list_add_tail(&mm_slot->mm_list, &ksm_mm_head.mm_list);
-	else
-		list_add_tail(&mm_slot->mm_list, &ksm_scan.mm_slot->mm_list);
+	list_add_tail(&mm_slot->mm_list,
+		      ksm_run & KSM_RUN_UNMERGE
+		      ? &ksm_mm_head.mm_list
+		      : &ksm_scan.mm_slot->mm_list);
 	spin_unlock(&ksm_mmlist_lock);

 	set_bit(MMF_VM_MERGEABLE, &mm->flags);
--
2.22.0
