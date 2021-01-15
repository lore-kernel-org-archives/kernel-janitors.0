From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Jan 2021 13:09:11 +0000
Subject: [PATCH][next] drm/vkms: Fix missing kmalloc allocation failure check
Message-Id: <20210115130911.71073-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Sumera Priyadarsini <sylphrenadin@gmail.com>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the kmalloc allocation for config is not being null
checked and could potentially lead to a null pointer dereference.
Fix this by adding the missing null check.

Addresses-Coverity: ("Dereference null return value")
Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 708f7f54001d..2173b82606f6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -188,7 +188,11 @@ static int vkms_create(struct vkms_config *config)
 
 static int __init vkms_init(void)
 {
-	struct vkms_config *config = kmalloc(sizeof(*config), GFP_KERNEL);
+	struct vkms_config *config;
+
+	config = kmalloc(sizeof(*config), GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
 
 	default_config = config;
 
-- 
2.29.2
