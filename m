From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Dec 2017 10:53:43 +0000
Subject: [PATCH] drm/amd/display: remove redundant null check of array 'data'
Message-Id: <20171215105343.11372-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The null check on aconnector->base.edid_blob_ptr->data is redundant
since data is an array and can never be null.  Remove it.

Detected by CoverityScan, CID#1460369 ("Array compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ccbf10e3bbb6..c388778dbba3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2725,8 +2725,7 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 	};
 	struct edid *edid;
 
-	if (!aconnector->base.edid_blob_ptr ||
-		!aconnector->base.edid_blob_ptr->data) {
+	if (!aconnector->base.edid_blob_ptr) {
 		DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
 				aconnector->base.name);
 
-- 
2.14.1

