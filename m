From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 22 Apr 2004 22:16:22 +0000
Subject: [Kernel-janitors] [PATCH] drivers/scsi/aic7xxxx MIN/MAX/NUM_ELEMENTS
Message-Id: <40884436.6050001@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090005030100070701030204"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40884412.6060108@gmx.net>
In-Reply-To: <40884412.6060108@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090005030100070701030204
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.6-rc1) removes unnecessary min/max/num_elements 
macros and changes calls to use kernel.h macros instead.

Feedback is always welcome
Michael


--------------090005030100070701030204
Content-Type: text/plain;
 name="minmax_drivers_scsi_aic7.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_scsi_aic7.patch"

diff -Naur -X /data/temp/dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx/aic7770.c linux-2.6.5.new/drivers/scsi/aic7xxx/aic7770.c
--- linux-2.6.5.org/drivers/scsi/aic7xxx/aic7770.c	2004-04-04 05:38:23.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx/aic7770.c	2004-04-22 19:22:40.000000000 +0200
@@ -107,7 +107,7 @@
 		ahc_aic7770_EISA_setup
 	}
 };
-const int ahc_num_aic7770_devs = NUM_ELEMENTS(aic7770_ident_table);
+const int ahc_num_aic7770_devs = ARRAY_SIZE(aic7770_ident_table);
 
 struct aic7770_identity *
 aic7770_find_device(uint32_t id)
diff -Naur -X /data/temp/dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx/aic79xx.h linux-2.6.5.new/drivers/scsi/aic7xxx/aic79xx.h
--- linux-2.6.5.org/drivers/scsi/aic7xxx/aic79xx.h	2004-04-04 05:37:36.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx/aic79xx.h	2004-04-22 19:22:40.000000000 +0200
@@ -53,14 +53,6 @@
 struct scb_platform_data;
 
 /****************************** Useful Macros *********************************/
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
@@ -68,8 +60,6 @@
 #define FALSE 0
 #endif
 
-#define NUM_ELEMENTS(array) (sizeof(array) / sizeof(*array))
-
 #define ALL_CHANNELS '\0'
 #define ALL_TARGETS_MASK 0xFFFF
 #define INITIATOR_WILDCARD	(~0)
diff -Naur -X /data/temp/dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx/aic79xx_core.c linux-2.6.5.new/drivers/scsi/aic7xxx/aic79xx_core.c
--- linux-2.6.5.org/drivers/scsi/aic7xxx/aic79xx_core.c	2004-04-04 05:36:12.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx/aic79xx_core.c	2004-04-22 20:04:01.000000000 +0200
@@ -63,7 +63,7 @@
 	"aic7902",
 	"aic7901A"
 };
-static const u_int num_chip_names = NUM_ELEMENTS(ahd_chip_names);
+static const u_int num_chip_names = ARRAY_SIZE(ahd_chip_names);
 
 /*
  * Hardware error codes.
@@ -81,7 +81,7 @@
 	{ MPARERR,	"Scratch or SCB Memory Parity Error" },
 	{ CIOPARERR,	"CIOBUS Parity Error" },
 };
-static const u_int num_errors = NUM_ELEMENTS(ahd_hard_errors);
+static const u_int num_errors = ARRAY_SIZE(ahd_hard_errors);
 
 static struct ahd_phase_table_entry ahd_phase_table[] =
 {
@@ -101,7 +101,7 @@
  * In most cases we only wish to itterate over real phases, so
  * exclude the last element from the count.
  */
-static const u_int num_phases = NUM_ELEMENTS(ahd_phase_table) - 1;
+static const u_int num_phases = ARRAY_SIZE(ahd_phase_table) - 1;
 
 /* Our Sequencer Program */
 #include "aic79xx_seq.h"
@@ -2769,14 +2769,14 @@
 		transinfo = &tinfo->goal;
 	*ppr_options &= (transinfo->ppr_options|MSG_EXT_PPR_PCOMP_EN);
 	if (transinfo->width == MSG_EXT_WDTR_BUS_8_BIT) {
-		maxsync = MAX(maxsync, AHD_SYNCRATE_ULTRA2);
+		maxsync = max_t(u_int, maxsync, AHD_SYNCRATE_ULTRA2);
 		*ppr_options &= ~MSG_EXT_PPR_DT_REQ;
 	}
 	if (transinfo->period == 0) {
 		*period = 0;
 		*ppr_options = 0;
 	} else {
-		*period = MAX(*period, transinfo->period);
+		*period = max_t(u_int, *period, transinfo->period);
 		ahd_find_syncrate(ahd, period, ppr_options, maxsync);
 	}
 }
@@ -2843,12 +2843,12 @@
 			maxoffset = MAX_OFFSET_PACED;
 	} else
 		maxoffset = MAX_OFFSET_NON_PACED;
-	*offset = MIN(*offset, maxoffset);
+	*offset = min(*offset, maxoffset);
 	if (tinfo != NULL) {
 		if (role == ROLE_TARGET)
-			*offset = MIN(*offset, tinfo->user.offset);
+			*offset = min_t(u_int, *offset, tinfo->user.offset);
 		else
-			*offset = MIN(*offset, tinfo->goal.offset);
+			*offset = min_t(u_int, *offset, tinfo->goal.offset);
 	}
 }
 
@@ -2874,9 +2874,9 @@
 	}
 	if (tinfo != NULL) {
 		if (role == ROLE_TARGET)
-			*bus_width = MIN(tinfo->user.width, *bus_width);
+			*bus_width = min_t(u_int, tinfo->user.width, *bus_width);
 		else
-			*bus_width = MIN(tinfo->goal.width, *bus_width);
+			*bus_width = min_t(u_int, tinfo->goal.width, *bus_width);
 	}
 }
 
@@ -6043,9 +6043,9 @@
 #endif
 	}
 
-	newcount = MIN(scb_data->sense_left, scb_data->scbs_left);
-	newcount = MIN(newcount, scb_data->sgs_left);
-	newcount = MIN(newcount, (AHD_SCB_MAX_ALLOC - scb_data->numscbs));
+	newcount = min(scb_data->sense_left, scb_data->scbs_left);
+	newcount = min(newcount, scb_data->sgs_left);
+	newcount = min(newcount, (AHD_SCB_MAX_ALLOC - scb_data->numscbs));
 	scb_data->sense_left -= newcount;
 	scb_data->scbs_left -= newcount;
 	scb_data->sgs_left -= newcount;
@@ -7256,7 +7256,7 @@
 		return (wrap_qinfifonext - wrap_qinpos);
 	else
 		return (wrap_qinfifonext
-		      + NUM_ELEMENTS(ahd->qinfifo) - wrap_qinpos);
+		      + ARRAY_SIZE(ahd->qinfifo) - wrap_qinpos);
 }
 
 void
@@ -8632,7 +8632,7 @@
 		if (skip_addr > i) {
 			int end_addr;
 
-			end_addr = MIN(address, skip_addr);
+			end_addr = min(address, skip_addr);
 			address_offset += end_addr - i;
 			i = skip_addr;
 		} else {
diff -Naur -X /data/temp/dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx/aic79xx_osm.c linux-2.6.5.new/drivers/scsi/aic7xxx/aic79xx_osm.c
--- linux-2.6.5.org/drivers/scsi/aic7xxx/aic79xx_osm.c	2004-04-04 05:37:23.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx/aic79xx_osm.c	2004-04-22 20:08:49.998425648 +0200
@@ -1914,7 +1914,7 @@
 {
 
 	if ((instance >= 0) && (targ >= 0)
-	 && (instance < NUM_ELEMENTS(aic79xx_tag_info))
+	 && (instance < ARRAY_SIZE(aic79xx_tag_info))
 	 && (targ < AHD_NUM_TARGETS)) {
 		aic79xx_tag_info[instance].tag_commands[targ] = value & 0x1FF;
 		if (bootverbose)
@@ -1926,7 +1926,7 @@
 ahd_linux_setup_rd_strm_info(u_long arg, int instance, int targ, int32_t value)
 {
 	if ((instance >= 0)
-	 && (instance < NUM_ELEMENTS(aic79xx_rd_strm_info))) {
+	 && (instance < ARRAY_SIZE(aic79xx_rd_strm_info))) {
 		aic79xx_rd_strm_info[instance] = value & 0xFFFF;
 		if (bootverbose)
 			printf("rd_strm[%d] = 0x%x\n", instance, value);
@@ -1937,7 +1937,7 @@
 ahd_linux_setup_dv(u_long arg, int instance, int targ, int32_t value)
 {
 	if ((instance >= 0)
-	 && (instance < NUM_ELEMENTS(aic79xx_dv_settings))) {
+	 && (instance < ARRAY_SIZE(aic79xx_dv_settings))) {
 		aic79xx_dv_settings[instance] = value;
 		if (bootverbose)
 			printf("dv[%d] = %d\n", instance, value);
@@ -1949,7 +1949,7 @@
 {
 
 	if ((instance >= 0)
-	 && (instance < NUM_ELEMENTS(aic79xx_iocell_info))) {
+	 && (instance < ARRAY_SIZE(aic79xx_iocell_info))) {
 		uint8_t *iocell_info;
 
 		iocell_info = (uint8_t*)&aic79xx_iocell_info[instance];
@@ -1967,7 +1967,7 @@
 	tags = simple_strtoul(p + 1, NULL, 0) & 0xff;
 	printf("Setting Global Tags= %d\n", tags);
 
-	for (i = 0; i < NUM_ELEMENTS(aic79xx_tag_info); i++) {
+	for (i = 0; i < ARRAY_SIZE(aic79xx_tag_info); i++) {
 		for (j = 0; j < AHD_NUM_TARGETS; j++) {
 			aic79xx_tag_info[i].tag_commands[j] = tags;
 		}
@@ -2013,7 +2013,7 @@
 	end = strchr(s, '\0');
 
 	/*
-	 * XXX ia64 gcc isn't smart enough to know that NUM_ELEMENTS
+	 * XXX ia64 gcc isn't smart enough to know that ARRAY_SIZE
 	 * will never be 0 in this case.
 	 */      
 	n = 0;  
@@ -2021,13 +2021,13 @@
 	while ((p = strsep(&s, ",.")) != NULL) {
 		if (*p == '\0')
 			continue;
-		for (i = 0; i < NUM_ELEMENTS(options); i++) {
+		for (i = 0; i < ARRAY_SIZE(options); i++) {
 
 			n = strlen(options[i].name);
 			if (strncmp(options[i].name, p, n) == 0)
 				break;
 		}
-		if (i == NUM_ELEMENTS(options))
+		if (i == ARRAY_SIZE(options))
 			continue;
 
 		if (strncmp(p, "global_tag_depth", n) == 0) {
@@ -2356,7 +2356,7 @@
 	/*
 	 * Lookup and commit any modified IO Cell options.
 	 */
-	if (ahd->unit < NUM_ELEMENTS(aic79xx_iocell_info)) {
+	if (ahd->unit < ARRAY_SIZE(aic79xx_iocell_info)) {
 		struct ahd_linux_iocell_opts *iocell_opts;
 
 		iocell_opts = &aic79xx_iocell_info[ahd->unit];
@@ -3597,7 +3597,7 @@
 	if (offset == 0)
 		period = AHD_ASYNC_XFER_PERIOD;
 	if (targ->dv_next_narrow_period == 0)
-		targ->dv_next_narrow_period = MAX(period, AHD_SYNCRATE_ULTRA2);
+		targ->dv_next_narrow_period = max_t(uint8_t, period, AHD_SYNCRATE_ULTRA2);
 	if (targ->dv_next_wide_period == 0)
 		targ->dv_next_wide_period = period;
 	if (targ->dv_max_width == 0)
@@ -3879,7 +3879,7 @@
 
 	tags = 0;
 	if ((ahd->user_discenable & devinfo->target_mask) != 0) {
-		if (ahd->unit >= NUM_ELEMENTS(aic79xx_tag_info)) {
+		if (ahd->unit >= ARRAY_SIZE(aic79xx_tag_info)) {
 
 			if (warned_user == 0) {
 				printf(KERN_WARNING
@@ -3908,7 +3908,7 @@
 	static int warned_user;
 	int dv;
 
-	if (ahd->unit >= NUM_ELEMENTS(aic79xx_dv_settings)) {
+	if (ahd->unit >= ARRAY_SIZE(aic79xx_dv_settings)) {
 
 		if (warned_user == 0) {
 			printf(KERN_WARNING
@@ -3946,7 +3946,7 @@
 	 * If we have specific read streaming info for this controller,
 	 * apply it.  Otherwise use the defaults.
 	 */
-	 if (ahd->unit >= NUM_ELEMENTS(aic79xx_rd_strm_info)) {
+	 if (ahd->unit >= ARRAY_SIZE(aic79xx_rd_strm_info)) {
 
 		if (warned_user == 0) {
 
@@ -4582,7 +4582,7 @@
 			u_int sense_offset;
 
 			if (scb->flags & SCB_SENSE) {
-				sense_size = MIN(sizeof(struct scsi_sense_data)
+				sense_size = min_t(u_int, sizeof(struct scsi_sense_data)
 					       - ahd_get_sense_residual(scb),
 						 sizeof(cmd->sense_buffer));
 				sense_offset = 0;
@@ -4593,7 +4593,7 @@
 				 */
 				siu = (struct scsi_status_iu_header *)
 				    scb->sense_data;
-				sense_size = MIN(scsi_4btoul(siu->sense_length),
+				sense_size = min(scsi_4btoul(siu->sense_length),
 						sizeof(cmd->sense_buffer));
 				sense_offset = SIU_SENSE_OFFSET(siu);
 			}
@@ -4914,7 +4914,7 @@
 	offset = user->offset;
 	ppr_options = user->ppr_options;
 	trans_version = user->transport_version;
-	prot_version = MIN(user->protocol_version, SID_ANSI_REV(sid));
+	prot_version = min_t(u_int, user->protocol_version, SID_ANSI_REV(sid));
 
 	/*
 	 * Only attempt SPI3/4 once we've verified that
diff -Naur -X /data/temp/dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx/aic79xx_pci.c linux-2.6.5.new/drivers/scsi/aic7xxx/aic79xx_pci.c
--- linux-2.6.5.org/drivers/scsi/aic7xxx/aic79xx_pci.c	2004-04-04 05:37:06.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx/aic79xx_pci.c	2004-04-22 19:22:40.000000000 +0200
@@ -229,7 +229,7 @@
 	}
 };
 
-const u_int ahd_num_pci_devs = NUM_ELEMENTS(ahd_pci_ident_table);
+const u_int ahd_num_pci_devs = ARRAY_SIZE(ahd_pci_ident_table);
 		
 #define	DEVCONFIG		0x40
 #define		PCIXINITPAT	0x0000E000ul
diff -Naur -X /data/temp/dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx/aic7xxx.h linux-2.6.5.new/drivers/scsi/aic7xxx/aic7xxx.h
--- linux-2.6.5.org/drivers/scsi/aic7xxx/aic7xxx.h	2004-04-04 05:37:07.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx/aic7xxx.h	2004-04-22 19:22:40.000000000 +0200
@@ -54,14 +54,6 @@
 struct seeprom_descriptor;
 
 /****************************** Useful Macros *********************************/
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
@@ -69,8 +61,6 @@
 #define FALSE 0
 #endif
 
-#define NUM_ELEMENTS(array) (sizeof(array) / sizeof(*array))
-
 #define ALL_CHANNELS '\0'
 #define ALL_TARGETS_MASK 0xFFFF
 #define INITIATOR_WILDCARD	(~0)
diff -Naur -X /data/temp/dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx/aic7xxx_core.c linux-2.6.5.new/drivers/scsi/aic7xxx/aic7xxx_core.c
--- linux-2.6.5.org/drivers/scsi/aic7xxx/aic7xxx_core.c	2004-04-04 05:37:06.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx/aic7xxx_core.c	2004-04-22 20:10:31.715962232 +0200
@@ -73,7 +73,7 @@
 	"aic7892",
 	"aic7899"
 };
-static const u_int num_chip_names = NUM_ELEMENTS(ahc_chip_names);
+static const u_int num_chip_names = ARRAY_SIZE(ahc_chip_names);
 
 /*
  * Hardware error codes.
@@ -93,7 +93,7 @@
 	{ PCIERRSTAT,	"PCI Error detected" },
 	{ CIOPARERR,	"CIOBUS Parity Error" },
 };
-static const u_int num_errors = NUM_ELEMENTS(ahc_hard_errors);
+static const u_int num_errors = ARRAY_SIZE(ahc_hard_errors);
 
 static struct ahc_phase_table_entry ahc_phase_table[] =
 {
@@ -113,7 +113,7 @@
  * In most cases we only wish to itterate over real phases, so
  * exclude the last element from the count.
  */
-static const u_int num_phases = NUM_ELEMENTS(ahc_phase_table) - 1;
+static const u_int num_phases = ARRAY_SIZE(ahc_phase_table) - 1;
 
 /*
  * Valid SCSIRATE values.  (p. 3-17)
@@ -1666,7 +1666,7 @@
 		transinfo = &tinfo->goal;
 	*ppr_options &= transinfo->ppr_options;
 	if (transinfo->width == MSG_EXT_WDTR_BUS_8_BIT) {
-		maxsync = MAX(maxsync, AHC_SYNCRATE_ULTRA2);
+		maxsync = max_t(u_int, maxsync, AHC_SYNCRATE_ULTRA2);
 		*ppr_options &= ~MSG_EXT_PPR_DT_REQ;
 	}
 	if (transinfo->period == 0) {
@@ -1674,7 +1674,7 @@
 		*ppr_options = 0;
 		return (NULL);
 	}
-	*period = MAX(*period, transinfo->period);
+	*period = max_t(u_int, *period, transinfo->period);
 	return (ahc_find_syncrate(ahc, period, ppr_options, maxsync));
 }
 
@@ -1799,12 +1799,12 @@
 		else
 			maxoffset = MAX_OFFSET_8BIT;
 	}
-	*offset = MIN(*offset, maxoffset);
+	*offset = min(*offset, maxoffset);
 	if (tinfo != NULL) {
 		if (role == ROLE_TARGET)
-			*offset = MIN(*offset, tinfo->user.offset);
+			*offset = min_t(u_int, *offset, tinfo->user.offset);
 		else
-			*offset = MIN(*offset, tinfo->goal.offset);
+			*offset = min_t(u_int, *offset, tinfo->goal.offset);
 	}
 }
 
@@ -1830,9 +1830,9 @@
 	}
 	if (tinfo != NULL) {
 		if (role == ROLE_TARGET)
-			*bus_width = MIN(tinfo->user.width, *bus_width);
+			*bus_width = min_t(u_int, tinfo->user.width, *bus_width);
 		else
-			*bus_width = MIN(tinfo->goal.width, *bus_width);
+			*bus_width = min_t(u_int, tinfo->goal.width, *bus_width);
 	}
 }
 
@@ -4491,7 +4491,7 @@
 	physaddr = sg_map->sg_physaddr;
 
 	newcount = (PAGE_SIZE / (AHC_NSEG * sizeof(struct ahc_dma_seg)));
-	newcount = MIN(newcount, (AHC_SCB_MAX_ALLOC - scb_data->numscbs));
+	newcount = min(newcount, (AHC_SCB_MAX_ALLOC - scb_data->numscbs));
 	for (i = 0; i < newcount; i++) {
 		struct scb_platform_data *pdata;
 #ifndef __linux__
@@ -6518,7 +6518,7 @@
 			if (skip_addr > i) {
 				int end_addr;
 
-				end_addr = MIN(address, skip_addr);
+				end_addr = min(address, skip_addr);
 				address_offset += end_addr - i;
 				i = skip_addr;
 			} else {
diff -Naur -X /data/temp/dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx/aic7xxx_osm.c linux-2.6.5.new/drivers/scsi/aic7xxx/aic7xxx_osm.c
--- linux-2.6.5.org/drivers/scsi/aic7xxx/aic7xxx_osm.c	2004-04-04 05:36:17.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx/aic7xxx_osm.c	2004-04-22 20:11:55.325251688 +0200
@@ -1589,7 +1589,7 @@
 	tags = simple_strtoul(p + 1, NULL, 0) & 0xff;
 	printf("Setting Global Tags= %d\n", tags);
 
-	for (i = 0; i < NUM_ELEMENTS(aic7xxx_tag_info); i++) {
+	for (i = 0; i < ARRAY_SIZE(aic7xxx_tag_info); i++) {
 		for (j = 0; j < AHC_NUM_TARGETS; j++) {
 			aic7xxx_tag_info[i].tag_commands[j] = tags;
 		}
@@ -1601,7 +1601,7 @@
 {
 
 	if ((instance >= 0) && (targ >= 0)
-	 && (instance < NUM_ELEMENTS(aic7xxx_tag_info))
+	 && (instance < ARRAY_SIZE(aic7xxx_tag_info))
 	 && (targ < AHC_NUM_TARGETS)) {
 		aic7xxx_tag_info[instance].tag_commands[targ] = value & 0xff;
 		if (bootverbose)
@@ -1614,7 +1614,7 @@
 {
 
 	if ((instance >= 0)
-	 && (instance < NUM_ELEMENTS(aic7xxx_dv_settings))) {
+	 && (instance < ARRAY_SIZE(aic7xxx_dv_settings))) {
 		aic7xxx_dv_settings[instance] = value;
 		if (bootverbose)
 			printf("dv[%d] = %d\n", instance, value);
@@ -1658,7 +1658,7 @@
 	end = strchr(s, '\0');
 
 	/*
-	 * XXX ia64 gcc isn't smart enough to know that NUM_ELEMENTS
+	 * XXX ia64 gcc isn't smart enough to know that ARRAY_SIZE
 	 * will never be 0 in this case.
 	 */
 	n = 0;
@@ -1666,13 +1666,13 @@
 	while ((p = strsep(&s, ",.")) != NULL) {
 		if (*p == '\0')
 			continue;
-		for (i = 0; i < NUM_ELEMENTS(options); i++) {
+		for (i = 0; i < ARRAY_SIZE(options); i++) {
 
 			n = strlen(options[i].name);
 			if (strncmp(options[i].name, p, n) == 0)
 				break;
 		}
-		if (i == NUM_ELEMENTS(options))
+		if (i == ARRAY_SIZE(options))
 			continue;
 
 		if (strncmp(p, "global_tag_depth", n) == 0) {
@@ -3250,7 +3250,7 @@
 	if (offset == 0)
 		period = AHC_ASYNC_XFER_PERIOD;
 	if (targ->dv_next_narrow_period == 0)
-		targ->dv_next_narrow_period = MAX(period, AHC_SYNCRATE_ULTRA2);
+		targ->dv_next_narrow_period = max_t(uint8_t, period, AHC_SYNCRATE_ULTRA2);
 	if (targ->dv_next_wide_period == 0)
 		targ->dv_next_wide_period = period;
 	if (targ->dv_max_width == 0)
@@ -3536,7 +3536,7 @@
 
 	tags = 0;
 	if ((ahc->user_discenable & devinfo->target_mask) != 0) {
-		if (ahc->unit >= NUM_ELEMENTS(aic7xxx_tag_info)) {
+		if (ahc->unit >= ARRAY_SIZE(aic7xxx_tag_info)) {
 			if (warned_user == 0) {
 
 				printf(KERN_WARNING
@@ -3565,7 +3565,7 @@
 	static int warned_user;
 	int dv;
 
-	if (ahc->unit >= NUM_ELEMENTS(aic7xxx_dv_settings)) {
+	if (ahc->unit >= ARRAY_SIZE(aic7xxx_dv_settings)) {
 		if (warned_user == 0) {
 
 			printf(KERN_WARNING
@@ -4278,7 +4278,7 @@
 		if (scb->flags & SCB_SENSE) {
 			u_int sense_size;
 
-			sense_size = MIN(sizeof(struct scsi_sense_data)
+			sense_size = min_t(u_int, sizeof(struct scsi_sense_data)
 				       - ahc_get_sense_residual(scb),
 					 sizeof(cmd->sense_buffer));
 			memcpy(cmd->sense_buffer,
@@ -4558,7 +4558,7 @@
 	offset = user->offset;
 	ppr_options = user->ppr_options;
 	trans_version = user->transport_version;
-	prot_version = MIN(user->protocol_version, SID_ANSI_REV(sid));
+	prot_version = min_t(u_int, user->protocol_version, SID_ANSI_REV(sid));
 
 	/*
 	 * Only attempt SPI3/4 once we've verified that
diff -Naur -X /data/temp/dontdiff-osdl linux-2.6.5.org/drivers/scsi/aic7xxx/aic7xxx_pci.c linux-2.6.5.new/drivers/scsi/aic7xxx/aic7xxx_pci.c
--- linux-2.6.5.org/drivers/scsi/aic7xxx/aic7xxx_pci.c	2004-04-04 05:36:16.000000000 +0200
+++ linux-2.6.5.new/drivers/scsi/aic7xxx/aic7xxx_pci.c	2004-04-22 19:22:40.000000000 +0200
@@ -626,7 +626,7 @@
 	}
 };
 
-const u_int ahc_num_pci_devs = NUM_ELEMENTS(ahc_pci_ident_table);
+const u_int ahc_num_pci_devs = ARRAY_SIZE(ahc_pci_ident_table);
 		
 #define AHC_394X_SLOT_CHANNEL_A	4
 #define AHC_394X_SLOT_CHANNEL_B	5

--------------090005030100070701030204
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090005030100070701030204--
