From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Oct 2011 07:21:28 +0000
Subject: [patch] drm/radeon/benchmark: signedness bug in
Message-Id: <20111029072128.GE17780@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>

radeon_benchmark_do_move() returns an int so "time" should be int
too.  Making it unsigned breaks the error handling.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/radeon_benchmark.c b/drivers/gpu/drm/radeon/radeon_benchmark.c
index 5cafc90..17e1a9b 100644
--- a/drivers/gpu/drm/radeon/radeon_benchmark.c
+++ b/drivers/gpu/drm/radeon/radeon_benchmark.c
@@ -98,7 +98,7 @@ static void radeon_benchmark_move(struct radeon_device *rdev, unsigned size,
 	struct radeon_bo *sobj = NULL;
 	uint64_t saddr, daddr;
 	int r, n;
-	unsigned int time;
+	int time;
 
 	n = RADEON_BENCHMARK_ITERATIONS;
 	r = radeon_bo_create(rdev, size, PAGE_SIZE, true, sdomain, &sobj);
