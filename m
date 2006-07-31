From: =?iso-8859-15?Q?Cl=E9ment?= Stenac <zorglub@diwi.org>
Date: Mon, 31 Jul 2006 22:25:24 +0000
Subject: [KJ] [PATCH] Use standard min/max macros [2/3]
Message-Id: <20060731222524.GA1285@diwi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060731221329.GA31140@diwi.org>
In-Reply-To: <20060731221329.GA31140@diwi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Remove some custom type-unsafe MIN/MAX macros in favor of type-checking
min/max from kernel.h

Signed-off-by: Cl=E9ment Stenac <zorglub@diwi.org>
---

diff --git a/drivers/scsi/aic7xxx/aic79xx.h b/drivers/scsi/aic7xxx/aic79xx.h
index df3346b..c58ac6a 100644
--- a/drivers/scsi/aic7xxx/aic79xx.h
+++ b/drivers/scsi/aic7xxx/aic79xx.h
@@ -53,14 +53,6 @@ struct ahd_platform_data;
 struct scb_platform_data;
=20
 /****************************** Useful Macros ****************************=
*****/
-#ifndef MAX
-#define MAX(a,b) (((a) > (b)) ? (a) : (b))
-#endif
-
-#ifndef MIN
-#define MIN(a,b) (((a) < (b)) ? (a) : (b))
-#endif
-
 #ifndef TRUE
 #define TRUE 1
 #endif
diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic=
79xx_core.c
index 653818d..a4018fb 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -2850,14 +2850,14 @@ ahd_devlimited_syncrate(struct ahd_softc
 		transinfo =3D &tinfo->goal;
 	*ppr_options &=3D (transinfo->ppr_options|MSG_EXT_PPR_PCOMP_EN);
 	if (transinfo->width =3D MSG_EXT_WDTR_BUS_8_BIT) {
-		maxsync =3D MAX(maxsync, AHD_SYNCRATE_ULTRA2);
+		maxsync =3D max(maxsync, AHD_SYNCRATE_ULTRA2);
 		*ppr_options &=3D ~MSG_EXT_PPR_DT_REQ;
 	}
 	if (transinfo->period =3D 0) {
 		*period =3D 0;
 		*ppr_options =3D 0;
 	} else {
-		*period =3D MAX(*period, transinfo->period);
+		*period =3D max(*period, transinfo->period);
 		ahd_find_syncrate(ahd, period, ppr_options, maxsync);
 	}
 }
@@ -2924,12 +2924,12 @@ ahd_validate_offset(struct ahd_softc *ah
 			maxoffset =3D MAX_OFFSET_PACED;
 	} else
 		maxoffset =3D MAX_OFFSET_NON_PACED;
-	*offset =3D MIN(*offset, maxoffset);
+	*offset =3D min(*offset, maxoffset);
 	if (tinfo !=3D NULL) {
 		if (role =3D ROLE_TARGET)
-			*offset =3D MIN(*offset, tinfo->user.offset);
+			*offset =3D min(*offset, tinfo->user.offset);
 		else
-			*offset =3D MIN(*offset, tinfo->goal.offset);
+			*offset =3D min(*offset, tinfo->goal.offset);
 	}
 }
=20
@@ -2955,9 +2955,9 @@ ahd_validate_width(struct ahd_softc *ahd
 	}
 	if (tinfo !=3D NULL) {
 		if (role =3D ROLE_TARGET)
-			*bus_width =3D MIN(tinfo->user.width, *bus_width);
+			*bus_width =3D min(tinfo->user.width, *bus_width);
 		else
-			*bus_width =3D MIN(tinfo->goal.width, *bus_width);
+			*bus_width =3D min(tinfo->goal.width, *bus_width);
 	}
 }
=20
@@ -6057,9 +6057,9 @@ #ifdef AHD_DEBUG
 #endif
 	}
=20
-	newcount =3D MIN(scb_data->sense_left, scb_data->scbs_left);
-	newcount =3D MIN(newcount, scb_data->sgs_left);
-	newcount =3D MIN(newcount, (AHD_SCB_MAX_ALLOC - scb_data->numscbs));
+	newcount =3D min(scb_data->sense_left, scb_data->scbs_left);
+	newcount =3D min(newcount, scb_data->sgs_left);
+	newcount =3D min(newcount, (AHD_SCB_MAX_ALLOC - scb_data->numscbs));
 	for (i =3D 0; i < newcount; i++) {
 		struct scb_platform_data *pdata;
 		u_int col_tag;
@@ -8668,7 +8668,7 @@ ahd_resolve_seqaddr(struct ahd_softc *ah
 		if (skip_addr > i) {
 			int end_addr;
=20
-			end_addr =3D MIN(address, skip_addr);
+			end_addr =3D min(address, skip_addr);
 			address_offset +=3D end_addr - i;
 			i =3D skip_addr;
 		} else {
diff --git a/drivers/scsi/aic7xxx/aic79xx_osm.c b/drivers/scsi/aic7xxx/aic7=
9xx_osm.c
index 998999c..f10ad1b 100644
--- a/drivers/scsi/aic7xxx/aic79xx_osm.c
+++ b/drivers/scsi/aic7xxx/aic79xx_osm.c
@@ -1813,7 +1813,7 @@ ahd_linux_handle_scsi_status(struct ahd_
 			u_int sense_offset;
=20
 			if (scb->flags & SCB_SENSE) {
-				sense_size =3D MIN(sizeof(struct scsi_sense_data)
+				sense_size =3D min(sizeof(struct scsi_sense_data)
 					       - ahd_get_sense_residual(scb),
 						 sizeof(cmd->sense_buffer));
 				sense_offset =3D 0;
@@ -1824,7 +1824,7 @@ ahd_linux_handle_scsi_status(struct ahd_
 				 */
 				siu =3D (struct scsi_status_iu_header *)
 				    scb->sense_data;
-				sense_size =3D MIN(scsi_4btoul(siu->sense_length),
+				sense_size =3D min(scsi_4btoul(siu->sense_length),
 						sizeof(cmd->sense_buffer));
 				sense_offset =3D SIU_SENSE_OFFSET(siu);
 			}
diff --git a/drivers/scsi/aic7xxx/aic7xxx.h b/drivers/scsi/aic7xxx/aic7xxx.h
index 62ff8c3..4850820 100644
--- a/drivers/scsi/aic7xxx/aic7xxx.h
+++ b/drivers/scsi/aic7xxx/aic7xxx.h
@@ -54,14 +54,6 @@ struct scb_platform_data;
 struct seeprom_descriptor;
=20
 /****************************** Useful Macros ****************************=
*****/
-#ifndef MAX
-#define MAX(a,b) (((a) > (b)) ? (a) : (b))
-#endif
-
-#ifndef MIN
-#define MIN(a,b) (((a) < (b)) ? (a) : (b))
-#endif
-
 #ifndef TRUE
 #define TRUE 1
 #endif
diff --git a/drivers/scsi/aic7xxx/aic7xxx_core.c b/drivers/scsi/aic7xxx/aic=
7xxx_core.c
index 93e4e40..6405669 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_core.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_core.c
@@ -1671,7 +1671,7 @@ ahc_devlimited_syncrate(struct ahc_softc
 		transinfo =3D &tinfo->goal;
 	*ppr_options &=3D transinfo->ppr_options;
 	if (transinfo->width =3D MSG_EXT_WDTR_BUS_8_BIT) {
-		maxsync =3D MAX(maxsync, AHC_SYNCRATE_ULTRA2);
+		maxsync =3D max(maxsync, AHC_SYNCRATE_ULTRA2);
 		*ppr_options &=3D ~MSG_EXT_PPR_DT_REQ;
 	}
 	if (transinfo->period =3D 0) {
@@ -1679,7 +1679,7 @@ ahc_devlimited_syncrate(struct ahc_softc
 		*ppr_options =3D 0;
 		return (NULL);
 	}
-	*period =3D MAX(*period, transinfo->period);
+	*period =3D max(*period, transinfo->period);
 	return (ahc_find_syncrate(ahc, period, ppr_options, maxsync));
 }
=20
@@ -1804,12 +1804,12 @@ ahc_validate_offset(struct ahc_softc *ah
 		else
 			maxoffset =3D MAX_OFFSET_8BIT;
 	}
-	*offset =3D MIN(*offset, maxoffset);
+	*offset =3D min(*offset, maxoffset);
 	if (tinfo !=3D NULL) {
 		if (role =3D ROLE_TARGET)
-			*offset =3D MIN(*offset, tinfo->user.offset);
+			*offset =3D min(*offset, tinfo->user.offset);
 		else
-			*offset =3D MIN(*offset, tinfo->goal.offset);
+			*offset =3D min(*offset, tinfo->goal.offset);
 	}
 }
=20
@@ -1835,9 +1835,9 @@ ahc_validate_width(struct ahc_softc *ahc
 	}
 	if (tinfo !=3D NULL) {
 		if (role =3D ROLE_TARGET)
-			*bus_width =3D MIN(tinfo->user.width, *bus_width);
+			*bus_width =3D min(tinfo->user.width, *bus_width);
 		else
-			*bus_width =3D MIN(tinfo->goal.width, *bus_width);
+			*bus_width =3D min(tinfo->goal.width, *bus_width);
 	}
 }
=20
@@ -4406,7 +4406,7 @@ ahc_alloc_scbs(struct ahc_softc *ahc)
 	physaddr =3D sg_map->sg_physaddr;
=20
 	newcount =3D (PAGE_SIZE / (AHC_NSEG * sizeof(struct ahc_dma_seg)));
-	newcount =3D MIN(newcount, (AHC_SCB_MAX_ALLOC - scb_data->numscbs));
+	newcount =3D min(newcount, (AHC_SCB_MAX_ALLOC - scb_data->numscbs));
 	for (i =3D 0; i < newcount; i++) {
 		struct scb_platform_data *pdata;
 #ifndef __linux__
@@ -6442,7 +6442,7 @@ ahc_download_instr(struct ahc_softc *ahc
 			if (skip_addr > i) {
 				int end_addr;
=20
-				end_addr =3D MIN(address, skip_addr);
+				end_addr =3D min(address, skip_addr);
 				address_offset +=3D end_addr - i;
 				i =3D skip_addr;
 			} else {
diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm.c b/drivers/scsi/aic7xxx/aic7=
xxx_osm.c
index aa4be8a..8d2c467 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_osm.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_osm.c
@@ -1875,7 +1875,7 @@ ahc_linux_handle_scsi_status(struct ahc_
 		if (scb->flags & SCB_SENSE) {
 			u_int sense_size;
=20
-			sense_size =3D MIN(sizeof(struct scsi_sense_data)
+			sense_size =3D min(sizeof(struct scsi_sense_data)
 				       - ahc_get_sense_residual(scb),
 					 sizeof(cmd->sense_buffer));
 			memcpy(cmd->sense_buffer,
diff --git a/drivers/scsi/ips.h b/drivers/scsi/ips.h
index f46c382..8264f55 100644
--- a/drivers/scsi/ips.h
+++ b/drivers/scsi/ips.h
@@ -120,10 +120,6 @@ #include <linux/version.h>
       #define MDELAY mdelay
    #endif
=20
-   #ifndef min
-      #define min(x,y) ((x) < (y) ? x : y)
-   #endif
-  =20
    #ifndef __iomem       /* For clean compiles in earlier kernels without =
__iomem annotations */
       #define __iomem
    #endif
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
