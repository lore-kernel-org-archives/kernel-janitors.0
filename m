From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 27 Jul 2020 10:34:36 +0000
Subject: [PATCH 2/2] drm/radeon: avoid a useless memset
Message-Id: <20200727103436.50793-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org

Avoid a memset after a call to 'dma_alloc_coherent()'.
This is useless since
commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/radeon/radeon_gart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeon/radeon_gart.c
index b7ce254e5663..3808a753127b 100644
--- a/drivers/gpu/drm/radeon/radeon_gart.c
+++ b/drivers/gpu/drm/radeon/radeon_gart.c
@@ -85,7 +85,6 @@ int radeon_gart_table_ram_alloc(struct radeon_device *rdev)
 	}
 #endif
 	rdev->gart.ptr = ptr;
-	memset((void *)rdev->gart.ptr, 0, rdev->gart.table_size);
 	return 0;
 }
 
-- 
2.25.1
