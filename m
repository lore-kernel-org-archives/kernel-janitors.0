From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jan 2016 20:42:55 +0000
Subject: [patch] drm/amd/powerplay: fix a reversed condition
Message-Id: <20160104204255.GB19867@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Jammy Zhou <Jammy.Zhou@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, Rex Zhu <Rex.Zhu@amd.com>, dri-devel@lists.freedesktop.org

This test was reversed so it would end up leading to a NULL dereference.

Fixes: 4630f0faae80 ('drm/amd/powerplay: add Carrizo smu support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c
index e74023b..873a8d2 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/cz_smumgr.c
@@ -818,7 +818,7 @@ static int cz_smu_fini(struct pp_smumgr *smumgr)
 		return -EINVAL;
 
 	cz_smu = (struct cz_smumgr *)smumgr->backend;
-	if (!cz_smu) {
+	if (cz_smu) {
 		cgs_free_gpu_mem(smumgr->device,
 				cz_smu->toc_buffer.handle);
 		cgs_free_gpu_mem(smumgr->device,
