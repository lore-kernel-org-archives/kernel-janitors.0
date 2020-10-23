From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Oct 2020 11:34:01 +0000
Subject: [PATCH] drm/i915: Fix a crash in shmem_pin_map() error handling
Message-Id: <20201023113401.GG282278@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Christoph Hellwig <hch@lst.de>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>

There is a signedness bug in shmem_pin_map() error handling because "i"
is unsigned.  The "while (--i >= 0)" will loop forever until the system
crashes.

Fixes: bfed6708d6c9 ("drm/i915: use vmap in shmem_pin_map")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index f011ea42487e..7eb542018219 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -52,8 +52,9 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
 void *shmem_pin_map(struct file *file)
 {
 	struct page **pages;
-	size_t n_pages, i;
+	size_t n_pages;
 	void *vaddr;
+	int i;
 
 	n_pages = file->f_mapping->host->i_size >> PAGE_SHIFT;
 	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
-- 
2.28.0
