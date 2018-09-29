From: Colin King <colin.king@canonical.com>
Date: Sat, 29 Sep 2018 10:57:58 +0000
Subject: [PATCH] drm/amdgpu: fix spelling mistake "recieve" -> "receive"
Message-Id: <20180929105758.8775-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_err message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index 64e875d528dd..ef0c56d4e3fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -516,7 +516,7 @@ static void xgpu_vi_mailbox_flr_work(struct work_struct *work)
 
 	/* wait until RCV_MSG become 3 */
 	if (xgpu_vi_poll_msg(adev, IDH_FLR_NOTIFICATION_CMPL)) {
-		pr_err("failed to recieve FLR_CMPL\n");
+		pr_err("failed to receive FLR_CMPL\n");
 		return;
 	}
 
-- 
2.17.1
