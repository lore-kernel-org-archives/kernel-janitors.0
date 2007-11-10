From: Nicolas Kaiser <nikai@nikai.net>
Date: Sat, 10 Nov 2007 12:10:13 +0000
Subject: [PATCH] drivers/char/drm: remove duplicated defines
Message-Id: <20071110131013.56206721@lucky.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove duplicated defines.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---

 drivers/char/drm/r300_reg.h    |    4 ----
 drivers/char/drm/radeon_drv.h  |    2 --
 drivers/char/drm/via_3d_reg.h  |   17 -----------------
 drivers/char/drm/via_dmablit.h |    1 -
 4 files changed, 24 deletions(-)

diff -ur a/drivers/char/drm/r300_reg.h b/drivers/char/drm/r300_reg.h
--- a/drivers/char/drm/r300_reg.h	2007-10-09 22:31:38.000000000 +0200
+++ b/drivers/char/drm/r300_reg.h	2007-11-09 22:20:16.000000000 +0100
@@ -1361,10 +1361,6 @@
 #       define R300_RB3D_Z_TEST                  0x00000012
 #       define R300_RB3D_Z_TEST_AND_WRITE        0x00000016
 #       define R300_RB3D_Z_WRITE_ONLY        	 0x00000006
-
-#       define R300_RB3D_Z_TEST                  0x00000012
-#       define R300_RB3D_Z_TEST_AND_WRITE        0x00000016
-#       define R300_RB3D_Z_WRITE_ONLY        	 0x00000006
 #	define R300_RB3D_STENCIL_ENABLE		 0x00000001
 
 #define R300_RB3D_ZSTENCIL_CNTL_1                   0x4F04
diff -ur a/drivers/char/drm/radeon_drv.h b/drivers/char/drm/radeon_drv.h
--- a/drivers/char/drm/radeon_drv.h	2007-11-07 11:26:10.000000000 +0100
+++ b/drivers/char/drm/radeon_drv.h	2007-11-09 21:21:54.000000000 +0100
@@ -717,7 +717,6 @@
 #	define RADEON_WAIT_HOST_IDLECLEAN	(1 << 18)
 
 #define RADEON_RB3D_ZMASKOFFSET		0x3234
-#define RADEON_RB3D_ZSTENCILCNTL	0x1c2c
 #	define RADEON_DEPTH_FORMAT_16BIT_INT_Z	(0 << 0)
 #	define RADEON_DEPTH_FORMAT_24BIT_INT_Z	(2 << 0)
 
@@ -920,7 +919,6 @@
 #define R200_RE_SCISSOR_TL_1              0x1ce0
 #define R200_RE_SCISSOR_TL_2              0x1ce8
 #define R200_RB3D_DEPTHXY_OFFSET          0x1d60
-#define R200_RE_AUX_SCISSOR_CNTL          0x26f0
 #define R200_SE_VTX_STATE_CNTL            0x2180
 #define R200_RE_POINTSIZE                 0x2648
 #define R200_SE_TCL_INPUT_VTX_VECTOR_ADDR_0 0x2254
diff -ur a/drivers/char/drm/via_3d_reg.h b/drivers/char/drm/via_3d_reg.h
--- a/drivers/char/drm/via_3d_reg.h	2007-10-09 22:31:38.000000000 +0200
+++ b/drivers/char/drm/via_3d_reg.h	2007-11-09 21:47:49.000000000 +0100
@@ -1625,23 +1625,6 @@
 #define HALCYON_SUB_ADDR0   0X00000000
 #define HALCYON_HEADER1MASK 0XFFFFFC00
 #define HALCYON_HEADER1     0XF0000000
-#define HC_SubA_HAGPBstL        0x0060
-#define HC_SubA_HAGPBendL       0x0061
-#define HC_SubA_HAGPCMNT        0x0062
-#define HC_SubA_HAGPBpL         0x0063
-#define HC_SubA_HAGPBpH         0x0064
-#define HC_HAGPCMNT_MASK        0x00800000
-#define HC_HCmdErrClr_MASK      0x00400000
-#define HC_HAGPBendH_MASK       0x0000ff00
-#define HC_HAGPBstH_MASK        0x000000ff
-#define HC_HAGPBendH_SHIFT      8
-#define HC_HAGPBstH_SHIFT       0
-#define HC_HAGPBpL_MASK         0x00fffffc
-#define HC_HAGPBpID_MASK        0x00000003
-#define HC_HAGPBpID_PAUSE       0x00000000
-#define HC_HAGPBpID_JUMP        0x00000001
-#define HC_HAGPBpID_STOP        0x00000002
-#define HC_HAGPBpH_MASK         0x00ffffff
 
 #define VIA_VIDEO_HEADER5       0xFE040000
 #define VIA_VIDEO_HEADER6       0xFE050000
diff -ur a/drivers/char/drm/via_dmablit.h b/drivers/char/drm/via_dmablit.h
--- a/drivers/char/drm/via_dmablit.h	2007-10-09 22:31:38.000000000 +0200
+++ b/drivers/char/drm/via_dmablit.h	2007-11-09 21:40:08.000000000 +0100
@@ -133,7 +133,6 @@
 #define VIA_DMA_CSR_TA		(1<<2)	/* transfer abort */
 #define VIA_DMA_CSR_TD		(1<<3)	/* transfer done */
 #define VIA_DMA_CSR_DD		(1<<4)	/* descriptor done */
-#define VIA_DMA_DPR_EC          (1<<1)  /* end of chain */
 
 
 
