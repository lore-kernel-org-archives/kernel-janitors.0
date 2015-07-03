From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Jul 2015 08:54:28 +0000
Subject: [patch] drm/radeon: fix underflow in r600_cp_dispatch_texture()
Message-Id: <20150703085428.GB11901@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: kernel-janitors@vger.kernel.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org

The "if (pass_size > buf->total)" can underflow so I have changed the
type of size and pass_size to unsigned to avoid this problem.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This code is on the way out, but whatever.  I may as well send this
patch since I already wrote the patch.

diff --git a/drivers/gpu/drm/radeon/r600_cp.c b/drivers/gpu/drm/radeon/r600_cp.c
index 09e3f39..98f9ada 100644
--- a/drivers/gpu/drm/radeon/r600_cp.c
+++ b/drivers/gpu/drm/radeon/r600_cp.c
@@ -2483,7 +2483,7 @@ int r600_cp_dispatch_texture(struct drm_device *dev,
 	struct drm_buf *buf;
 	u32 *buffer;
 	const u8 __user *data;
-	int size, pass_size;
+	unsigned int size, pass_size;
 	u64 src_offset, dst_offset;
 
 	if (!radeon_check_offset(dev_priv, tex->offset)) {
