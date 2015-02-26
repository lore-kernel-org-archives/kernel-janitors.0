From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Feb 2015 16:53:54 +0000
Subject: [patch -next] drm/i915: fix a printk format
Message-Id: <20150226165354.GA6820@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

This printk leads to the following Smatch warning:

	drivers/gpu/drm/i915/i915_gem_gtt.c:336 alloc_pt_range()
		error: '%pa' expects argument of type 'phys_addr_t*',
		argument 5 has type 'struct i915_page_table_entry*'

It looks like a simple typo to me where "%p" was intended instead of
"%pa".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index e05488e..48eff65 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -334,7 +334,7 @@ static int alloc_pt_range(struct i915_page_directory_entry *pd, uint16_t pde, si
 			goto err_out;
 		}
 		WARN(pd->page_table[i],
-		     "Leaking page directory entry %d (%pa)\n",
+		     "Leaking page directory entry %d (%p)\n",
 		     i, pd->page_table[i]);
 		pd->page_table[i] = pt;
 	}
