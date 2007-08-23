From: Scott Thompson <postfailathushmaildotcom@yahoo.com>
Date: Thu, 23 Aug 2007 03:26:01 +0000
Subject: [PATCH 3 of 5 resend ] /drivers/char/drm ioremap balancing/ returncode check
Message-Id: <525882.95198.qm@web44909.mail.sp1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

patchset against 2.6.23-rc3.  
corrects missing ioremap return checks and balancing on iounmap calls, integrated changes per list
recommendations on the original set of patches..

Warning -- cleanup handler here may miss additional required cleanup as has occurred on other
portions of ioremap audit.

This patch had been submitted previously but hushmail client caused wordwrap issues, resending
with different mail client.

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
----------------------------------------------------------
diff --git a/drivers/char/drm/drm_bufs.c b/drivers/char/drm/drm_bufs.c
index 923174c..448488b 100644
--- a/drivers/char/drm/drm_bufs.c
+++ b/drivers/char/drm/drm_bufs.c
@@ -177,8 +177,13 @@ static int drm_addmap_core(struct drm_device * dev, unsigned
 						     MTRR_TYPE_WRCOMB, 1);
 			}
 		}
-		if (map->type = _DRM_REGISTERS)
+		if (map->type = _DRM_REGISTERS){
 			map->handle = ioremap(map->offset, map->size);
+			if (!map->handle) {
+				drm_free(map, sizeof(*map), DRM_MEM_MAPS);
+				return -ENOMEM;
+			}
+		}
 		break;
 	case _DRM_SHM:
 		list = drm_find_matching_map(dev, map);


       
____________________________________________________________________________________
Be a better Heartthrob. Get better relationship answers from someone who knows. Yahoo! Answers -
Check it out. 
http://answers.yahoo.com/dir/?link=list&sid96545433


       
____________________________________________________________________________________
Take the Internet to Go: Yahoo!Go puts the Internet in your pocket: mail, news, photos & more. 
http://mobile.yahoo.com/go?refer=1GNXIC

