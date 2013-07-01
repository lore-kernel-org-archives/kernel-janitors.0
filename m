From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Jul 2013 16:39:34 +0000
Subject: [patch] drm/radeon: forever loop on error in radeon_do_test_moves()
Message-Id: <20130701163934.GB4229@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jerome Glisse <jglisse@redhat.com>, Lauri Kasanen <cand@gmx.com>, Maarten Lankhorst <maarten.lankhorst@canonical.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The error path does this:

	for (--i; i >= 0; --i) {

which is a forever loop because "i" is unsigned.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/radeon_test.c b/drivers/gpu/drm/radeon/radeon_test.c
index f4d6bce..12e8099 100644
--- a/drivers/gpu/drm/radeon/radeon_test.c
+++ b/drivers/gpu/drm/radeon/radeon_test.c
@@ -36,8 +36,8 @@ static void radeon_do_test_moves(struct radeon_device *rdev, int flag)
 	struct radeon_bo *vram_obj = NULL;
 	struct radeon_bo **gtt_obj = NULL;
 	uint64_t gtt_addr, vram_addr;
-	unsigned i, n, size;
-	int r, ring;
+	unsigned n, size;
+	int i, r, ring;
 
 	switch (flag) {
 	case RADEON_TEST_COPY_DMA:
