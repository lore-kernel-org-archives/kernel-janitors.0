From: Colin King <colin.king@canonical.com>
Date: Thu, 21 Nov 2019 16:54:01 +0000
Subject: [PATCH][next] drm/amdgpu: remove redundant assignment to pointer write_frame
Message-Id: <20191121165401.405845-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190723134120.28441-1-colin.king@canonical.com>
In-Reply-To: <20190723134120.28441-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer write_frame is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 2a8a08aa6eaf..c02f9ffe5c6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1728,7 +1728,7 @@ int psp_ring_cmd_submit(struct psp_context *psp,
 			int index)
 {
 	unsigned int psp_write_ptr_reg = 0;
-	struct psp_gfx_rb_frame *write_frame = psp->km_ring.ring_mem;
+	struct psp_gfx_rb_frame *write_frame;
 	struct psp_ring *ring = &psp->km_ring;
 	struct psp_gfx_rb_frame *ring_buffer_start = ring->ring_mem;
 	struct psp_gfx_rb_frame *ring_buffer_end = ring_buffer_start +
-- 
2.24.0
