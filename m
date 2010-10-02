From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 Oct 2010 13:59:17 +0000
Subject: [PATCH 3/4] drivers/gpu/drm/i915/i915_gem.c: Add missing error handling code
Message-Id: <1286027958-7333-3-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Extend the error handling code with operations found in other nearby error
handling code

A simplified version of the sematic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
@r@
statement S1,S2,S3;
constant C1,C2,C3;
@@

*if (...)
 {... S1 return -C1;}
...
*if (...)
 {... when != S1
    return -C2;}
...
*if (...)
 {... S1 return -C3;}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This is only a suggestion.  All of the other ways out of this function call
these two functions.  But I don't understand the code well enough to know
why, or whether there is a reason not to do it in this case.

 drivers/gpu/drm/i915/i915_gem.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index bced9b2..cfe5978 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -3258,6 +3258,8 @@ i915_gem_object_pin_and_relocate(struct drm_gem_object *obj,
 				  (int) reloc->offset,
 				  reloc->read_domains,
 				  reloc->write_domain);
+			drm_gem_object_unreference(target_obj);
+			i915_gem_object_unpin(obj);
 			return -EINVAL;
 		}
 		if (reloc->write_domain & I915_GEM_DOMAIN_CPU ||

