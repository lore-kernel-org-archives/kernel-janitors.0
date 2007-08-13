From: "Scott Thompson" <postfail@hushmail.com>
Date: Mon, 13 Aug 2007 04:04:05 +0000
Subject: [PATCH 3 of 5 ] /drivers/char/drm ioremap balancing/ returncode check
Message-Id: <20070813040406.1E2EBDA820@mailserver8.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.sourceforge.net

patchset against 2.6.23-rc2 and this set is an audit of 
/drivers/char/a* 
through drivers/char .   

this corrects missing ioremap return checks and balancing on 
iounmap calls..

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
----------------------------------------------------------
diff --git a/drivers/char/drm/drm_bufs.c 
b/drivers/char/drm/drm_bufs.c
index 923174c..448488b 100644
--- a/drivers/char/drm/drm_bufs.c
+++ b/drivers/char/drm/drm_bufs.c
@@ -177,8 +177,13 @@ static int drm_addmap_core(struct drm_device * 
dev, unsigned int offset,
 						     MTRR_TYPE_WRCOMB, 1);
 			}
 		}
-		if (map->type = _DRM_REGISTERS)
+		if (map->type = _DRM_REGISTERS) {
 			map->handle = ioremap(map->offset, map->size);
+			if (!map->handle) {
+				drm_free(map, sizeof(*map), DRM_MEM_MAPS);
+				return -ENOMEM;
+			}
+		}
 		break;
 	case _DRM_SHM:
 		list = drm_find_matching_map(dev, map);

