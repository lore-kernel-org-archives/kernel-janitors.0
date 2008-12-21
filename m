From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 15:28:47 +0000
Subject: [PATCH 2/13] drivers/gpu/drm/i915: Remove redundant test
Message-Id: <Pine.LNX.4.64.0812211628230.9555@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

object_list is checked to be not NULL near the beginning of the function and
is not updated subsequently.

A simplified version of the semantic patch that makes this change is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E;
position p1,p2;
@@

if (x@p1 = NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
(
x@p2 = NULL
|
x@p2 != NULL
)

// another path to the test that is not through p1?
@s exists@
local idexpression r.x;
position r.p1,r.p2;
@@

... when != x@p1
(
x@p2 = NULL
|
x@p2 != NULL
)

@fix depends on !s@
position r.p1,r.p2;
expression x,E;
statement S1,S2;
@@

(
- if ((x@p2 != NULL) || ...)
  S1
|
- if ((x@p2 = NULL) && ...) S1
|
- BUG_ON(x@p2 = NULL);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpu/drm/i915/i915_gem.c     |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index fccf199..78319ec 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -2611,13 +2611,12 @@ i915_gem_execbuffer(struct drm_device *dev, void *data,
 			  "back to user (%d)\n",
 			   args->buffer_count, ret);
 err:
-	if (object_list != NULL) {
-		for (i = 0; i < pinned; i++)
-			i915_gem_object_unpin(object_list[i]);
+	for (i = 0; i < pinned; i++)
+		i915_gem_object_unpin(object_list[i]);
+
+	for (i = 0; i < args->buffer_count; i++)
+		drm_gem_object_unreference(object_list[i]);
 
-		for (i = 0; i < args->buffer_count; i++)
-			drm_gem_object_unreference(object_list[i]);
-	}
 	mutex_unlock(&dev->struct_mutex);
 
 pre_mutex_err:
