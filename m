From: Amol Lad <amol@verismonetworks.com>
Date: Thu, 07 Sep 2006 12:34:21 +0000
Subject: [KJ] [PATCH] MIN/MAX cleanup
Message-Id: <1157631741.2452.30.camel@amol.teneoris.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-Tkfw4SCeN67Aq1CPFNTF"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--=-Tkfw4SCeN67Aq1CPFNTF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Cleanups done to use min/max macros from kernel.h. Handcrafted MIN/MAX
macros in some drivers are changed to use macros from kernel.h

Tested for allmodconfig and allnoconfig configurations.

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---

 drivers/isdn/hardware/eicon/debug.c    |    4 +-
 drivers/isdn/hardware/eicon/di.c       |    6 ++--
 drivers/isdn/hardware/eicon/istream.c  |    2 -
 drivers/isdn/hardware/eicon/platform.h |    4 +-
 drivers/scsi/aic7xxx/aic79xx.h         |    6 ++--
 drivers/scsi/aic7xxx/aic79xx_core.c    |   12 ++++----
 drivers/scsi/aic7xxx/aic79xx_osm.c     |    2 -
 drivers/scsi/aic7xxx/aic7xxx.h         |    6 ++--
 drivers/scsi/aic7xxx/aic7xxx_core.c    |   12 ++++----
 drivers/scsi/aic7xxx/aic7xxx_osm.c     |    2 -
 fs/xfs/xfs_btree.h                     |   34 ++++++-----------------
 fs/xfs/xfs_rtalloc.c                   |   16 +++++-----
 fs/xfs/xfs_rtalloc.h                   |    6 ++--
 include/linux/utsrelease.h             |    1
 14 files changed, 53 insertions(+), 60 deletions(-)





--=-Tkfw4SCeN67Aq1CPFNTF
Content-Disposition: attachment; filename=cleanup-MIN-MAX-patch
Content-Type: text/x-patch; name=cleanup-MIN-MAX-patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/isdn/hardware/eicon/debug.c linux-2.6.18-rc5/drivers/isdn/hardware/eicon/debug.c
--- linux-2.6.18-rc5-orig/drivers/isdn/hardware/eicon/debug.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc5/drivers/isdn/hardware/eicon/debug.c	2006-09-07 17:19:02.000000000 +0530
@@ -756,14 +756,14 @@ int diva_get_driver_info (dword id, byte
 
     data_length -= 9;
 
-    if ((to_copy = MIN(strlen(clients[id].drvName), data_length-1))) {
+    if ((to_copy = MIN(strlen(clients[id].drvName), (size_t) (data_length-1)))) {
       memcpy (p, clients[id].drvName, to_copy);
       p += to_copy;
       data_length -= to_copy;
       if ((data_length >= 4) && clients[id].hDbg->drvTag[0]) {
         *p++ = '(';
         data_length -= 1;
-        if ((to_copy = MIN(strlen(clients[id].hDbg->drvTag), data_length-2))) {
+        if ((to_copy = MIN(strlen(clients[id].hDbg->drvTag), (size_t) (data_length-2)))) {
           memcpy (p, clients[id].hDbg->drvTag, to_copy);
           p += to_copy;
           data_length -= to_copy;
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/isdn/hardware/eicon/di.c linux-2.6.18-rc5/drivers/isdn/hardware/eicon/di.c
--- linux-2.6.18-rc5-orig/drivers/isdn/hardware/eicon/di.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc5/drivers/isdn/hardware/eicon/di.c	2006-09-07 16:51:34.000000000 +0530
@@ -133,7 +133,7 @@ void pr_out(ADAPTER * a)
     i = this->XCurrent;
     X = PTR_X(a,this);
     while(i<this->XNum && length<270) {
-      clength = MIN((word)(270-length),X[i].PLength-this->XOffset);
+      clength = MIN((word)(270-length),(word) (X[i].PLength-this->XOffset));
       a->ram_out_buffer(a,
                         &ReqOut->XBuffer.P[length],
                         PTR_P(a,this,&X[i].P[this->XOffset]),
@@ -622,7 +622,7 @@ byte isdn_ind(ADAPTER * a,
                                                      sizeof(a->stream_buffer),
                                                      &final, NULL, NULL);
         }
-        IoAdapter->RBuffer.length = MIN(MLength, 270);
+        IoAdapter->RBuffer.length = MIN(MLength, (word) 270);
         if (IoAdapter->RBuffer.length != MLength) {
           this->complete = 0;
         } else {
@@ -676,7 +676,7 @@ byte isdn_ind(ADAPTER * a,
         this->RCurrent++;
       }
       if (cma) {
-        clength = MIN(MLength, R[this->RCurrent].PLength-this->ROffset);
+        clength = MIN(MLength, (word) (R[this->RCurrent].PLength-this->ROffset));
       } else {
         clength = MIN(a->ram_inw(a, &RBuffer->length)-offset,
                       R[this->RCurrent].PLength-this->ROffset);
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/isdn/hardware/eicon/istream.c linux-2.6.18-rc5/drivers/isdn/hardware/eicon/istream.c
--- linux-2.6.18-rc5-orig/drivers/isdn/hardware/eicon/istream.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc5/drivers/isdn/hardware/eicon/istream.c	2006-09-07 16:17:19.000000000 +0530
@@ -176,7 +176,7 @@ int diva_istream_read (void* context,
     return (-1); /* was not able to read */
    break;
   }
-  to_read = MIN(max_length, tmp[1]);
+  to_read = MIN(max_length, (int) tmp[1]);
   if (to_read) {
    a->ram_in_buffer(a,
 #ifdef PLATFORM_GT_32BIT
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/isdn/hardware/eicon/platform.h linux-2.6.18-rc5/drivers/isdn/hardware/eicon/platform.h
--- linux-2.6.18-rc5-orig/drivers/isdn/hardware/eicon/platform.h	2006-09-07 11:09:39.000000000 +0530
+++ linux-2.6.18-rc5/drivers/isdn/hardware/eicon/platform.h	2006-09-07 11:51:49.000000000 +0530
@@ -84,11 +84,11 @@
 #endif
 
 #ifndef	MIN
-#define MIN(a,b)	((a)>(b) ? (b) : (a))
+#define MIN(a,b)	(min(a,b))
 #endif
 
 #ifndef	MAX
-#define MAX(a,b)	((a)>(b) ? (a) : (b))
+#define MAX(a,b)    (max(a,b))
 #endif
 
 #ifndef	far
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic79xx.h linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic79xx.h
--- linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic79xx.h	2006-09-07 14:23:09.000000000 +0530
+++ linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic79xx.h	2006-09-07 14:20:56.000000000 +0530
@@ -45,6 +45,8 @@
 #ifndef _AIC79XX_H_
 #define _AIC79XX_H_
 
+#include <linux/kernel.h>
+
 /* Register Definitions */
 #include "aic79xx_reg.h"
 
@@ -54,11 +56,11 @@ struct scb_platform_data;
 
 /****************************** Useful Macros *********************************/
 #ifndef MAX
-#define MAX(a,b) (((a) > (b)) ? (a) : (b))
+#define MAX(a,b) (max(a,b))
 #endif
 
 #ifndef MIN
-#define MIN(a,b) (((a) < (b)) ? (a) : (b))
+#define MIN(a,b) (min(a,b))
 #endif
 
 #ifndef TRUE
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic79xx_core.c linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic79xx_core.c
--- linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic79xx_core.c	2006-09-07 14:23:10.000000000 +0530
+++ linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic79xx_core.c	2006-09-07 16:35:47.000000000 +0530
@@ -2850,14 +2850,14 @@ ahd_devlimited_syncrate(struct ahd_softc
 		transinfo = &tinfo->goal;
 	*ppr_options &= (transinfo->ppr_options|MSG_EXT_PPR_PCOMP_EN);
 	if (transinfo->width == MSG_EXT_WDTR_BUS_8_BIT) {
-		maxsync = MAX(maxsync, AHD_SYNCRATE_ULTRA2);
+		maxsync = MAX(maxsync, (u_int) AHD_SYNCRATE_ULTRA2);
 		*ppr_options &= ~MSG_EXT_PPR_DT_REQ;
 	}
 	if (transinfo->period == 0) {
 		*period = 0;
 		*ppr_options = 0;
 	} else {
-		*period = MAX(*period, transinfo->period);
+		*period = MAX(*period, (u_int) transinfo->period);
 		ahd_find_syncrate(ahd, period, ppr_options, maxsync);
 	}
 }
@@ -2927,9 +2927,9 @@ ahd_validate_offset(struct ahd_softc *ah
 	*offset = MIN(*offset, maxoffset);
 	if (tinfo != NULL) {
 		if (role == ROLE_TARGET)
-			*offset = MIN(*offset, tinfo->user.offset);
+			*offset = MIN(*offset, (u_int) tinfo->user.offset);
 		else
-			*offset = MIN(*offset, tinfo->goal.offset);
+			*offset = MIN(*offset, (u_int) tinfo->goal.offset);
 	}
 }
 
@@ -2955,9 +2955,9 @@ ahd_validate_width(struct ahd_softc *ahd
 	}
 	if (tinfo != NULL) {
 		if (role == ROLE_TARGET)
-			*bus_width = MIN(tinfo->user.width, *bus_width);
+			*bus_width = MIN((u_int) tinfo->user.width, *bus_width);
 		else
-			*bus_width = MIN(tinfo->goal.width, *bus_width);
+			*bus_width = MIN((u_int) tinfo->goal.width, *bus_width);
 	}
 }
 
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic79xx_osm.c linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic79xx_osm.c
--- linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic79xx_osm.c	2006-09-07 14:23:10.000000000 +0530
+++ linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic79xx_osm.c	2006-09-07 15:45:04.000000000 +0530
@@ -1815,7 +1815,7 @@ ahd_linux_handle_scsi_status(struct ahd_
 			if (scb->flags & SCB_SENSE) {
 				sense_size = MIN(sizeof(struct scsi_sense_data)
 					       - ahd_get_sense_residual(scb),
-						 sizeof(cmd->sense_buffer));
+						 (u_long) sizeof(cmd->sense_buffer));
 				sense_offset = 0;
 			} else {
 				/*
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic7xxx.h linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic7xxx.h
--- linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic7xxx.h	2006-09-07 14:23:10.000000000 +0530
+++ linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic7xxx.h	2006-09-07 14:20:56.000000000 +0530
@@ -45,6 +45,8 @@
 #ifndef _AIC7XXX_H_
 #define _AIC7XXX_H_
 
+#include <linux/kernel.h>
+
 /* Register Definitions */
 #include "aic7xxx_reg.h"
 
@@ -55,11 +57,11 @@ struct seeprom_descriptor;
 
 /****************************** Useful Macros *********************************/
 #ifndef MAX
-#define MAX(a,b) (((a) > (b)) ? (a) : (b))
+#define MAX(a,b) (max(a,b))
 #endif
 
 #ifndef MIN
-#define MIN(a,b) (((a) < (b)) ? (a) : (b))
+#define MIN(a,b) (min(a,b))
 #endif
 
 #ifndef TRUE
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic7xxx_core.c linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic7xxx_core.c
--- linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic7xxx_core.c	2006-09-07 14:23:10.000000000 +0530
+++ linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic7xxx_core.c	2006-09-07 14:20:56.000000000 +0530
@@ -1671,7 +1671,7 @@ ahc_devlimited_syncrate(struct ahc_softc
 		transinfo = &tinfo->goal;
 	*ppr_options &= transinfo->ppr_options;
 	if (transinfo->width == MSG_EXT_WDTR_BUS_8_BIT) {
-		maxsync = MAX(maxsync, AHC_SYNCRATE_ULTRA2);
+		maxsync = MAX(maxsync, (u_int) AHC_SYNCRATE_ULTRA2);
 		*ppr_options &= ~MSG_EXT_PPR_DT_REQ;
 	}
 	if (transinfo->period == 0) {
@@ -1679,7 +1679,7 @@ ahc_devlimited_syncrate(struct ahc_softc
 		*ppr_options = 0;
 		return (NULL);
 	}
-	*period = MAX(*period, transinfo->period);
+	*period = MAX(*period, (u_int) transinfo->period);
 	return (ahc_find_syncrate(ahc, period, ppr_options, maxsync));
 }
 
@@ -1807,9 +1807,9 @@ ahc_validate_offset(struct ahc_softc *ah
 	*offset = MIN(*offset, maxoffset);
 	if (tinfo != NULL) {
 		if (role == ROLE_TARGET)
-			*offset = MIN(*offset, tinfo->user.offset);
+			*offset = MIN(*offset, (u_int) tinfo->user.offset);
 		else
-			*offset = MIN(*offset, tinfo->goal.offset);
+			*offset = MIN(*offset, (u_int) tinfo->goal.offset);
 	}
 }
 
@@ -1835,9 +1835,9 @@ ahc_validate_width(struct ahc_softc *ahc
 	}
 	if (tinfo != NULL) {
 		if (role == ROLE_TARGET)
-			*bus_width = MIN(tinfo->user.width, *bus_width);
+			*bus_width = MIN((u_int) tinfo->user.width, *bus_width);
 		else
-			*bus_width = MIN(tinfo->goal.width, *bus_width);
+			*bus_width = MIN((u_int) tinfo->goal.width, *bus_width);
 	}
 }
 
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic7xxx_osm.c linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic7xxx_osm.c
--- linux-2.6.18-rc5-orig/drivers/scsi/aic7xxx/aic7xxx_osm.c	2006-09-07 14:23:10.000000000 +0530
+++ linux-2.6.18-rc5/drivers/scsi/aic7xxx/aic7xxx_osm.c	2006-09-07 14:20:56.000000000 +0530
@@ -1877,7 +1877,7 @@ ahc_linux_handle_scsi_status(struct ahc_
 
 			sense_size = MIN(sizeof(struct scsi_sense_data)
 				       - ahc_get_sense_residual(scb),
-					 sizeof(cmd->sense_buffer));
+					 (u_long) sizeof(cmd->sense_buffer));
 			memcpy(cmd->sense_buffer,
 			       ahc_get_sense_buf(ahc, scb), sense_size);
 			if (sense_size < sizeof(cmd->sense_buffer))
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/fs/xfs/xfs_btree.h linux-2.6.18-rc5/fs/xfs/xfs_btree.h
--- linux-2.6.18-rc5-orig/fs/xfs/xfs_btree.h	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc5/fs/xfs/xfs_btree.h	2006-09-07 12:58:51.000000000 +0530
@@ -18,6 +18,8 @@
 #ifndef __XFS_BTREE_H__
 #define	__XFS_BTREE_H__
 
+#include <linux/kernel.h>
+
 struct xfs_buf;
 struct xfs_bmap_free;
 struct xfs_inode;
@@ -441,30 +443,14 @@ xfs_btree_setbuf(
 /*
  * Min and max functions for extlen, agblock, fileoff, and filblks types.
  */
-#define	XFS_EXTLEN_MIN(a,b)	\
-	((xfs_extlen_t)(a) < (xfs_extlen_t)(b) ? \
-		(xfs_extlen_t)(a) : (xfs_extlen_t)(b))
-#define	XFS_EXTLEN_MAX(a,b)	\
-	((xfs_extlen_t)(a) > (xfs_extlen_t)(b) ? \
-		(xfs_extlen_t)(a) : (xfs_extlen_t)(b))
-#define	XFS_AGBLOCK_MIN(a,b)	\
-	((xfs_agblock_t)(a) < (xfs_agblock_t)(b) ? \
-		(xfs_agblock_t)(a) : (xfs_agblock_t)(b))
-#define	XFS_AGBLOCK_MAX(a,b)	\
-	((xfs_agblock_t)(a) > (xfs_agblock_t)(b) ? \
-		(xfs_agblock_t)(a) : (xfs_agblock_t)(b))
-#define	XFS_FILEOFF_MIN(a,b)	\
-	((xfs_fileoff_t)(a) < (xfs_fileoff_t)(b) ? \
-		(xfs_fileoff_t)(a) : (xfs_fileoff_t)(b))
-#define	XFS_FILEOFF_MAX(a,b)	\
-	((xfs_fileoff_t)(a) > (xfs_fileoff_t)(b) ? \
-		(xfs_fileoff_t)(a) : (xfs_fileoff_t)(b))
-#define	XFS_FILBLKS_MIN(a,b)	\
-	((xfs_filblks_t)(a) < (xfs_filblks_t)(b) ? \
-		(xfs_filblks_t)(a) : (xfs_filblks_t)(b))
-#define	XFS_FILBLKS_MAX(a,b)	\
-	((xfs_filblks_t)(a) > (xfs_filblks_t)(b) ? \
-		(xfs_filblks_t)(a) : (xfs_filblks_t)(b))
+#define	XFS_EXTLEN_MIN(a,b)   (min_t(xfs_extlen_t,a,b))
+#define	XFS_EXTLEN_MAX(a,b)	  (max_t(xfs_extlen_t,a,b))
+#define	XFS_AGBLOCK_MIN(a,b)  (min_t(xfs_agblock_t,a,b))
+#define	XFS_AGBLOCK_MAX(a,b)  (max_t(xfs_agblock_t,a,b))
+#define	XFS_FILEOFF_MIN(a,b)  (min_t(xfs_fileoff_t,a,b))
+#define	XFS_FILEOFF_MAX(a,b)  (max_t(xfs_fileoff_t,a,b))
+#define	XFS_FILBLKS_MIN(a,b)  (min_t(xfs_filblks_t,a,b))
+#define	XFS_FILBLKS_MAX(a,b)  (max_t(xfs_filblks_t,a,b))
 
 #define	XFS_FSB_SANITY_CHECK(mp,fsb)	\
 	(XFS_FSB_TO_AGNO(mp, fsb) < mp->m_sb.sb_agcount && \
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/fs/xfs/xfs_rtalloc.c linux-2.6.18-rc5/fs/xfs/xfs_rtalloc.c
--- linux-2.6.18-rc5-orig/fs/xfs/xfs_rtalloc.c	2006-09-07 11:10:11.000000000 +0530
+++ linux-2.6.18-rc5/fs/xfs/xfs_rtalloc.c	2006-09-07 12:53:56.000000000 +0530
@@ -699,8 +699,8 @@ xfs_rtallocate_extent_size(
 			 * this summary level.
 			 */
 			error = xfs_rtallocate_extent_block(mp, tp, i,
-					XFS_RTMAX(minlen, 1 << l),
-					XFS_RTMIN(maxlen, (1 << (l + 1)) - 1),
+					XFS_RTMAX(minlen, (xfs_extlen_t)(1 << l)),
+					XFS_RTMIN(maxlen, (xfs_extlen_t)(1 << (l + 1)) - 1),
 					len, &n, rbpp, rsb, prod, &r);
 			if (error) {
 				return error;
@@ -1020,7 +1020,7 @@ xfs_rtcheck_range(
 		/*
 		 * Compute first bit not examined.
 		 */
-		lastbit = XFS_RTMIN(bit + len, XFS_NBWORD);
+		lastbit = XFS_RTMIN(bit + len, (xfs_extlen_t) XFS_NBWORD);
 		/*
 		 * Mask of relevant bits.
 		 */
@@ -1238,7 +1238,7 @@ xfs_rtfind_back(
 		 * Calculate first (leftmost) bit number to look at,
 		 * and mask for all the relevant bits in this word.
 		 */
-		firstbit = XFS_RTMAX((xfs_srtblock_t)(bit - len + 1), 0);
+		firstbit = XFS_RTMAX((xfs_srtblock_t)(bit - len + 1), (xfs_srtblock_t) 0);
 		mask = (((xfs_rtword_t)1 << (bit - firstbit + 1)) - 1) <<
 			firstbit;
 		/*
@@ -1413,7 +1413,7 @@ xfs_rtfind_forw(
 		 * Calculate last (rightmost) bit number to look at,
 		 * and mask for all the relevant bits in this word.
 		 */
-		lastbit = XFS_RTMIN(bit + len, XFS_NBWORD);
+		lastbit = XFS_RTMIN(bit + len, (xfs_rtblock_t) XFS_NBWORD);
 		mask = (((xfs_rtword_t)1 << (lastbit - bit)) - 1) << bit;
 		/*
 		 * Calculate the difference between the value there
@@ -1724,7 +1724,7 @@ xfs_rtmodify_range(
 		/*
 		 * Compute first bit not changed and mask of relevant bits.
 		 */
-		lastbit = XFS_RTMIN(bit + len, XFS_NBWORD);
+		lastbit = XFS_RTMIN(bit + len, (xfs_extlen_t) XFS_NBWORD);
 		mask = (((xfs_rtword_t)1 << (lastbit - bit)) - 1) << bit;
 		/*
 		 * Set/clear the active bits.
@@ -2000,8 +2000,8 @@ xfs_growfs_rt(
 		nsbp->sb_rbmblocks = bmbno + 1;
 		nsbp->sb_rblocks =
 			XFS_RTMIN(nrblocks,
-				  nsbp->sb_rbmblocks * NBBY *
-				  nsbp->sb_blocksize * nsbp->sb_rextsize);
+				  (xfs_drfsbno_t)(nsbp->sb_rbmblocks * NBBY *
+				  nsbp->sb_blocksize * nsbp->sb_rextsize));
 		nsbp->sb_rextents = nsbp->sb_rblocks;
 		do_div(nsbp->sb_rextents, nsbp->sb_rextsize);
 		nsbp->sb_rextslog = xfs_highbit32(nsbp->sb_rextents);
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/fs/xfs/xfs_rtalloc.h linux-2.6.18-rc5/fs/xfs/xfs_rtalloc.h
--- linux-2.6.18-rc5-orig/fs/xfs/xfs_rtalloc.h	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc5/fs/xfs/xfs_rtalloc.h	2006-09-07 11:47:07.000000000 +0530
@@ -18,6 +18,8 @@
 #ifndef __XFS_RTALLOC_H__
 #define	__XFS_RTALLOC_H__
 
+#include <linux/kernel.h>
+
 struct xfs_mount;
 struct xfs_trans;
 
@@ -57,8 +59,8 @@ struct xfs_trans;
 #define	XFS_BITTOWORD(mp,bi)	\
 	((int)(((bi) >> XFS_NBWORDLOG) & XFS_BLOCKWMASK(mp)))
 
-#define	XFS_RTMIN(a,b)	((a) < (b) ? (a) : (b))
-#define	XFS_RTMAX(a,b)	((a) > (b) ? (a) : (b))
+#define	XFS_RTMIN(a,b)	(min(a,b))
+#define	XFS_RTMAX(a,b)	(max(a,b))
 
 #define	XFS_RTLOBIT(w)	xfs_lowbit32(w)
 #define	XFS_RTHIBIT(w)	xfs_highbit32(w)
diff -uprN -X linux-2.6.18-rc5-orig/Documentation/dontdiff linux-2.6.18-rc5-orig/include/linux/utsrelease.h linux-2.6.18-rc5/include/linux/utsrelease.h
--- linux-2.6.18-rc5-orig/include/linux/utsrelease.h	1970-01-01 05:30:00.000000000 +0530
+++ linux-2.6.18-rc5/include/linux/utsrelease.h	2006-09-07 14:26:16.000000000 +0530
@@ -0,0 +1 @@
+#define UTS_RELEASE "2.6.18-rc5"

--=-Tkfw4SCeN67Aq1CPFNTF
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--=-Tkfw4SCeN67Aq1CPFNTF--
