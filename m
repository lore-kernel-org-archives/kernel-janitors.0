From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:20:23 +0000
Subject: [patch] gma500: remove duplicate FB_REG09 define
Message-Id: <20140609152023.GO9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The FB_REG09 define is cut and pasted twice so we can remove the second
instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index a97e38e..d75ecb3 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -39,7 +39,6 @@ static void mid_get_fuse_settings(struct drm_device *dev)
 #define FB_REG06 0xD0810600
 #define FB_MIPI_DISABLE  (1 << 11)
 #define FB_REG09 0xD0810900
-#define FB_REG09 0xD0810900
 #define FB_SKU_MASK  0x7000
 #define FB_SKU_SHIFT 12
 #define FB_SKU_100 0
