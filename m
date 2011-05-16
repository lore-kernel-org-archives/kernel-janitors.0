From: Julia Lawall <julia@diku.dk>
Date: Mon, 16 May 2011 09:54:59 +0000
Subject: [PATCH] drivers/gpu/drm/i915/i915_gem.c: Add missing error handling code
Message-Id: <1305539699-14096-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The cleanup code at the end of the function should also be carried out when
the function only partly completes its work.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression struct page ** x;
expression ra,rr;
position p1,p2;
@@

x = drm_malloc_ab@p1(...)
...  when != x = rr
     when != drm_free_large(x,...)
     when != if (...) { ... drm_free_large(x,...) ...}
if(...) { ... when != x = ra
     when forall
     when != drm_free_large(x,...)
 \(return <+...x...+>; \| return@p2...; \) }

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

cocci.print_main("drm_malloc_ab",p1)
cocci.print_secs("return",p2)

// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This is only compile-tested.  It may be that processing all of the pages is
not correct when they have been partially treated.

 drivers/gpu/drm/i915/i915_gem.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 7ce3f35..ef000e6 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -467,8 +467,10 @@ i915_gem_shmem_pread_slow(struct drm_device *dev,
 
 		page = read_cache_page_gfp(mapping, offset >> PAGE_SHIFT,
 					   GFP_HIGHUSER | __GFP_RECLAIMABLE);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		if (IS_ERR(page)) {
+			ret = PTR_ERR(page);
+			goto out;
+		}
 
 		if (do_bit17_swizzling) {
 			slow_shmem_bit17_copy(page,

