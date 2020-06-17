From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jun 2020 15:59:59 +0000
Subject: [PATCH][next] drm/mm/selftests: fix unsigned comparison with less than zero
Message-Id: <20200617155959.231740-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function get_insert_time can return error values that are cast
to a u64. The checks of insert_time1 and insert_time2 check for
the errors but because they are u64 variables the check for less
than zero can never be true. Fix this by casting the value to s64
to allow of the negative error check to succeed.

Addresses-Coverity: ("Unsigned compared against 0, no effect")
Fixes: 6e60d5ded06b ("drm/mm: add ig_frag selftest")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/selftests/test-drm_mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
index 3846b0f5bae3..671a152a6df2 100644
--- a/drivers/gpu/drm/selftests/test-drm_mm.c
+++ b/drivers/gpu/drm/selftests/test-drm_mm.c
@@ -1124,12 +1124,12 @@ static int igt_frag(void *ignored)
 
 		insert_time1 = get_insert_time(&mm, insert_size,
 					       nodes + insert_size, mode);
-		if (insert_time1 < 0)
+		if ((s64)insert_time1 < 0)
 			goto err;
 
 		insert_time2 = get_insert_time(&mm, (insert_size * 2),
 					       nodes + insert_size * 2, mode);
-		if (insert_time2 < 0)
+		if ((s64)insert_time2 < 0)
 			goto err;
 
 		pr_info("%s fragmented insert of %u and %u insertions took %llu and %llu nsecs\n",
-- 
2.27.0.rc0
