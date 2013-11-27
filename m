From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Nov 2013 22:12:40 +0000
Subject: [patch] drm/sysfs: testing the wrong variable in drm_sysfs_device_add()
Message-Id: <20131127221240.GA20822@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

There is a typo here so we don't check for allocation failure properly.

Fixes: 760c960bd688 ('drm/sysfs: fix hotplug regression since lifetime changes')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index bd2bca395792..c22c3097c3e8 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -516,7 +516,7 @@ int drm_sysfs_device_add(struct drm_minor *minor)
                 minor_str = "card%d";
 
 	minor->kdev = kzalloc(sizeof(*minor->kdev), GFP_KERNEL);
-	if (!minor->dev) {
+	if (!minor->kdev) {
 		r = -ENOMEM;
 		goto error;
 	}
