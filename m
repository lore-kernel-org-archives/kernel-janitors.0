From: Colin King <colin.king@canonical.com>
Date: Thu, 28 May 2020 22:24:53 +0000
Subject: [PATCH][next] drm/amdkfd: fix a dereference of pdd before it is null checked
Message-Id: <20200528222453.536137-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mukul Joshi <mukul.joshi@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer pdd is being dereferenced when assigning pointer
dpm and then pdd is being null checked.  Fix this by checking if
pdd is null before the dereference of pdd occurs.

Addresses-Coverity: ("Dereference before null check")
Fixes: 522b89c63370 ("drm/amdkfd: Track SDMA utilization per process")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 25636789f3d3..bdc58741b32e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -103,10 +103,11 @@ static void kfd_sdma_activity_worker(struct work_struct *work)
 		return;
 
 	pdd = workarea->pdd;
+	if (!pdd)
+		return;
 	dqm = pdd->dev->dqm;
 	qpd = &pdd->qpd;
-
-	if (!pdd || !dqm || !qpd)
+	if (!dqm || !qpd)
 		return;
 
 	mm = get_task_mm(pdd->process->lead_thread);
-- 
2.25.1
