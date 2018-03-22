From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Mar 2018 15:41:44 +0000
Subject: [PATCH][next] drm/amdgpu: fix spelling mistake: "asssert" -> "assert"
Message-Id: <20180322154144.31363-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_err error message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 8fb933c62cf5..493348672475 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -129,7 +129,7 @@ static void xgpu_ai_mailbox_trans_msg (struct amdgpu_device *adev,
 		xgpu_ai_mailbox_set_valid(adev, false);
 		trn = xgpu_ai_peek_ack(adev);
 		if (trn) {
-			pr_err("trn=%x ACK should not asssert! wait again !\n", trn);
+			pr_err("trn=%x ACK should not assert! wait again !\n", trn);
 			msleep(1);
 		}
 	} while(trn);
-- 
2.15.1

