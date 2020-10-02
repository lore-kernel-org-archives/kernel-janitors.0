From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Oct 2020 17:03:54 +0000
Subject: [PATCH][next] drm/i915: fix size_t greater or equal to zero comparison
Message-Id: <20201002170354.94627-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check that the unsigned size_t variable i is >= 0
is always true because the unsigned variable will never be negative,
causing the loop to run forever.  Fix this by changing the
pre-decrement check to a zero check on i followed by a decrement of i.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 400b65cb5acb ("drm/i915: use vmap in shmem_pin_map")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index f011ea42487e..30cc56fa191f 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -73,7 +73,7 @@ void *shmem_pin_map(struct file *file)
 	mapping_set_unevictable(file->f_mapping);
 	return vaddr;
 err_page:
-	while (--i >= 0)
+	while (i--)
 		put_page(pages[i]);
 	kvfree(pages);
 	return NULL;
-- 
2.27.0
