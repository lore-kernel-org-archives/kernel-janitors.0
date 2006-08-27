From: James Nelson <james4765@gmail.com>
Date: Sun, 27 Aug 2006 20:25:01 +0000
Subject: [KJ] [PATCH] sis: Remove kernel version-specific preprocessor
Message-Id: <20060827202501.15103.18236.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch removes a lot of version-specific preprocessor directives and associated code.
Left one in that relates to current development, though.

 init.h       |    7 -
 init301.h    |    7 -
 initextlfb.c |    4
 osdef.h      |    9 -
 sis.h        |   58 ---------
 sis_accel.c  |   24 ---
 sis_accel.h  |   13 --
 sis_main.c   |  363 -----------------------------------------------------------
 sis_main.h   |   65 ----------
 vgatypes.h   |    2
 10 files changed, 1 insertion(+), 551 deletions(-)


Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/drivers/video/sis/init.h b/drivers/video/sis/init.h
index 7ecab87..59d1284 100644
--- a/drivers/video/sis/init.h
+++ b/drivers/video/sis/init.h
@@ -77,16 +77,9 @@ #include <linux/version.h>
 #include <linux/types.h>
 #include <asm/io.h>
 #include <linux/fb.h>
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#include <video/fbcon.h>
-#endif
 #include "sis.h"
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#include <linux/sisfb.h>
-#else
 #include <video/sisfb.h>
 #endif
-#endif
 
 /* Mode numbers */
 static const unsigned short ModeIndex_320x200[]      = {0x59, 0x41, 0x00, 0x4f};
diff --git a/drivers/video/sis/init301.h b/drivers/video/sis/init301.h
index bc321dc..4f3a286 100644
--- a/drivers/video/sis/init301.h
+++ b/drivers/video/sis/init301.h
@@ -71,16 +71,9 @@ #include <linux/version.h>
 #include <linux/types.h>
 #include <asm/io.h>
 #include <linux/fb.h>
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#include <video/fbcon.h>
-#endif
 #include "sis.h"
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#include <linux/sisfb.h>
-#else
 #include <video/sisfb.h>
 #endif
-#endif
 
 static const unsigned char SiS_YPbPrTable[3][64] = {
   {
diff --git a/drivers/video/sis/initextlfb.c b/drivers/video/sis/initextlfb.c
index 09f5d75..c3884a2 100644
--- a/drivers/video/sis/initextlfb.c
+++ b/drivers/video/sis/initextlfb.c
@@ -34,12 +34,10 @@ #include <linux/version.h>
 #include <linux/types.h>
 #include <linux/fb.h>
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 int		sisfb_mode_rate_to_dclock(struct SiS_Private *SiS_Pr,
 			unsigned char modeno, unsigned char rateindex);
 int		sisfb_mode_rate_to_ddata(struct SiS_Private *SiS_Pr, unsigned char modeno,
 			unsigned char rateindex, struct fb_var_screeninfo *var);
-#endif
 BOOLEAN		sisfb_gettotalfrommode(struct SiS_Private *SiS_Pr, unsigned char modeno,
 			int *htotal, int *vtotal, unsigned char rateindex);
 
@@ -49,7 +47,6 @@ extern BOOLEAN	SiS_SearchModeID(struct S
 extern void	SiS_Generic_ConvertCRData(struct SiS_Private *SiS_Pr, unsigned char *crdata,
 			int xres, int yres, struct fb_var_screeninfo *var, BOOLEAN writeres);
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 int
 sisfb_mode_rate_to_dclock(struct SiS_Private *SiS_Pr, unsigned char modeno,
 			unsigned char rateindex)
@@ -177,7 +174,6 @@ #endif
 
     return 1;
 }
-#endif /* Linux >= 2.5 */
 
 BOOLEAN
 sisfb_gettotalfrommode(struct SiS_Private *SiS_Pr, unsigned char modeno, int *htotal,
diff --git a/drivers/video/sis/osdef.h b/drivers/video/sis/osdef.h
index f595680..c149278 100644
--- a/drivers/video/sis/osdef.h
+++ b/drivers/video/sis/osdef.h
@@ -58,9 +58,6 @@ #define _SIS_OSDEF_H_
 #define SIS_LINUX_KERNEL		/* Linux kernel framebuffer */
 #undef  SIS_XORG_XF86			/* XFree86/X.org */
 
-#undef SIS_LINUX_KERNEL_24
-#undef SIS_LINUX_KERNEL_26
-
 #ifdef OutPortByte
 #undef OutPortByte
 #endif
@@ -100,12 +97,6 @@ #ifdef CONFIG_FB_SIS_315
 #define SIS315H
 #endif
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-#define SIS_LINUX_KERNEL_26
-#else
-#define SIS_LINUX_KERNEL_24
-#endif
-
 #if !defined(SIS300) && !defined(SIS315H)
 #warning Neither CONFIG_FB_SIS_300 nor CONFIG_FB_SIS_315 is set
 #warning sisfb will not work!
diff --git a/drivers/video/sis/sis.h b/drivers/video/sis/sis.h
index a259446..1414116 100644
--- a/drivers/video/sis/sis.h
+++ b/drivers/video/sis/sis.h
@@ -27,11 +27,7 @@ #define _SIS_H_
 #include <linux/version.h>
 
 #include "osdef.h"
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 #include <video/sisfb.h>
-#else
-#include <linux/sisfb.h>
-#endif
 
 #include "vgatypes.h"
 #include "vstruct.h"
@@ -40,42 +36,18 @@ #define VER_MAJOR		1
 #define VER_MINOR		8
 #define VER_LEVEL		9
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 #include <linux/spinlock.h>
 #define SIS_PCI_GET_CLASS(a, b) pci_get_class(a, b)
 #define SIS_PCI_GET_DEVICE(a,b,c) pci_get_device(a,b,c)
 #define SIS_PCI_GET_SLOT(a,b) pci_get_slot(a,b)
 #define SIS_PCI_PUT_DEVICE(a) pci_dev_put(a)
 #ifdef CONFIG_COMPAT
-#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,10)
-#include <linux/ioctl32.h>
-#define SIS_OLD_CONFIG_COMPAT
-#else
 #include <linux/smp_lock.h>
 #define SIS_NEW_CONFIG_COMPAT
-#endif
 #endif	/* CONFIG_COMPAT */
-#else  /* 2.4 */
-#define SIS_PCI_GET_CLASS(a, b) pci_find_class(a, b)
-#define SIS_PCI_GET_DEVICE(a,b,c) pci_find_device(a,b,c)
-#define SIS_PCI_GET_SLOT(a,b) pci_find_slot(a,b)
-#define SIS_PCI_PUT_DEVICE(a)
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,19)
-#ifdef __x86_64__	/* Shouldn't we check for CONFIG_IA32_EMULATION here? */
-#include <asm/ioctl32.h>
-#define SIS_OLD_CONFIG_COMPAT
-#endif
-#endif
-#endif /* 2.4 */
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,8)
 #define SIS_IOTYPE1 void __iomem
 #define SIS_IOTYPE2 __iomem
 #define SISINITSTATIC static
-#else
-#define SIS_IOTYPE1 unsigned char
-#define SIS_IOTYPE2
-#define SISINITSTATIC
-#endif
 
 #undef SISFBDEBUG
 
@@ -498,26 +470,8 @@ struct sis_video_info {
 
 	struct fb_var_screeninfo default_var;
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 	struct fb_fix_screeninfo sisfb_fix;
 	u32		pseudo_palette[17];
-#endif
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-	struct display		 sis_disp;
-	struct display_switch 	 sisfb_sw;
-	struct {
-		u16 red, green, blue, pad;
-	}		sis_palette[256];
-	union {
-#ifdef FBCON_HAS_CFB16
-		u16 cfb16[16];
-#endif
-#ifdef FBCON_HAS_CFB32
-		u32 cfb32[16];
-#endif
-	}		sis_fbcon_cmap;
-#endif
 
 	struct sisfb_monitor {
 		u16 hmin;
@@ -538,10 +492,6 @@ #endif
 
 	int		mni;	/* Mode number index */
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-	int		currcon;
-#endif
-
 	unsigned long	video_size;
 	unsigned long	video_base;
 	unsigned long	mmio_size;
@@ -578,9 +528,6 @@ #endif
 	int		sisfb_tvplug;
 	int		sisfb_tvstd;
 	int		sisfb_nocrt2rate;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-	int		sisfb_inverse;
-#endif
 
 	u32		heapstart;		/* offset  */
 	SIS_IOTYPE1	*sisfb_heap_start;	/* address */
@@ -646,17 +593,12 @@ #endif
 	int		modechanged;
 	unsigned char	modeprechange;
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 	u8		sisfb_lastrates[128];
-#endif
 
 	int		newrom;
 	int		haveXGIROM;
 	int		registered;
 	int		warncount;
-#ifdef SIS_OLD_CONFIG_COMPAT
-	int		ioctl32registered;
-#endif
 
 	int		sisvga_engine;
 	int		hwcursor_size;
diff --git a/drivers/video/sis/sis_accel.c b/drivers/video/sis/sis_accel.c
index 3b7ce03..3fe18d1 100644
--- a/drivers/video/sis/sis_accel.c
+++ b/drivers/video/sis/sis_accel.c
@@ -32,22 +32,11 @@ #include <linux/version.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/fb.h>
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#include <linux/console.h>
-#endif
 #include <linux/ioport.h>
 #include <linux/types.h>
 
 #include <asm/io.h>
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#include <video/fbcon.h>
-#include <video/fbcon-cfb8.h>
-#include <video/fbcon-cfb16.h>
-#include <video/fbcon-cfb24.h>
-#include <video/fbcon-cfb32.h>
-#endif
-
 #include "sis.h"
 #include "sis_accel.h"
 
@@ -91,11 +80,9 @@ static const u8 sisPatALUConv[]      0xFF,       /* dest = 0xFF;         1,      GXset,          0xF */
 };
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,34)
 static const int myrops[] = {
    	3, 10, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3
 };
-#endif
 
 /* 300 series ----------------------------------------------------- */
 #ifdef CONFIG_FB_SIS_300
@@ -315,8 +302,6 @@ #endif
 	}
 }
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)  /* --------------- 2.5 --------------- */
-
 int fbcon_sis_sync(struct fb_info *info)
 {
 	struct sis_video_info *ivideo = (struct sis_video_info *)info->par;
@@ -439,12 +424,3 @@ #endif
 	sisfb_syncaccel(ivideo);
 }
 
-#endif
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)  /* -------------- 2.4 --------------- */
-
-#include "sisfb_accel_2_4.h"
-
-#endif /* KERNEL VERSION */
-
-
diff --git a/drivers/video/sis/sis_accel.h b/drivers/video/sis/sis_accel.h
index 046e2c4..ec44da5 100644
--- a/drivers/video/sis/sis_accel.h
+++ b/drivers/video/sis/sis_accel.h
@@ -394,21 +394,8 @@ #define SiS310DoCMD \
 int  sisfb_initaccel(struct sis_video_info *ivideo);
 void sisfb_syncaccel(struct sis_video_info *ivideo);
 
-#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,5,33)
-void fbcon_sis_bmove(struct display *p, int srcy, int srcx, int dsty,
-			int dstx, int height, int width);
-void fbcon_sis_revc(struct display *p, int srcy, int srcx);
-void fbcon_sis_clear8(struct vc_data *conp, struct display *p, int srcy,
-			int srcx, int height, int width);
-void fbcon_sis_clear16(struct vc_data *conp, struct display *p, int srcy,
-			int srcx, int height, int width);
-void fbcon_sis_clear32(struct vc_data *conp, struct display *p, int srcy,
-			int srcx, int height, int width);
-#endif
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,34)
 int  fbcon_sis_sync(struct fb_info *info);
 void fbcon_sis_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 void fbcon_sis_copyarea(struct fb_info *info, const struct fb_copyarea *area);
-#endif
 
 #endif
diff --git a/drivers/video/sis/sis_main.c b/drivers/video/sis/sis_main.c
index 895ebda..2067212 100644
--- a/drivers/video/sis/sis_main.c
+++ b/drivers/video/sis/sis_main.c
@@ -35,9 +35,7 @@
 
 #include <linux/version.h>
 #include <linux/module.h>
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 #include <linux/moduleparam.h>
-#endif
 #include <linux/kernel.h>
 #include <linux/smp_lock.h>
 #include <linux/spinlock.h>
@@ -58,9 +56,6 @@ #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/pci.h>
 #include <linux/vmalloc.h>
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#include <linux/vt_kern.h>
-#endif
 #include <linux/capability.h>
 #include <linux/fs.h>
 #include <linux/types.h>
@@ -70,35 +65,9 @@ #ifdef CONFIG_MTRR
 #include <asm/mtrr.h>
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#include <video/fbcon.h>
-#include <video/fbcon-cfb8.h>
-#include <video/fbcon-cfb16.h>
-#include <video/fbcon-cfb24.h>
-#include <video/fbcon-cfb32.h>
-#endif
-
 #include "sis.h"
 #include "sis_main.h"
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,3)
-#error "This version of sisfb requires at least 2.6.3"
-#endif
-#endif
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#ifdef FBCON_HAS_CFB8
-extern struct display_switch fbcon_sis8;
-#endif
-#ifdef FBCON_HAS_CFB16
-extern struct display_switch fbcon_sis16;
-#endif
-#ifdef FBCON_HAS_CFB32
-extern struct display_switch fbcon_sis32;
-#endif
-#endif
-
 static void sisfb_handle_command(struct sis_video_info *ivideo,
 				 struct sisfb_cmd *sisfb_command);
 
@@ -114,17 +83,7 @@ sisfb_setdefaultparms(void)
 	sisfb_max		= -1;
 	sisfb_userom		= -1;
 	sisfb_useoem		= -1;
-#ifdef MODULE
-	/* Module: "None" for 2.4, default mode for 2.5+ */
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 	sisfb_mode_idx		= -1;
-#else
-	sisfb_mode_idx		= MODE_INDEX_NONE;
-#endif
-#else
-	/* Static: Default mode */
-	sisfb_mode_idx		= -1;
-#endif
 	sisfb_parm_rate		= -1;
 	sisfb_crt1off		= 0;
 	sisfb_forcecrt1		= -1;
@@ -142,10 +101,6 @@ #endif
 	sisfb_tvxposoffset	= 0;
 	sisfb_tvyposoffset	= 0;
 	sisfb_nocrt2rate	= 0;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-	sisfb_inverse		= 0;
-	sisfb_fontname[0]	= 0;
-#endif
 #if !defined(__i386__) && !defined(__x86_64__)
 	sisfb_resetcard		= 0;
 	sisfb_videoram		= 0;
@@ -162,14 +117,10 @@ sisfb_search_vesamode(unsigned int vesam
 	/* We don't know the hardware specs yet and there is no ivideo */
 
 	if(vesamode = 0) {
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-		sisfb_mode_idx = MODE_INDEX_NONE;
-#else
 		if(!quiet)
 			printk(KERN_ERR "sisfb: Invalid mode. Using default.\n");
 
 		sisfb_mode_idx = DEFAULT_MODE;
-#endif
 		return;
 	}
 
@@ -215,7 +166,6 @@ sisfb_search_mode(char *name, BOOLEAN qu
 		return;
 	}
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 	if(!strnicmp(name, sisbios_mode[MODE_INDEX_NONE].name, strlen(name))) {
 		if(!quiet)
 			printk(KERN_ERR "sisfb: Mode 'none' not supported anymore. Using default.\n");
@@ -223,7 +173,6 @@ #if LINUX_VERSION_CODE >= KERNEL_VERSION
 		sisfb_mode_idx = DEFAULT_MODE;
 		return;
 	}
-#endif
 	if(strlen(name) <= 19) {
 		strcpy(strbuf1, name);
 		for(i = 0; i < strlen(strbuf1); i++) {
@@ -1216,12 +1165,7 @@ sisfb_set_mode(struct sis_video_info *iv
 {
 	unsigned short modeno = ivideo->mode_no;
 
-	/* >=2.6.12's fbcon clears the screen anyway */
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,12)
-	if(!clrscrn) modeno |= 0x80;
-#else
 	modeno |= 0x80;
-#endif
 
 	outSISIDXREG(SISSR, IND_SIS_PASSWORD, SIS_PASSWORD);
 
@@ -1315,20 +1259,7 @@ sisfb_do_set_var(struct fb_var_screeninf
 		ivideo->refresh_rate = 60;
 	}
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-	if(ivideo->sisfb_thismonitor.datavalid) {
-		if(!sisfb_verify_rate(ivideo, &ivideo->sisfb_thismonitor, ivideo->sisfb_mode_idx,
-	                         ivideo->rate_idx, ivideo->refresh_rate)) {
-			printk(KERN_INFO "sisfb: WARNING: Refresh rate exceeds monitor specs!\n");
-		}
-	}
-#endif
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-	if(((var->activate & FB_ACTIVATE_MASK) = FB_ACTIVATE_NOW) && isactive) {
-#else
 	if(isactive) {
-#endif
 		/* If acceleration to be used? Need to know
 		 * before pre/post_set_mode()
 		 */
@@ -1367,9 +1298,7 @@ #endif
 		ivideo->current_linelength = ivideo->video_linelength;
 		ivideo->current_pixclock = var->pixclock;
 		ivideo->current_refresh_rate = ivideo->refresh_rate;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 		ivideo->sisfb_lastrates[ivideo->mode_no] = ivideo->refresh_rate;
-#endif
 	}
 
 	return 0;
@@ -1435,17 +1364,7 @@ sisfb_pan_var(struct sis_video_info *ivi
 	return 0;
 }
 
-/* ------------ FBDev related routines for 2.4 series ----------- */
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-
-#include "sisfb_fbdev_2_4.h"
-
-#endif
-
-/* ------------ FBDev related routines for 2.6 series ----------- */
-
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
+/* ------------ FBDev related routines ----------- */
 
 static int
 sisfb_open(struct fb_info *info, int user)
@@ -1506,11 +1425,7 @@ sisfb_set_par(struct fb_info *info)
 	if((err = sisfb_do_set_var(&info->var, 1, info)))
 		return err;
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,10)
-	sisfb_get_fix(&info->fix, info->currcon, info);
-#else
 	sisfb_get_fix(&info->fix, -1, info);
-#endif
 	return 0;
 }
 
@@ -1744,18 +1659,10 @@ sisfb_blank(int blank, struct fb_info *i
 	return sisfb_myblank(ivideo, blank);
 }
 
-#endif
-
 /* ----------- FBDev related routines for all series ---------- */
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15)
 static int	sisfb_ioctl(struct fb_info *info, unsigned int cmd,
 			    unsigned long arg)
-#else
-static int	sisfb_ioctl(struct inode *inode, struct file *file,
-				unsigned int cmd, unsigned long arg,
-				struct fb_info *info)
-#endif
 {
 	struct sis_video_info	*ivideo = (struct sis_video_info *)info->par;
 	struct sis_memreq	sismemreq;
@@ -1921,11 +1828,7 @@ #endif
 		break;
 
 	   default:
-#ifdef SIS_NEW_CONFIG_COMPAT
 		return -ENOIOCTLCMD;
-#else
-		return -EINVAL;
-#endif
 	}
 	return 0;
 }
@@ -1969,20 +1872,6 @@ sisfb_get_fix(struct fb_fix_screeninfo *
 
 /* ----------------  fb_ops structures ----------------- */
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-static struct fb_ops sisfb_ops = {
-	.owner		= THIS_MODULE,
-	.fb_get_fix	= sisfb_get_fix,
-	.fb_get_var	= sisfb_get_var,
-	.fb_set_var	= sisfb_set_var,
-	.fb_get_cmap	= sisfb_get_cmap,
-	.fb_set_cmap	= sisfb_set_cmap,
-	.fb_pan_display = sisfb_pan_display,
-	.fb_ioctl	= sisfb_ioctl
-};
-#endif
-
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 static struct fb_ops sisfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= sisfb_open,
@@ -1999,12 +1888,9 @@ #ifdef CONFIG_FB_SOFT_CURSOR
 	.fb_cursor	= soft_cursor,
 #endif
 	.fb_sync	= fbcon_sis_sync,
-#ifdef SIS_NEW_CONFIG_COMPAT
 	.fb_compat_ioctl= sisfb_ioctl,
-#endif
 	.fb_ioctl	= sisfb_ioctl
 };
-#endif
 
 /* ---------------- Chip generation dependent routines ---------------- */
 
@@ -4100,16 +3986,6 @@ sisfb_setup(char *options)
 			sisfb_search_mode(this_opt + 5, FALSE);
 		} else if(!strnicmp(this_opt, "vesa:", 5)) {
 			sisfb_search_vesamode(simple_strtoul(this_opt + 5, NULL, 0), FALSE);
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-		} else if(!strnicmp(this_opt, "inverse", 7)) {
-			sisfb_inverse = 1;
-			/* fb_invert_cmaps(); */
-		} else if(!strnicmp(this_opt, "font:", 5)) {
-			if(strlen(this_opt + 5) < 40) {
-			   strncpy(sisfb_fontname, this_opt + 5, sizeof(sisfb_fontname) - 1);
-			   sisfb_fontname[sizeof(sisfb_fontname) - 1] = '\0';
-			}
-#endif
 		} else if(!strnicmp(this_opt, "rate:", 5)) {
 			sisfb_parm_rate = simple_strtoul(this_opt + 5, NULL, 0);
 		} else if(!strnicmp(this_opt, "forcecrt1:", 10)) {
@@ -4217,7 +4093,6 @@ sisfb_find_rom(struct pci_dev *pdev)
 	SIS_IOTYPE1 *rom_base;
 	unsigned char *myrombase = NULL;
 	u32 temp;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,11)
 	size_t romsize;
 
 	/* First, try the official pci ROM functions (except
@@ -4248,7 +4123,6 @@ #if LINUX_VERSION_CODE >= KERNEL_VERSION
 	}
 
 	if(myrombase) return myrombase;
-#endif
 
 	/* Otherwise do it the conventional way. */
 
@@ -5870,17 +5744,9 @@ sisfb_probe(struct pci_dev *pdev, const 
 	if(sisfb_off)
 		return -ENXIO;
 
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,3))
 	sis_fb_info = framebuffer_alloc(sizeof(*ivideo), &pdev->dev);
 	if(!sis_fb_info)
 		return -ENOMEM;
-#else
-	sis_fb_info = kmalloc(sizeof(*sis_fb_info) + sizeof(*ivideo), GFP_KERNEL);
-	if(!sis_fb_info)
-		return -ENOMEM;
-	memset(sis_fb_info, 0, sizeof(*sis_fb_info) + sizeof(*ivideo));
-	sis_fb_info->par = ((char *)sis_fb_info + sizeof(*sis_fb_info));
-#endif
 
 	ivideo = (struct sis_video_info *)sis_fb_info->par;
 	ivideo->memyselfandi = sis_fb_info;
@@ -5910,9 +5776,6 @@ #endif
 	ivideo->pcifunc = PCI_FUNC(pdev->devfn);
 	ivideo->subsysvendor = pdev->subsystem_vendor;
 	ivideo->subsysdevice = pdev->subsystem_device;
-#ifdef SIS_OLD_CONFIG_COMPAT
-	ivideo->ioctl32registered = 0;
-#endif
 
 #ifndef MODULE
 	if(sisfb_mode_idx = -1) {
@@ -5937,7 +5800,6 @@ #endif
 	ivideo->engineok = 0;
 
 	ivideo->sisfb_was_boot_device = 0;
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12))
 	if(pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW) {
 		if(ivideo->sisvga_enabled)
 			ivideo->sisfb_was_boot_device = 1;
@@ -5948,7 +5810,6 @@ #if (LINUX_VERSION_CODE >= KERNEL_VERSIO
 				"as the primary VGA device\n");
 		}
 	}
-#endif
 
 	ivideo->sisfb_parm_mem = sisfb_parm_mem;
 	ivideo->sisfb_accel = sisfb_accel;
@@ -5970,9 +5831,6 @@ #endif
 	ivideo->tvxpos = sisfb_tvxposoffset;
 	ivideo->tvypos = sisfb_tvyposoffset;
 	ivideo->sisfb_nocrt2rate = sisfb_nocrt2rate;
-#if LINUX_VERSION_CODE <= KERNEL_VERSION(2,5,0)
-	ivideo->sisfb_inverse = sisfb_inverse;
-#endif
 
 	ivideo->refresh_rate = 0;
 	if(ivideo->sisfb_parm_rate != -1) {
@@ -6049,10 +5907,6 @@ #endif
 		}
 	}
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-	strcpy(sis_fb_info->modename, ivideo->myid);
-#endif
-
 	ivideo->SiS_Pr.ChipType = ivideo->chip;
 
 	ivideo->SiS_Pr.ivideo = (void *)ivideo;
@@ -6134,20 +5988,6 @@ #if defined(__i386__) || defined(__x86_6
 #endif
 	}
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-#ifdef MODULE
-	if((reg & 0x80) && (reg != 0xff)) {
-		if((sisbios_mode[ivideo->sisfb_mode_idx].mode_no[ivideo->mni])
-									!= 0xFF) {
-			printk(KERN_INFO "sisfb: Cannot initialize display mode, "
-					 "X server is active\n");
-			ret = -EBUSY;
-			goto error_4;
-		}
-	}
-#endif
-#endif
-
 	/* Search and copy ROM image */
 	ivideo->bios_abase = NULL;
 	ivideo->SiS_Pr.VirtualRomBase = NULL;
@@ -6281,9 +6121,6 @@ error_0:	iounmap(ivideo->video_vbase);
 error_1:	release_mem_region(ivideo->video_base, ivideo->video_size);
 error_2:	release_mem_region(ivideo->mmio_base, ivideo->mmio_size);
 error_3:	vfree(ivideo->bios_abase);
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-error_4:
-#endif
 		if(ivideo->lpcdev)
 			SIS_PCI_PUT_DEVICE(ivideo->lpcdev);
 		if(ivideo->nbridge)
@@ -6467,70 +6304,6 @@ #endif
 
 		sisfb_set_vparms(ivideo);
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-
-		/* ---------------- For 2.4: Now switch the mode ------------------ */
-
-		printk(KERN_INFO "sisfb: Setting mode %dx%dx%d (%dHz)\n",
-			ivideo->video_width, ivideo->video_height, ivideo->video_bpp,
-			ivideo->refresh_rate);
-
-		/* Determine whether or not acceleration is to be
-		 * used. Need to know before pre/post_set_mode()
-		 */
-		ivideo->accel = 0;
-		ivideo->default_var.accel_flags &= ~FB_ACCELF_TEXT;
-		if(ivideo->sisfb_accel) {
-			ivideo->accel = -1;
-			ivideo->default_var.accel_flags |= FB_ACCELF_TEXT;
-		}
-
-		/* Now switch the mode */
-		sisfb_pre_setmode(ivideo);
-
-		if(SiSSetMode(&ivideo->SiS_Pr, ivideo->mode_no) = 0) {
-			printk(KERN_ERR "sisfb: Fatal error: Setting mode[0x%x] failed\n",
-									ivideo->mode_no);
-			ret = -EINVAL;
-			iounmap(ivideo->mmio_vbase);
-			goto error_0;
-		}
-
-		outSISIDXREG(SISSR, IND_SIS_PASSWORD, SIS_PASSWORD);
-
-		sisfb_post_setmode(ivideo);
-
-		/* Maximize regardless of sisfb_max at startup */
-		ivideo->default_var.yres_virtual = 32767;
-
-		/* Force reset of x virtual in crtc_to_var */
-		ivideo->default_var.xres_virtual = 0;
-
-		/* Copy mode timing to var */
-		sisfb_crtc_to_var(ivideo, &ivideo->default_var);
-
-		/* Find out about screen pitch */
-		sisfb_calc_pitch(ivideo, &ivideo->default_var);
-		sisfb_set_pitch(ivideo);
-
-		/* Init the accelerator (does nothing currently) */
-		sisfb_initaccel(ivideo);
-
-		/* Init some fbinfo entries */
-		sis_fb_info->node  = -1;
-		sis_fb_info->flags = FBINFO_FLAG_DEFAULT;
-		sis_fb_info->fbops = &sisfb_ops;
-		sis_fb_info->disp  = &ivideo->sis_disp;
-		sis_fb_info->blank = &sisfb_blank;
-		sis_fb_info->switch_con = &sisfb_switch;
-		sis_fb_info->updatevar  = &sisfb_update_var;
-		sis_fb_info->changevar  = NULL;
-		strcpy(sis_fb_info->fontname, sisfb_fontname);
-
-		sisfb_set_disp(-1, &ivideo->default_var, sis_fb_info);
-
-#else		/* --------- For 2.6: Setup a somewhat sane default var ------------ */
-
 		printk(KERN_INFO "sisfb: Default mode is %dx%dx%d (%dHz)\n",
 			ivideo->video_width, ivideo->video_height, ivideo->video_bpp,
 			ivideo->refresh_rate);
@@ -6591,7 +6364,6 @@ #endif
 		sis_fb_info->pseudo_palette = ivideo->pseudo_palette;
 
 		fb_alloc_cmap(&sis_fb_info->cmap, 256 , 0);
-#endif		/* 2.6 */
 
 		printk(KERN_DEBUG "sisfb: Initial vbflags 0x%x\n", (int)ivideo->vbflags);
 
@@ -6603,10 +6375,6 @@ #ifdef CONFIG_MTRR
 		}
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-		vc_resize_con(1, 1, 0);
-#endif
-
 		if(register_framebuffer(sis_fb_info) < 0) {
 			printk(KERN_ERR "sisfb: Fatal error: Failed to register framebuffer\n");
 			ret = -EINVAL;
@@ -6620,30 +6388,6 @@ #endif
 		ivideo->next = card_list;
 		card_list = ivideo;
 
-#ifdef SIS_OLD_CONFIG_COMPAT
-		{
-		int ret;
-		/* Our ioctls are all "32/64bit compatible" */
-		ret =  register_ioctl32_conversion(FBIO_ALLOC,             NULL);
-		ret |= register_ioctl32_conversion(FBIO_FREE,              NULL);
-		ret |= register_ioctl32_conversion(FBIOGET_VBLANK,         NULL);
-		ret |= register_ioctl32_conversion(SISFB_GET_INFO_SIZE,    NULL);
-		ret |= register_ioctl32_conversion(SISFB_GET_INFO,         NULL);
-		ret |= register_ioctl32_conversion(SISFB_GET_TVPOSOFFSET,  NULL);
-		ret |= register_ioctl32_conversion(SISFB_SET_TVPOSOFFSET,  NULL);
-		ret |= register_ioctl32_conversion(SISFB_SET_LOCK,         NULL);
-		ret |= register_ioctl32_conversion(SISFB_GET_VBRSTATUS,    NULL);
-		ret |= register_ioctl32_conversion(SISFB_GET_AUTOMAXIMIZE, NULL);
-		ret |= register_ioctl32_conversion(SISFB_SET_AUTOMAXIMIZE, NULL);
-		ret |= register_ioctl32_conversion(SISFB_COMMAND,          NULL);
-		if(ret)
-			printk(KERN_ERR
-				"sisfb: Error registering ioctl32 translations\n");
-		else
-			ivideo->ioctl32registered = 1;
-		}
-#endif
-
 		printk(KERN_INFO "sisfb: 2D acceleration is %s, y-panning %s\n",
 			ivideo->sisfb_accel ? "enabled" : "disabled",
 			ivideo->sisfb_ypan  ?
@@ -6653,11 +6397,7 @@ #endif
 
 
 		printk(KERN_INFO "fb%d: %s frame buffer device version %d.%d.%d\n",
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
 			GET_FB_IDX(sis_fb_info->node),
-#else
-			sis_fb_info->node,
-#endif
 			ivideo->myid, VER_MAJOR, VER_MINOR, VER_LEVEL);
 
 		printk(KERN_INFO "sisfb: Copyright (C) 2001-2005 Thomas Winischhofer\n");
@@ -6678,27 +6418,6 @@ static void __devexit sisfb_remove(struc
 	int			registered = ivideo->registered;
 	int			modechanged = ivideo->modechanged;
 
-#ifdef SIS_OLD_CONFIG_COMPAT
-	if(ivideo->ioctl32registered) {
-		int ret;
-		ret =  unregister_ioctl32_conversion(FBIO_ALLOC);
-		ret |= unregister_ioctl32_conversion(FBIO_FREE);
-		ret |= unregister_ioctl32_conversion(FBIOGET_VBLANK);
-		ret |= unregister_ioctl32_conversion(SISFB_GET_INFO_SIZE);
-		ret |= unregister_ioctl32_conversion(SISFB_GET_INFO);
-		ret |= unregister_ioctl32_conversion(SISFB_GET_TVPOSOFFSET);
-		ret |= unregister_ioctl32_conversion(SISFB_SET_TVPOSOFFSET);
-		ret |= unregister_ioctl32_conversion(SISFB_SET_LOCK);
-		ret |= unregister_ioctl32_conversion(SISFB_GET_VBRSTATUS);
-		ret |= unregister_ioctl32_conversion(SISFB_GET_AUTOMAXIMIZE);
-		ret |= unregister_ioctl32_conversion(SISFB_SET_AUTOMAXIMIZE);
-		ret |= unregister_ioctl32_conversion(SISFB_COMMAND);
-		if(ret)
-			printk(KERN_ERR
-			     "sisfb: Error unregistering ioctl32 translations\n");
-	}
-#endif
-
 	/* Unmap */
 	iounmap(ivideo->mmio_vbase);
 	iounmap(ivideo->video_vbase);
@@ -6732,11 +6451,7 @@ #endif
 	/* Unregister the framebuffer */
 	if(ivideo->registered) {
 		unregister_framebuffer(sis_fb_info);
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,3))
 		framebuffer_release(sis_fb_info);
-#else
-		kfree(sis_fb_info);
-#endif
 	}
 
 	/* OK, our ivideo is gone for good from here. */
@@ -6762,7 +6477,6 @@ static struct pci_driver sisfb_driver = 
 
 SISINITSTATIC int __init sisfb_init(void)
 {
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,8)
 #ifndef MODULE
 	char *options = NULL;
 
@@ -6771,15 +6485,12 @@ #ifndef MODULE
 
 	sisfb_setup(options);
 #endif
-#endif
 	return pci_register_driver(&sisfb_driver);
 }
 
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,8)
 #ifndef MODULE
 module_init(sisfb_init);
 #endif
-#endif
 
 /*****************************************************/
 /*                      MODULE                       */
@@ -6799,9 +6510,6 @@ static int		pdc1 = -1;
 static int		noaccel = -1;
 static int		noypan  = -1;
 static int		nomax = -1;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-static int		inverse = 0;
-#endif
 static int		userom = -1;
 static int		useoem = -1;
 static char		*tvstandard = NULL;
@@ -6861,10 +6569,6 @@ static int __init sisfb_init_module(void
 	else if(nomax = 0)
 		sisfb_max = 1;
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-	if(inverse) sisfb_inverse = 1;
-#endif
-
 	if(mem)
 		sisfb_parm_mem = mem;
 
@@ -6913,35 +6617,6 @@ MODULE_DESCRIPTION("SiS 300/540/630/730/
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Thomas Winischhofer <thomas@winischhofer.net>, Others");
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-MODULE_PARM(mem, "i");
-MODULE_PARM(noaccel, "i");
-MODULE_PARM(noypan, "i");
-MODULE_PARM(nomax, "i");
-MODULE_PARM(userom, "i");
-MODULE_PARM(useoem, "i");
-MODULE_PARM(mode, "s");
-MODULE_PARM(vesa, "i");
-MODULE_PARM(rate, "i");
-MODULE_PARM(forcecrt1, "i");
-MODULE_PARM(forcecrt2type, "s");
-MODULE_PARM(scalelcd, "i");
-MODULE_PARM(pdc, "i");
-MODULE_PARM(pdc1, "i");
-MODULE_PARM(specialtiming, "s");
-MODULE_PARM(lvdshl, "i");
-MODULE_PARM(tvstandard, "s");
-MODULE_PARM(tvxposoffset, "i");
-MODULE_PARM(tvyposoffset, "i");
-MODULE_PARM(nocrt2rate, "i");
-MODULE_PARM(inverse, "i");
-#if !defined(__i386__) && !defined(__x86_64__)
-MODULE_PARM(resetcard, "i");
-MODULE_PARM(videoram, "i");
-#endif
-#endif
-
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 module_param(mem, int, 0);
 module_param(noaccel, int, 0);
 module_param(noypan, int, 0);
@@ -6966,18 +6641,7 @@ #if !defined(__i386__) && !defined(__x86
 module_param(resetcard, int, 0);
 module_param(videoram, int, 0);
 #endif
-#endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-MODULE_PARM_DESC(mem,
-	"\nDetermines the beginning of the video memory heap in KB. This heap is used\n"
-	  "for video RAM management for eg. DRM/DRI. On 300 series, the default depends\n"
-	  "on the amount of video RAM available. If 8MB of video RAM or less is available,\n"
-	  "the heap starts at 4096KB, if between 8 and 16MB are available at 8192KB,\n"
-	  "otherwise at 12288KB. On 315/330/340 series, the heap size is 32KB by default.\n"
-	  "The value is to be specified without 'KB' and must match the MaxXFBMem setting\n"
-	  "for XFree86 4.x/X.org 6.7 and later.\n");
-#else
 MODULE_PARM_DESC(mem,
 	"\nDetermines the beginning of the video memory heap in KB. This heap is used\n"
 	  "for video RAM management for eg. DRM/DRI. On 300 series, the default depends\n"
@@ -6985,7 +6649,6 @@ MODULE_PARM_DESC(mem,
 	  "the heap starts at 4096KB, if between 8 and 16MB are available at 8192KB,\n"
 	  "otherwise at 12288KB. On 315/330/340 series, the heap size is 32KB by default.\n"
 	  "The value is to be specified without 'KB'.\n");
-#endif
 
 MODULE_PARM_DESC(noaccel,
 	"\nIf set to anything other than 0, 2D acceleration will be disabled.\n"
@@ -7002,23 +6665,6 @@ MODULE_PARM_DESC(nomax,
 	  "enable the user to positively specify a virtual Y size of the screen using\n"
 	  "fbset. (default: 0)\n");
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-MODULE_PARM_DESC(mode,
-	"\nSelects the desired display mode in the format [X]x[Y]x[Depth], eg.\n"
-	  "1024x768x16. Other formats supported include XxY-Depth and\n"
-	  "XxY-Depth@Rate. If the parameter is only one (decimal or hexadecimal)\n"
-	  "number, it will be interpreted as a VESA mode number. (default: none if\n"
-	  "sisfb is a module; this leaves the console untouched and the driver will\n"
-	  "only do the video memory management for eg. DRM/DRI; 800x600x8 if sisfb\n"
-	  "is in the kernel)\n");
-MODULE_PARM_DESC(vesa,
-	"\nSelects the desired display mode by VESA defined mode number, eg. 0x117\n"
-	  "(default: 0x0000 if sisfb is a module; this leaves the console untouched\n"
-	  "and the driver will only do the video memory management for eg. DRM/DRI;\n"
-	  "0x0103 if sisfb is in the kernel)\n");
-#endif
-
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 MODULE_PARM_DESC(mode,
 	"\nSelects the desired default display mode in the format XxYxDepth,\n"
 	 "eg. 1024x768x16. Other formats supported include XxY-Depth and\n"
@@ -7028,7 +6674,6 @@ MODULE_PARM_DESC(mode,
 MODULE_PARM_DESC(vesa,
 	"\nSelects the desired default display mode by VESA defined mode number, eg.\n"
 	 "0x117 (default: 0x0103)\n");
-#endif
 
 MODULE_PARM_DESC(rate,
 	"\nSelects the desired vertical refresh rate for CRT1 (external VGA) in Hz.\n"
@@ -7094,12 +6739,6 @@ MODULE_PARM_DESC(nocrt2rate,
 	"\nSetting this to 1 will force the driver to use the default refresh rate for\n"
 	  "CRT2 if CRT2 type is VGA. (default: 0, use same rate as CRT1)\n");
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-MODULE_PARM_DESC(inverse,
-	"\nSetting this to anything but 0 should invert the display colors, but this\n"
-	  "does not seem to work. (default: 0)\n");
-#endif
-
 #if !defined(__i386__) && !defined(__x86_64__)
 #ifdef CONFIG_FB_SIS_300
 MODULE_PARM_DESC(resetcard,
diff --git a/drivers/video/sis/sis_main.h b/drivers/video/sis/sis_main.h
index 70b6df3..b3d0963 100644
--- a/drivers/video/sis/sis_main.h
+++ b/drivers/video/sis/sis_main.h
@@ -67,15 +67,7 @@ static int sisfb_ypan = -1;
 static int sisfb_max = -1;
 static int sisfb_userom = 1;
 static int sisfb_useoem = -1;
-#ifdef MODULE
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 static int sisfb_mode_idx = -1;
-#else
-static int sisfb_mode_idx = MODE_INDEX_NONE;  /* Don't use a mode by default if we are a module */
-#endif
-#else
-static int sisfb_mode_idx = -1;               /* Use a default mode if we are inside the kernel */
-#endif
 static int sisfb_parm_rate = -1;
 static int sisfb_crt1off = 0;
 static int sisfb_forcecrt1 = -1;
@@ -93,10 +85,6 @@ static int sisfb_tvstd  = -1;
 static int sisfb_tvxposoffset = 0;
 static int sisfb_tvyposoffset = 0;
 static int sisfb_nocrt2rate = 0;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-static int  sisfb_inverse = 0;
-static char sisfb_fontname[40];
-#endif
 #if !defined(__i386__) && !defined(__x86_64__)
 static int sisfb_resetcard = 0;
 static int sisfb_videoram = 0;
@@ -687,54 +675,8 @@ SISINITSTATIC int sisfb_init(void);
 static int	sisfb_get_fix(struct fb_fix_screeninfo *fix, int con,
 				struct fb_info *info);
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-static int	sisfb_get_fix(struct fb_fix_screeninfo *fix,
-				int con,
-				struct fb_info *info);
-static int	sisfb_get_var(struct fb_var_screeninfo *var,
-				int con,
-				struct fb_info *info);
-static int	sisfb_set_var(struct fb_var_screeninfo *var,
-				int con,
-				struct fb_info *info);
-static void	sisfb_crtc_to_var(struct sis_video_info *ivideo,
-				struct fb_var_screeninfo *var);
-static int	sisfb_get_cmap(struct fb_cmap *cmap,
-				int kspc,
-				int con,
-				struct fb_info *info);
-static int	sisfb_set_cmap(struct fb_cmap *cmap,
-				int kspc,
-				int con,
-				struct fb_info *info);
-static int	sisfb_update_var(int con,
-				struct fb_info *info);
-static int	sisfb_switch(int con,
-			     struct fb_info *info);
-static void	sisfb_blank(int blank,
-				struct fb_info *info);
-static void	sisfb_set_disp(int con,
-				struct fb_var_screeninfo *var,
-				struct fb_info *info);
-static int	sis_getcolreg(unsigned regno, unsigned *red, unsigned *green,
-				unsigned *blue, unsigned *transp,
-				struct fb_info *fb_info);
-static void	sisfb_do_install_cmap(int con,
-				struct fb_info *info);
-static int	sisfb_ioctl(struct inode *inode, struct file *file,
-				unsigned int cmd, unsigned long arg, int con,
-				struct fb_info *info);
-#endif
-
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15)
 static int	sisfb_ioctl(struct fb_info *info, unsigned int cmd,
 			    unsigned long arg);
-#else
-static int	sisfb_ioctl(struct inode *inode, struct file *file,
-				unsigned int cmd, unsigned long arg,
-				struct fb_info *info);
-#endif
 static int	sisfb_set_par(struct fb_info *info);
 static int	sisfb_blank(int blank,
 				struct fb_info *info);
@@ -743,7 +685,6 @@ extern void	fbcon_sis_fillrect(struct fb
 extern void	fbcon_sis_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area);
 extern int	fbcon_sis_sync(struct fb_info *info);
-#endif
 
 /* Internal 2D accelerator functions */
 extern int	sisfb_initaccel(struct sis_video_info *ivideo);
@@ -811,16 +752,10 @@ extern BOOLEAN		SiSDetermineROMLayout661
 
 extern BOOLEAN		sisfb_gettotalfrommode(struct SiS_Private *SiS_Pr, unsigned char modeno,
 				int *htotal, int *vtotal, unsigned char rateindex);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
 extern int		sisfb_mode_rate_to_dclock(struct SiS_Private *SiS_Pr,
 				unsigned char modeno, unsigned char rateindex);
 extern int		sisfb_mode_rate_to_ddata(struct SiS_Private *SiS_Pr, unsigned char modeno,
 				unsigned char rateindex, struct fb_var_screeninfo *var);
-#endif
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0)
-extern void		SiS_Generic_ConvertCRData(struct SiS_Private *SiS_Pr, unsigned char *crdata, int xres,
-				int yres, struct fb_var_screeninfo *var, BOOLEAN writeres);
-#endif
 
 /* Chrontel TV, DDC and DPMS functions */
 extern unsigned short	SiS_GetCH700x(struct SiS_Private *SiS_Pr, unsigned short reg);
diff --git a/drivers/video/sis/vgatypes.h b/drivers/video/sis/vgatypes.h
index 831b9f4..05d08b7 100644
--- a/drivers/video/sis/vgatypes.h
+++ b/drivers/video/sis/vgatypes.h
@@ -73,12 +73,10 @@ #define SISIOMEMTYPE
 
 #ifdef SIS_LINUX_KERNEL
 typedef unsigned long SISIOADDRESS;
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,8)
 #include <linux/types.h>  /* Need __iomem */
 #undef SISIOMEMTYPE
 #define SISIOMEMTYPE __iomem
 #endif
-#endif
 
 #ifdef SIS_XORG_XF86
 #if XF86_VERSION_CURRENT < XF86_VERSION_NUMERIC(4,2,0,0,0)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
