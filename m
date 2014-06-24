From: Masaru Nomura <massa.nomura@gmail.com>
Date: Tue, 24 Jun 2014 21:52:12 +0000
Subject: [PATCH 1/3] gpu: drm: vmwgfx: Fix memory leak by adding drm_ht_remove()
Message-Id: <1403646734-2838-2-git-send-email-massa.nomura@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1403646734-2838-1-git-send-email-massa.nomura@gmail.com>
In-Reply-To: <1403646734-2838-1-git-send-email-massa.nomura@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie
Cc: thellstrom@vmware.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Masaru Nomura <massa.nomura@gmail.com>

drm_ht_remove() should be called in vmw_compat_shader_man_destroy()
This is because memory was allocated for (&man->shaders)->table by
vmw_compat_shader_man_create() -> drm_ht_create()
but this memory is not freed when vmw_compat_shader_mager is destroied.

Signed-off-by: Masaru Nomura <massa.nomura@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index c1559eea..01cc8ea 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -806,6 +806,8 @@ void vmw_compat_shader_man_destroy(struct vmw_compat_shader_manager *man)
 	list_for_each_entry_safe(entry, next, &man->list, head)
 		vmw_compat_shader_free(man, entry);
 
+	drm_ht_remove(&man->shaders);
+
 	mutex_unlock(&man->dev_priv->cmdbuf_mutex);
 	kfree(man);
 }
-- 
1.9.3

