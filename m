From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 02 Oct 2016 06:01:22 +0000
Subject: [PATCH] drm: Release resources with a safer function
Message-Id: <1475388082-12656-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We should use 'ida_simple_remove()' instead of 'ida_remove()' when freeing
resources allocated with 'ida_simple_get()'.

This as been spotted with the following coccinelle script which tries to
detect missing 'ida_simple_remove()' call in error handling paths.

///////////////
@@
expression x;
identifier l;
@@

*   x = ida_simple_get(...);
    ...
    if (...) {
    ...
    }
    ...
    if (...) {
       ...
       goto l;
    }
    ...
*   l: ... when != ida_simple_remove(...);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/drm_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 26bb78c76481..2e7430283043 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -250,10 +250,10 @@ int drm_connector_init(struct drm_device *dev,
 	connector->debugfs_entry = NULL;
 out_put_type_id:
 	if (ret)
-		ida_remove(connector_ida, connector->connector_type_id);
+		ida_simple_remove(connector_ida, connector->connector_type_id);
 out_put_id:
 	if (ret)
-		ida_remove(&config->connector_ida, connector->index);
+		ida_simple_remove(&config->connector_ida, connector->index);
 out_put:
 	if (ret)
 		drm_mode_object_unregister(dev, &connector->base);
-- 
2.7.4

