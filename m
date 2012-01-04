From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jan 2012 07:26:10 +0000
Subject: [patch] gma500: silence gcc warnings in mid_get_vbt_data()
Message-Id: <20120104072610.GH30978@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Dave Airlie <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>

Add a cast here to silence a Gcc warning.
drivers/gpu/drm/gma500/mid_bios.c:214:28: warning:
  cast from pointer to integer of different size [-Wpointer-to-int-cast]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Compile tested only.

diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index 55fee10..5eee9ad 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -202,7 +202,7 @@ static void mid_get_vbt_data(struct drm_psb_private *dev_priv)
 		/*so, some values have changed location*/
 		new_size = vbt->checksum; /*checksum contains lo size byte*/
 		/*LSB of oaktrail_gct contains hi size byte*/
-		new_size |= ((0xff & (unsigned int)vbt->oaktrail_gct)) << 8;
+		new_size |= ((0xff & (unsigned int)(long)vbt->oaktrail_gct)) << 8;
 
 		vbt->checksum = vbt->size; /*size contains the checksum*/
 		if (new_size > 0xff)
@@ -211,8 +211,8 @@ static void mid_get_vbt_data(struct drm_psb_private *dev_priv)
 			vbt->size = new_size;
 
 		/* number of descriptors defined in the GCT */
-		number_desc = ((0xff00 & (unsigned int)vbt->oaktrail_gct)) >> 8;
-		bpi = ((0xff0000 & (unsigned int)vbt->oaktrail_gct)) >> 16;
+		number_desc = ((0xff00 & (unsigned int)(long)vbt->oaktrail_gct)) >> 8;
+		bpi = ((0xff0000 & (unsigned int)(long)vbt->oaktrail_gct)) >> 16;
 		vbt->oaktrail_gct = ioremap(addr + GCT_R10_HEADER_SIZE,
 				GCT_R10_DISPLAY_DESC_SIZE * number_desc);
 		pGCT = vbt->oaktrail_gct;
