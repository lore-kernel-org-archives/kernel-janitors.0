From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Oct 2017 09:21:11 +0000
Subject: [PATCH][drm-next] drm/amdgpu: make function uvd_v6_0_enc_get_destroy_msg static
Message-Id: <20171011092111.16842-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, James Zhu <James.Zhu@amd.com>, Ken Wang <Qingqing.Wang@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function uvd_v6_0_enc_get_destroy_msg is local to the source and
does not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'uvd_v6_0_enc_get_destroy_msg' was not declared. Should it be
static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 60af7310a234..71299c67c517 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -268,8 +268,9 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
  *
  * Close up a stream for HW test or if userspace failed to do so
  */
-int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
-				 bool direct, struct dma_fence **fence)
+static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
+					uint32_t handle,
+					bool direct, struct dma_fence **fence)
 {
 	const unsigned ib_size_dw = 16;
 	struct amdgpu_job *job;
-- 
2.14.1

