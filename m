From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Nov 2020 12:01:21 +0000
Subject: [PATCH][next] drm/kmb: fix array out-of-bounds writes to kmb->plane_status[]
Message-Id: <20201113120121.33212-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Writes to elements in the kmb->plane_status array in function
kmb_plane_atomic_disable are overrunning the array when plane_id is
more than 1 because currently the array is KMB_MAX_PLANES elements
in size and this is currently #defined as 1.  Fix this by defining
KMB_MAX_PLANES to 4.

Addresses-Coverity: ("Out-of-bounds write")
Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/kmb/kmb_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
index 486490f7a3ec..6f43a7ae3de6 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -43,7 +43,7 @@ enum layer_id {
 	/* KMB_MAX_PLANES */
 };
 
-#define KMB_MAX_PLANES 1
+#define KMB_MAX_PLANES 4
 
 enum sub_plane_id {
 	Y_PLANE,
-- 
2.28.0
