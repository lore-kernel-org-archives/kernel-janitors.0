From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Sep 2017 13:46:17 +0000
Subject: [PATCH][drm-next] drm/radeon: make functions alloc_pasid and free_pasid static
Message-Id: <20170928134617.8168-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions alloc_pasid  and free_pasid are local to the
source and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
warning: symbol 'alloc_pasid' was not declared. Should it be static?
warning: symbol 'free_pasid' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/radeon/radeon_kfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_kfd.c b/drivers/gpu/drm/radeon/radeon_kfd.c
index a2ac8ac0930d..385b4d76956d 100644
--- a/drivers/gpu/drm/radeon/radeon_kfd.c
+++ b/drivers/gpu/drm/radeon/radeon_kfd.c
@@ -352,7 +352,7 @@ static uint32_t get_max_engine_clock_in_mhz(struct kgd_dev *kgd)
  */
 static DEFINE_IDA(pasid_ida);
 
-int alloc_pasid(unsigned int bits)
+static int alloc_pasid(unsigned int bits)
 {
 	int pasid = -EINVAL;
 
@@ -367,7 +367,7 @@ int alloc_pasid(unsigned int bits)
 	return pasid;
 }
 
-void free_pasid(unsigned int pasid)
+static void free_pasid(unsigned int pasid)
 {
 	ida_simple_remove(&pasid_ida, pasid);
 }
-- 
2.14.1

