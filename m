From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Feb 2014 16:04:16 +0000
Subject: [patch] drm/vmwgfx: add error checking for kmalloc()
Message-Id: <20140211160416.GB9406@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Brian Paul <brianp@vmware.com>

Return -ENOMEM if kmalloc() fails.

Fixes: d5bde956630b ('drm/vmwgfx: Emulate legacy shaders on guest-backed devices v2')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index 217d941b8176..23a32fd59a57 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -779,6 +779,8 @@ vmw_compat_shader_man_create(struct vmw_private *dev_priv)
 	int ret;
 
 	man = kzalloc(sizeof(*man), GFP_KERNEL);
+	if (!man)
+		return ERR_PTR(-ENOMEM);
 
 	man->dev_priv = dev_priv;
 	INIT_LIST_HEAD(&man->list);
