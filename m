From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Oct 2017 15:42:08 +0000
Subject: [PATCH 2/2] powerpc/oprofile/cell: Improve a size determination in two functions
Message-Id: <8c013b7f-a0b0-26e8-ef4a-76f5a48d73c8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <596db1f4-5965-d6f8-af02-38b570b10d8a@users.sourceforge.net>
In-Reply-To: <596db1f4-5965-d6f8-af02-38b570b10d8a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, oprofile-list@lists.sf.net, Al Viro <viro@zeniv.linux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Robert Richter <rric@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Oct 2017 17:18:33 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/oprofile/cell/spu_task_sync.c | 2 +-
 arch/powerpc/oprofile/cell/vma_map.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/oprofile/cell/spu_task_sync.c b/arch/powerpc/oprofile/cell/spu_task_sync.c
index f1dd732b2998..8ab442925296 100644
--- a/arch/powerpc/oprofile/cell/spu_task_sync.c
+++ b/arch/powerpc/oprofile/cell/spu_task_sync.c
@@ -208,7 +208,7 @@ prepare_cached_spu_info(struct spu *spu, unsigned long objectId)
 	/* Create cached_info and set spu_info[spu->number] to point to it.
 	 * spu->number is a system-wide value, not a per-node value.
 	 */
-	info = kzalloc(sizeof(struct cached_info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info) {
 		retval = -ENOMEM;
 		goto err_alloc;
diff --git a/arch/powerpc/oprofile/cell/vma_map.c b/arch/powerpc/oprofile/cell/vma_map.c
index a115d9ede053..03de415a377c 100644
--- a/arch/powerpc/oprofile/cell/vma_map.c
+++ b/arch/powerpc/oprofile/cell/vma_map.c
@@ -69,8 +69,8 @@ vma_map_add(struct vma_to_fileoffset_map *map, unsigned int vma,
 	    unsigned int size, unsigned int offset, unsigned int guard_ptr,
 	    unsigned int guard_val)
 {
-	struct vma_to_fileoffset_map *new -		kzalloc(sizeof(struct vma_to_fileoffset_map), GFP_KERNEL);
+	struct vma_to_fileoffset_map *new = kzalloc(sizeof(*new), GFP_KERNEL);
+
 	if (!new) {
 		vma_map_free(map);
 		return NULL;
-- 
2.14.2

