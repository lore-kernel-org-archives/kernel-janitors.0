From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Sep 2020 08:18:30 +0000
Subject: [PATCH] drm/i915: Uninitialized variable in i915_gem_object_map_page()
Message-Id: <20200924081830.GA1568157@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>

The "i" iterator is never set to zero.  This probably doesn't affect
testing because GCC sometimes initializes variables and also we have a
new pluggin to initialize stack variables to zero.

Fixes: 7edd32a9e614 ("drm/i915: use vmap in i915_gem_object_map")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Hi Andrew, this should probably go through the -mm tree and get folded
into the original patch.

 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 90029ea83aed..12bedabc1daa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -266,6 +266,7 @@ static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
 			return NULL;
 	}
 
+	i = 0;
 	for_each_sgt_page(page, iter, obj->mm.pages)
 		pages[i++] = page;
 	vaddr = vmap(pages, n_pages, 0, pgprot);
@@ -291,6 +292,7 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj)
 			return NULL;
 	}
 
+	i = 0;
 	for_each_sgt_daddr(addr, iter, obj->mm.pages)
 		pfns[i++] = (iomap + addr) >> PAGE_SHIFT;
 	vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL_IO));
-- 
2.28.0
