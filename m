From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 07:54:10 +0000
Subject: [PATCH] drm: qxl: add missing return check
Message-Id: <20170314075410.GB5984@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Cc: kernel-janitors@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

My static checker complains that "release" is uninitialized if
qxl_alloc_release_reserved() fails, so let's add a check for that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 9548bb58d3bc..058340a002c2 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -572,6 +572,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 	ret = qxl_alloc_release_reserved(qdev, sizeof(*cmd),
 					 QXL_RELEASE_CURSOR_CMD,
 					 &release, NULL);
+	if (ret)
+		return;
 
 	cmd = (struct qxl_cursor_cmd *) qxl_release_map(qdev, release);
 
