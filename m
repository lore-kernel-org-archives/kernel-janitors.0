From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 07 Oct 2016 07:27:41 +0000
Subject: [PATCH] drm: Release resources with a safer function
Message-Id: <1475825261-7735-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475388082-12656-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1475388082-12656-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We should use 'ida_simple_remove()' instead of 'ida_remove()' when freeing
resources allocated with 'ida_simple_get()'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/drm_connector.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 2e7430283043..2db7fb510b6c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -341,11 +341,11 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	list_for_each_entry_safe(mode, t, &connector->modes, head)
 		drm_mode_remove(connector, mode);
 
-	ida_remove(&drm_connector_enum_list[connector->connector_type].ida,
-		   connector->connector_type_id);
+	ida_simple_remove(&drm_connector_enum_list[connector->connector_type].ida,
+			  connector->connector_type_id);
 
-	ida_remove(&dev->mode_config.connector_ida,
-		   connector->index);
+	ida_simple_remove(&dev->mode_config.connector_ida,
+			  connector->index);
 
 	kfree(connector->display_info.bus_formats);
 	drm_mode_object_unregister(dev, &connector->base);
-- 
2.7.4

