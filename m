From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 11 Dec 2017 21:10:09 +0000
Subject: [PATCH v2] mm: Release a semaphore in 'get_vaddr_frames()'
Message-Id: <20171211211009.4971-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com, akpm@linux-foundation.org, borntraeger@de.ibm.com, mhocko@suse.com, dsterba@suse.com, gregkh@linuxfoundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

A semaphore is acquired before this check, so we must release it before
leaving.

Fixes: b7f0554a56f2 ("mm: fail get_vaddr_frames() for filesystem-dax mappings")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
-- Untested --

v1 -> v2: 'goto out' instead of duplicating code
---
 mm/frame_vector.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index 297c7238f7d4..c64dca6e27c2 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -62,8 +62,10 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 	 * get_user_pages_longterm() and disallow it for filesystem-dax
 	 * mappings.
 	 */
-	if (vma_is_fsdax(vma))
-		return -EOPNOTSUPP;
+	if (vma_is_fsdax(vma)) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
 
 	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
 		vec->got_ref = true;
-- 
2.14.1

