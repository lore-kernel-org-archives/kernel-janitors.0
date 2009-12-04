From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 04 Dec 2009 20:47:01 +0000
Subject: [PATCH] Fix misspelling of "definition" or "definitions".
Message-Id: <1259959621-24833-1-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Definition" is misspelled "defintion" in several comments; this
patch fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 arch/arm/mach-bcmring/include/csp/reg.h          |    2 +-
 arch/arm/mach-bcmring/include/mach/csp/mm_addr.h |    2 +-
 arch/arm/mach-u300/include/mach/u300-regs.h      |    2 +-
 arch/sh/include/mach-common/mach/titan.h         |    2 +-
 arch/x86/include/asm/sigcontext.h                |    4 ++--
 drivers/block/cciss_cmd.h                        |    2 +-
 drivers/gpu/drm/radeon/atombios.h                |   16 ++++++++--------
 drivers/media/video/cx18/cx18-av-core.h          |    2 +-
 drivers/media/video/cx18/cx18-mailbox.h          |    2 +-
 drivers/net/wireless/ath/ath5k/base.h            |    2 +-
 drivers/s390/net/qeth_core_mpc.h                 |    2 +-
 drivers/scsi/advansys.c                          |    2 +-
 drivers/scsi/aic94xx/aic94xx_reg_def.h           |    2 +-
 drivers/scsi/bfa/include/protocol/ct.h           |    4 ++--
 drivers/scsi/dmx3191d.c                          |    2 +-
 drivers/scsi/wd7000.c                            |    2 +-
 drivers/staging/otus/80211core/pub_zfi.h         |    2 +-
 drivers/staging/otus/zdcompat.h                  |    2 +-
 drivers/staging/rtl8192su/r8192S_phyreg.h        |    2 +-
 fs/cifs/cifspdu.h                                |    2 +-
 fs/compat_ioctl.c                                |    2 +-
 include/linux/cciss_ioctl.h                      |    2 +-
 include/linux/in6.h                              |    2 +-
 include/linux/usb/wusb.h                         |    2 +-
 24 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm/mach-bcmring/include/csp/reg.h b/arch/arm/mach-bcmring/include/csp/reg.h
index e5f60bf..56654d2 100644
--- a/arch/arm/mach-bcmring/include/csp/reg.h
+++ b/arch/arm/mach-bcmring/include/csp/reg.h
@@ -16,7 +16,7 @@
 /**
 *  @file    reg.h
 *
-*  @brief   Generic register defintions used in CSP
+*  @brief   Generic register definitions used in CSP
 */
 /****************************************************************************/
 
diff --git a/arch/arm/mach-bcmring/include/mach/csp/mm_addr.h b/arch/arm/mach-bcmring/include/mach/csp/mm_addr.h
index 86bb58d..ad58cf8 100644
--- a/arch/arm/mach-bcmring/include/mach/csp/mm_addr.h
+++ b/arch/arm/mach-bcmring/include/mach/csp/mm_addr.h
@@ -16,7 +16,7 @@
 /**
 *  @file    mm_addr.h
 *
-*  @brief   Memory Map address defintions
+*  @brief   Memory Map address definitions
 *
 *  @note
 *     None
diff --git a/arch/arm/mach-u300/include/mach/u300-regs.h b/arch/arm/mach-u300/include/mach/u300-regs.h
index 88333df..56721a0 100644
--- a/arch/arm/mach-u300/include/mach/u300-regs.h
+++ b/arch/arm/mach-u300/include/mach/u300-regs.h
@@ -6,7 +6,7 @@
  * Copyright (C) 2006-2009 ST-Ericsson AB
  * License terms: GNU General Public License (GPL) version 2
  * Basic register address definitions in physical memory and
- * some block defintions for core devices like the timer.
+ * some block definitions for core devices like the timer.
  * Author: Linus Walleij <linus.walleij@stericsson.com>
  */
 
diff --git a/arch/sh/include/mach-common/mach/titan.h b/arch/sh/include/mach-common/mach/titan.h
index 03f3583..4a674d2 100644
--- a/arch/sh/include/mach-common/mach/titan.h
+++ b/arch/sh/include/mach-common/mach/titan.h
@@ -1,5 +1,5 @@
 /*
- * Platform defintions for Titan
+ * Platform definitions for Titan
  */
 #ifndef _ASM_SH_TITAN_H
 #define _ASM_SH_TITAN_H
diff --git a/arch/x86/include/asm/sigcontext.h b/arch/x86/include/asm/sigcontext.h
index 72e5a44..04459d2 100644
--- a/arch/x86/include/asm/sigcontext.h
+++ b/arch/x86/include/asm/sigcontext.h
@@ -124,7 +124,7 @@ struct sigcontext {
 	 * fpstate is really (struct _fpstate *) or (struct _xstate *)
 	 * depending on the FP_XSTATE_MAGIC1 encoded in the SW reserved
 	 * bytes of (struct _fpstate) and FP_XSTATE_MAGIC2 present at the end
-	 * of extended memory layout. See comments at the defintion of
+	 * of extended memory layout. See comments at the definition of
 	 * (struct _fpx_sw_bytes)
 	 */
 	void __user *fpstate;		/* zero when no FPU/extended context */
@@ -219,7 +219,7 @@ struct sigcontext {
 	 * fpstate is really (struct _fpstate *) or (struct _xstate *)
 	 * depending on the FP_XSTATE_MAGIC1 encoded in the SW reserved
 	 * bytes of (struct _fpstate) and FP_XSTATE_MAGIC2 present at the end
-	 * of extended memory layout. See comments at the defintion of
+	 * of extended memory layout. See comments at the definition of
 	 * (struct _fpx_sw_bytes)
 	 */
 	void __user *fpstate;		/* zero when no FPU/extended context */
diff --git a/drivers/block/cciss_cmd.h b/drivers/block/cciss_cmd.h
index dbaed1e..8098fcc 100644
--- a/drivers/block/cciss_cmd.h
+++ b/drivers/block/cciss_cmd.h
@@ -5,7 +5,7 @@
 //###########################################################################
 #define CISS_VERSION "1.00"
 
-//general boundary defintions
+//general boundary definitions
 #define SENSEINFOBYTES          32//note that this value may vary between host implementations
 #define MAXSGENTRIES            31
 #define MAXREPLYQS              256
diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index c11dddd..6643afc 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -1141,7 +1141,7 @@ typedef struct _LVDS_ENCODER_CONTROL_PARAMETERS {
 /* ucTableFormatRevision=1,ucTableContentRevision=2 */
 typedef struct _LVDS_ENCODER_CONTROL_PARAMETERS_V2 {
 	USHORT usPixelClock;	/*  in 10KHz; for bios convenient */
-	UCHAR ucMisc;		/*  see PANEL_ENCODER_MISC_xx defintions below */
+	UCHAR ucMisc;		/*  see PANEL_ENCODER_MISC_xx definitions below */
 	UCHAR ucAction;		/*  0: turn off encoder */
 	/*  1: setup and turn on encoder */
 	UCHAR ucTruncate;	/*  bit0=0: Disable truncate */
@@ -1424,7 +1424,7 @@ typedef struct _ATOM_MULTIMEDIA_CONFIG_INFO {
 /*  Structures used in FirmwareInfoTable */
 /****************************************************************************/
 
-/*  usBIOSCapability Defintion: */
+/*  usBIOSCapability Definition: */
 /*  Bit 0 = 0: Bios image is not Posted, =1:Bios image is Posted; */
 /*  Bit 1 = 0: Dual CRTC is not supported, =1: Dual CRTC is supported; */
 /*  Bit 2 = 0: Extended Desktop is not supported, =1: Extended Desktop is supported; */
@@ -2386,7 +2386,7 @@ typedef struct _ATOM_ANALOG_TV_INFO_V1_2 {
 } ATOM_ANALOG_TV_INFO_V1_2;
 
 /**************************************************************************/
-/*  VRAM usage and their defintions */
+/*  VRAM usage and their definitions */
 
 /*  One chunk of VRAM used by Bios are for HWICON surfaces,EDID data. */
 /*  Current Mode timing and Dail Timing and/or STD timing data EACH device. They can be broken down as below. */
@@ -3046,7 +3046,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO {
 #define ATOM_S0_SYSTEM_POWER_STATE_VALUE_DC     2
 #define ATOM_S0_SYSTEM_POWER_STATE_VALUE_LITEAC 3
 
-/* Byte aligned defintion for BIOS usage */
+/* Byte aligned definition for BIOS usage */
 #define ATOM_S0_CRT1_MONOb0             0x01
 #define ATOM_S0_CRT1_COLORb0            0x02
 #define ATOM_S0_CRT1_MASKb0             (ATOM_S0_CRT1_MONOb0+ATOM_S0_CRT1_COLORb0)
@@ -3131,7 +3131,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO {
 #define ATOM_S2_DISPLAY_ROTATION_DEGREE_SHIFT 30
 #define ATOM_S2_DISPLAY_ROTATION_ANGLE_MASK   0xC0000000L
 
-/* Byte aligned defintion for BIOS usage */
+/* Byte aligned definition for BIOS usage */
 #define ATOM_S2_TV1_STANDARD_MASKb0     0x0F
 #define ATOM_S2_CURRENT_BL_LEVEL_MASKb1 0xFF
 #define ATOM_S2_CRT1_DPMS_STATEb2       0x01
@@ -3190,7 +3190,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO {
 #define ATOM_S3_ALLOW_FAST_PWR_SWITCH   0x40000000L
 #define ATOM_S3_RQST_GPU_USE_MIN_PWR    0x80000000L
 
-/* Byte aligned defintion for BIOS usage */
+/* Byte aligned definition for BIOS usage */
 #define ATOM_S3_CRT1_ACTIVEb0           0x01
 #define ATOM_S3_LCD1_ACTIVEb0           0x02
 #define ATOM_S3_TV1_ACTIVEb0            0x04
@@ -3230,7 +3230,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO {
 #define ATOM_S4_LCD1_REFRESH_MASK       0x0000FF00L
 #define ATOM_S4_LCD1_REFRESH_SHIFT      8
 
-/* Byte aligned defintion for BIOS usage */
+/* Byte aligned definition for BIOS usage */
 #define ATOM_S4_LCD1_PANEL_ID_MASKb0	  0x0FF
 #define ATOM_S4_LCD1_REFRESH_MASKb1		  ATOM_S4_LCD1_PANEL_ID_MASKb0
 #define ATOM_S4_VRAM_INFO_MASKb2        ATOM_S4_LCD1_PANEL_ID_MASKb0
@@ -3310,7 +3310,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO {
 #define ATOM_S6_VRI_BRIGHTNESS_CHANGE       0x40000000L
 #define ATOM_S6_CONFIG_DISPLAY_CHANGE_MASK  0x80000000L
 
-/* Byte aligned defintion for BIOS usage */
+/* Byte aligned definition for BIOS usage */
 #define ATOM_S6_DEVICE_CHANGEb0         0x01
 #define ATOM_S6_SCALER_CHANGEb0         0x02
 #define ATOM_S6_LID_CHANGEb0            0x04
diff --git a/drivers/media/video/cx18/cx18-av-core.h b/drivers/media/video/cx18/cx18-av-core.h
index 9b84a0c..cafb7e9 100644
--- a/drivers/media/video/cx18/cx18-av-core.h
+++ b/drivers/media/video/cx18/cx18-av-core.h
@@ -294,7 +294,7 @@ struct cx18_av_state {
 #define CXADEC_QAM_CONST_DEC       0x924
 #define CXADEC_QAM_ROTATOR_FREQ    0x948
 
-/* Bit defintions / settings used in Mako Audio */
+/* Bit definitions / settings used in Mako Audio */
 #define CXADEC_PREF_MODE_MONO_LANGA        0
 #define CXADEC_PREF_MODE_MONO_LANGB        1
 #define CXADEC_PREF_MODE_MONO_LANGC        2
diff --git a/drivers/media/video/cx18/cx18-mailbox.h b/drivers/media/video/cx18/cx18-mailbox.h
index e23aaac..522ad53 100644
--- a/drivers/media/video/cx18/cx18-mailbox.h
+++ b/drivers/media/video/cx18/cx18-mailbox.h
@@ -41,7 +41,7 @@ struct cx18;
 /*
  * This structure is used by CPU to provide completed buffers information
  * Its structure is dictrated by the layout of the SCB, required by the
- * firmware, but its defintion needs to be here, instead of in cx18-scb.h,
+ * firmware, but its definition needs to be here, instead of in cx18-scb.h,
  * for mailbox work order scheduling
  */
 struct cx18_mdl_ack {
diff --git a/drivers/net/wireless/ath/ath5k/base.h b/drivers/net/wireless/ath/ath5k/base.h
index a28c42f..2183edf 100644
--- a/drivers/net/wireless/ath/ath5k/base.h
+++ b/drivers/net/wireless/ath/ath5k/base.h
@@ -36,7 +36,7 @@
  */
 
 /*
- * Defintions for the Atheros Wireless LAN controller driver.
+ * Definitions for the Atheros Wireless LAN controller driver.
  */
 #ifndef _DEV_ATH_ATHVAR_H
 #define _DEV_ATH_ATHVAR_H
diff --git a/drivers/s390/net/qeth_core_mpc.h b/drivers/s390/net/qeth_core_mpc.h
index eecb2ee..de7bcce 100644
--- a/drivers/s390/net/qeth_core_mpc.h
+++ b/drivers/s390/net/qeth_core_mpc.h
@@ -507,7 +507,7 @@ extern unsigned char ULP_ENABLE[];
 		(PDU_ENCAPSULATION(buffer) + 0x17)
 #define QETH_ULP_ENABLE_RESP_LINK_TYPE(buffer) \
 		(PDU_ENCAPSULATION(buffer) + 0x2b)
-/* Layer 2 defintions */
+/* Layer 2 definitions */
 #define QETH_PROT_LAYER2 0x08
 #define QETH_PROT_TCPIP  0x03
 #define QETH_PROT_OSN2   0x0a
diff --git a/drivers/scsi/advansys.c b/drivers/scsi/advansys.c
index b756041..22626ab 100644
--- a/drivers/scsi/advansys.c
+++ b/drivers/scsi/advansys.c
@@ -7969,7 +7969,7 @@ static int advansys_reset(struct scsi_cmnd *scp)
 		ASC_DBG(1, "before AscInitAsc1000Driver()\n");
 		status = AscInitAsc1000Driver(asc_dvc);
 
-		/* Refer to ASC_IERR_* defintions for meaning of 'err_code'. */
+		/* Refer to ASC_IERR_* definitions for meaning of 'err_code'. */
 		if (asc_dvc->err_code) {
 			scmd_printk(KERN_INFO, scp, "SCSI bus reset error: "
 				    "0x%x\n", asc_dvc->err_code);
diff --git a/drivers/scsi/aic94xx/aic94xx_reg_def.h b/drivers/scsi/aic94xx/aic94xx_reg_def.h
index a43e8cd..28aaf34 100644
--- a/drivers/scsi/aic94xx/aic94xx_reg_def.h
+++ b/drivers/scsi/aic94xx/aic94xx_reg_def.h
@@ -1,5 +1,5 @@
 /*
- * Aic94xx SAS/SATA driver hardware registers defintions.
+ * Aic94xx SAS/SATA driver hardware registers definitions.
  *
  * Copyright (C) 2004 Adaptec, Inc.  All rights reserved.
  * Copyright (C) 2004 David Chaw <david_chaw@adaptec.com>
diff --git a/drivers/scsi/bfa/include/protocol/ct.h b/drivers/scsi/bfa/include/protocol/ct.h
index c59d663..79d16a9 100644
--- a/drivers/scsi/bfa/include/protocol/ct.h
+++ b/drivers/scsi/bfa/include/protocol/ct.h
@@ -82,7 +82,7 @@ enum {
 };
 
 /*
- * defintions for CT reason code
+ * definitions for CT reason code
  */
 enum {
 	CT_RSN_INV_CMD		= 0x01,
@@ -129,7 +129,7 @@ enum {
 };
 
 /*
- * defintions for the explanation code for all servers
+ * definitions for the explanation code for all servers
  */
 enum {
 	CT_EXP_AUTH_EXCEPTION			= 0xF1,
diff --git a/drivers/scsi/dmx3191d.c b/drivers/scsi/dmx3191d.c
index fa738ec..207352c 100644
--- a/drivers/scsi/dmx3191d.c
+++ b/drivers/scsi/dmx3191d.c
@@ -31,7 +31,7 @@
 #include <scsi/scsi_host.h>
 
 /*
- * Defintions for the generic 5380 driver.
+ * Definitions for the generic 5380 driver.
  */
 #define AUTOSENSE
 
diff --git a/drivers/scsi/wd7000.c b/drivers/scsi/wd7000.c
index 093610b..2f6e9d8 100644
--- a/drivers/scsi/wd7000.c
+++ b/drivers/scsi/wd7000.c
@@ -161,7 +161,7 @@
  *
  * 2003/02/12 - Christoph Hellwig <hch@infradead.org>
  *
- * Cleaned up host template defintion
+ * Cleaned up host template definition
  * Removed now obsolete wd7000.h
  */
 
diff --git a/drivers/staging/otus/80211core/pub_zfi.h b/drivers/staging/otus/80211core/pub_zfi.h
index a35bd5d..60b7d1c 100644
--- a/drivers/staging/otus/80211core/pub_zfi.h
+++ b/drivers/staging/otus/80211core/pub_zfi.h
@@ -20,7 +20,7 @@
 #include "../oal_dt.h"
 
 /***** Section 1 : Tunable Parameters *****/
-/* The defintions in this section are tunabel parameters */
+/* The definitions in this section are tunabel parameters */
 
 /* Maximum number of BSS that could be scaned */
 #define ZM_MAX_BSS                          128
diff --git a/drivers/staging/otus/zdcompat.h b/drivers/staging/otus/zdcompat.h
index 84ac433..cdcaef5 100644
--- a/drivers/staging/otus/zdcompat.h
+++ b/drivers/staging/otus/zdcompat.h
@@ -17,7 +17,7 @@
 /*  Module Name : zdcompat.h                                            */
 /*                                                                      */
 /*  Abstract                                                            */
-/*     This module contains function defintion for compatibility.       */
+/*     This module contains function definition for compatibility.      */
 /*                                                                      */
 /*  NOTES                                                               */
 /*     Platform dependent.                                              */
diff --git a/drivers/staging/rtl8192su/r8192S_phyreg.h b/drivers/staging/rtl8192su/r8192S_phyreg.h
index 96c7cfa..acf644f 100644
--- a/drivers/staging/rtl8192su/r8192S_phyreg.h
+++ b/drivers/staging/rtl8192su/r8192S_phyreg.h
@@ -38,7 +38,7 @@
 // 2. 0x800/0x900/0xA00/0xC00/0xD00/0xE00
 // 3. RF register 0x00-2E
 // 4. Bit Mask for BB/RF register
-// 5. Other defintion for BB/RF R/W
+// 5. Other definition for BB/RF R/W
 //
 
 
diff --git a/fs/cifs/cifspdu.h b/fs/cifs/cifspdu.h
index 2d07f89..3877737 100644
--- a/fs/cifs/cifspdu.h
+++ b/fs/cifs/cifspdu.h
@@ -1227,7 +1227,7 @@ typedef struct smb_com_setattr_rsp {
 /* empty wct response to setattr */
 
 /*******************************************************/
-/* NT Transact structure defintions follow             */
+/* NT Transact structure definitions follow            */
 /* Currently only ioctl, acl (get security descriptor) */
 /* and notify are implemented                          */
 /*******************************************************/
diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index d84e705..0fc5eca 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -2655,7 +2655,7 @@ COMPATIBLE_IOCTL(TIOCSLTC)
 #endif
 #ifdef TIOCSTART
 /*
- * For these two we have defintions in ioctls.h and/or termios.h on
+ * For these two we have definitions in ioctls.h and/or termios.h on
  * some architectures but no actual implemention.  Some applications
  * like bash call them if they are defined in the headers, so we provide
  * entries here to avoid syslog message spew.
diff --git a/include/linux/cciss_ioctl.h b/include/linux/cciss_ioctl.h
index cb57c30..eb130b4 100644
--- a/include/linux/cciss_ioctl.h
+++ b/include/linux/cciss_ioctl.h
@@ -39,7 +39,7 @@ typedef __u32 DriverVer_type;
 #ifndef CCISS_CMD_H
 // This defines are duplicated in cciss_cmd.h in the driver directory 
 
-//general boundary defintions
+//general boundary definitions
 #define SENSEINFOBYTES          32//note that this value may vary between host implementations
 
 //Command Status value
diff --git a/include/linux/in6.h b/include/linux/in6.h
index 718bf21..010290d 100644
--- a/include/linux/in6.h
+++ b/include/linux/in6.h
@@ -113,7 +113,7 @@ struct in6_flowlabel_req
 #define IPV6_FLOWINFO_FLOWLABEL		0x000fffff
 #define IPV6_FLOWINFO_PRIORITY		0x0ff00000
 
-/* These defintions are obsolete */
+/* These definitions are obsolete */
 #define IPV6_PRIORITY_UNCHARACTERIZED	0x0000
 #define IPV6_PRIORITY_FILLER		0x0100
 #define IPV6_PRIORITY_UNATTENDED	0x0200
diff --git a/include/linux/usb/wusb.h b/include/linux/usb/wusb.h
index 429c631..63ebdcc 100644
--- a/include/linux/usb/wusb.h
+++ b/include/linux/usb/wusb.h
@@ -74,7 +74,7 @@ enum {
  * WUSB defines that CHIDs, CDIDs and CKs are a 16 byte string of
  * data. In order to avoid confusion and enforce types, we wrap it.
  *
- * Make it packed, as we use it in some hw defintions.
+ * Make it packed, as we use it in some hw definitions.
  */
 struct wusb_ckhdid {
 	u8 data[16];
-- 
1.6.3.3

