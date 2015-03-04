From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 04 Mar 2015 10:31:53 +0000
Subject: [PATCH 2/2] staging: rts5208: Convert variable from int to bool and propagate the change to function
Message-Id: <20150304103153.GA9466@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This patch convert local variables declared as int into booleans.
It also propagates the conversion when these variables were used
as function parameters.

Coccinelle was used to generate this patch.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/rts5208/ms.c        |  9 ++++----
 drivers/staging/rts5208/ms.h        |  2 +-
 drivers/staging/rts5208/rtsx_scsi.c |  7 +++---
 drivers/staging/rts5208/sd.c        | 44 ++++++++++++++++++-------------------
 drivers/staging/rts5208/sd.h        |  2 +-
 5 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index 050bc47..7638f80 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -107,7 +107,7 @@ static int ms_transfer_tpc(struct rtsx_chip *chip, u8 trans_mode,
 }
 
 static int ms_transfer_data(struct rtsx_chip *chip, u8 trans_mode,
-			u8 tpc, u16 sec_cnt, u8 cfg, int mode_2k,
+			u8 tpc, u16 sec_cnt, u8 cfg, bool mode_2k,
 			int use_sg, void *buf, int buf_len)
 {
 	int retval;
@@ -2524,7 +2524,8 @@ static int mspro_rw_multi_sector(struct scsi_cmnd *srb,
 				u16 sector_cnt)
 {
 	struct ms_info *ms_card = &(chip->ms_card);
-	int retval, mode_2k = 0;
+	bool mode_2k = false;
+	int retval;
 	u16 count;
 	u8 val, trans_mode, rw_tpc, rw_cmd;
 
@@ -2549,7 +2550,7 @@ static int mspro_rw_multi_sector(struct scsi_cmnd *srb,
 				rw_tpc = PRO_WRITE_QUAD_DATA;
 				rw_cmd = PRO_WRITE_2K_DATA;
 			}
-			mode_2k = 1;
+			mode_2k = true;
 		}
 	} else {
 		if (srb->sc_data_direction = DMA_FROM_DEVICE) {
@@ -2782,7 +2783,7 @@ void mspro_polling_format_status(struct rtsx_chip *chip)
 }
 
 int mspro_format(struct scsi_cmnd *srb, struct rtsx_chip *chip,
-		int short_data_len, int quick_format)
+		int short_data_len, bool quick_format)
 {
 	struct ms_info *ms_card = &(chip->ms_card);
 	int retval, i;
diff --git a/drivers/staging/rts5208/ms.h b/drivers/staging/rts5208/ms.h
index 26c5b03..d919170 100644
--- a/drivers/staging/rts5208/ms.h
+++ b/drivers/staging/rts5208/ms.h
@@ -205,7 +205,7 @@ int reset_ms_card(struct rtsx_chip *chip);
 int ms_rw(struct scsi_cmnd *srb, struct rtsx_chip *chip,
 	u32 start_sector, u16 sector_cnt);
 int mspro_format(struct scsi_cmnd *srb, struct rtsx_chip *chip,
-		int short_data_len, int quick_format);
+		int short_data_len, bool quick_format);
 void ms_free_l2p_tbl(struct rtsx_chip *chip);
 void ms_cleanup_work(struct rtsx_chip *chip);
 int ms_power_off_card3v3(struct rtsx_chip *chip);
diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
index a00ba21..98f102b 100644
--- a/drivers/staging/rts5208/rtsx_scsi.c
+++ b/drivers/staging/rts5208/rtsx_scsi.c
@@ -2799,7 +2799,8 @@ static int ms_format_cmnd(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 {
 	struct ms_info *ms_card = &(chip->ms_card);
 	unsigned int lun = SCSI_LUN(srb);
-	int retval, quick_format;
+	bool quick_format;
+	int retval;
 
 	if (get_lun_card(chip, lun) != MS_CARD) {
 		set_sense_type(chip, lun, SENSE_TYPE_MEDIA_LUN_NOT_SUPPORT);
@@ -2828,9 +2829,9 @@ static int ms_format_cmnd(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	rtsx_set_stat(chip, RTSX_STAT_RUN);
 
 	if (srb->cmnd[8] & 0x01)
-		quick_format = 0;
+		quick_format = false;
 	else
-		quick_format = 1;
+		quick_format = true;
 
 	if (!(chip->card_ready & MS_CARD)) {
 		set_sense_type(chip, lun, SENSE_TYPE_MEDIA_NOT_PRESENT);
diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index 62bf570..a03cbe9 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -2606,7 +2606,7 @@ static int mmc_test_switch_bus(struct rtsx_chip *chip, u8 width)
 }
 
 
-static int mmc_switch_timing_bus(struct rtsx_chip *chip, int switch_ddr)
+static int mmc_switch_timing_bus(struct rtsx_chip *chip, bool switch_ddr)
 {
 	struct sd_info *sd_card = &(chip->sd_card);
 	int retval;
@@ -2729,7 +2729,7 @@ static int reset_mmc(struct rtsx_chip *chip)
 {
 	struct sd_info *sd_card = &(chip->sd_card);
 	int retval, i = 0, j = 0, k = 0;
-	int switch_ddr = 1;
+	bool switch_ddr = true;
 	u8 rsp[16];
 	u8 spec_ver = 0;
 	u32 temp;
@@ -2860,7 +2860,7 @@ MMC_UNLOCK_ENTRY:
 				if (retval != STATUS_SUCCESS)
 					TRACE_RET(chip, STATUS_FAIL);
 
-				switch_ddr = 0;
+				switch_ddr = false;
 				TRACE_GOTO(chip, Switch_Fail);
 			}
 
@@ -2872,7 +2872,7 @@ MMC_UNLOCK_ENTRY:
 					if (retval != STATUS_SUCCESS)
 						TRACE_RET(chip, STATUS_FAIL);
 
-					switch_ddr = 0;
+					switch_ddr = false;
 					TRACE_GOTO(chip, Switch_Fail);
 				}
 			}
@@ -3419,7 +3419,7 @@ int soft_reset_sd_card(struct rtsx_chip *chip)
 }
 
 int ext_sd_send_cmd_get_rsp(struct rtsx_chip *chip, u8 cmd_idx,
-		u32 arg, u8 rsp_type, u8 *rsp, int rsp_len, int special_check)
+		u32 arg, u8 rsp_type, u8 *rsp, int rsp_len, bool special_check)
 {
 	int retval;
 	int timeout = 100;
@@ -3513,7 +3513,7 @@ RTY_SEND_CMD:
 
 	if ((cmd_idx = SELECT_CARD) || (cmd_idx = APP_CMD) ||
 		(cmd_idx = SEND_STATUS) || (cmd_idx = STOP_TRANSMISSION)) {
-		if ((cmd_idx != STOP_TRANSMISSION) && (special_check = 0)) {
+		if ((cmd_idx != STOP_TRANSMISSION) && !special_check) {
 			if (ptr[1] & 0x80)
 				TRACE_RET(chip, STATUS_FAIL);
 		}
@@ -3773,13 +3773,13 @@ int sd_execute_no_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	if (acmd) {
 		retval = ext_sd_send_cmd_get_rsp(chip, APP_CMD,
 						sd_card->sd_addr,
-						SD_RSP_TYPE_R1, NULL, 0, 0);
+						SD_RSP_TYPE_R1, NULL, 0, false);
 		if (retval != STATUS_SUCCESS)
 			TRACE_GOTO(chip, SD_Execute_Cmd_Failed);
 	}
 
 	retval = ext_sd_send_cmd_get_rsp(chip, cmd_idx, arg, rsp_type,
-			sd_card->rsp, rsp_len, 0);
+			sd_card->rsp, rsp_len, false);
 	if (retval != STATUS_SUCCESS)
 		TRACE_GOTO(chip, SD_Execute_Cmd_Failed);
 
@@ -3814,8 +3814,7 @@ int sd_execute_read_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	struct sd_info *sd_card = &(chip->sd_card);
 	unsigned int lun = SCSI_LUN(srb);
 	int retval, rsp_len, i;
-	int cmd13_checkbit = 0;
-	bool read_err = false;
+	bool read_err = false, cmd13_checkbit = false;
 	u8 cmd_idx, rsp_type, bus_width;
 	bool standby = false, send_cmd12 = false, acmd = false;
 	u32 data_len;
@@ -3877,7 +3876,7 @@ int sd_execute_read_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 	if (data_len < 512) {
 		retval = ext_sd_send_cmd_get_rsp(chip, SET_BLOCKLEN, data_len,
-				SD_RSP_TYPE_R1, NULL, 0, 0);
+				SD_RSP_TYPE_R1, NULL, 0, false);
 		if (retval != STATUS_SUCCESS)
 			TRACE_GOTO(chip, SD_Execute_Read_Cmd_Failed);
 	}
@@ -3891,7 +3890,7 @@ int sd_execute_read_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	if (acmd) {
 		retval = ext_sd_send_cmd_get_rsp(chip, APP_CMD,
 						sd_card->sd_addr,
-						SD_RSP_TYPE_R1, NULL, 0, 0);
+						SD_RSP_TYPE_R1, NULL, 0, false);
 		if (retval != STATUS_SUCCESS)
 			TRACE_GOTO(chip, SD_Execute_Read_Cmd_Failed);
 	}
@@ -3988,14 +3987,14 @@ int sd_execute_read_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 	if (send_cmd12) {
 		retval = ext_sd_send_cmd_get_rsp(chip, STOP_TRANSMISSION,
-				0, SD_RSP_TYPE_R1b, NULL, 0, 0);
+				0, SD_RSP_TYPE_R1b, NULL, 0, false);
 		if (retval != STATUS_SUCCESS)
 			TRACE_GOTO(chip, SD_Execute_Read_Cmd_Failed);
 	}
 
 	if (data_len < 512) {
 		retval = ext_sd_send_cmd_get_rsp(chip, SET_BLOCKLEN, 0x200,
-				SD_RSP_TYPE_R1, NULL, 0, 0);
+				SD_RSP_TYPE_R1, NULL, 0, false);
 		if (retval != STATUS_SUCCESS)
 			TRACE_GOTO(chip, SD_Execute_Read_Cmd_Failed);
 
@@ -4009,7 +4008,7 @@ int sd_execute_read_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	}
 
 	if ((srb->cmnd[1] & 0x02) || (srb->cmnd[1] & 0x04))
-		cmd13_checkbit = 1;
+		cmd13_checkbit = true;
 
 	for (i = 0; i < 3; i++) {
 		retval = ext_sd_send_cmd_get_rsp(chip, SEND_STATUS,
@@ -4044,8 +4043,7 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	struct sd_info *sd_card = &(chip->sd_card);
 	unsigned int lun = SCSI_LUN(srb);
 	int retval, rsp_len, i;
-	int cmd13_checkbit = 0;
-	bool write_err = false;
+	bool write_err = false, cmd13_checkbit = false;
 	u8 cmd_idx, rsp_type;
 	bool standby = false, send_cmd12 = false, acmd = false;
 	u32 data_len, arg;
@@ -4126,7 +4124,7 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 	if (data_len < 512) {
 		retval = ext_sd_send_cmd_get_rsp(chip, SET_BLOCKLEN, data_len,
-				SD_RSP_TYPE_R1, NULL, 0, 0);
+				SD_RSP_TYPE_R1, NULL, 0, false);
 		if (retval != STATUS_SUCCESS)
 			TRACE_GOTO(chip, SD_Execute_Write_Cmd_Failed);
 	}
@@ -4140,13 +4138,13 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	if (acmd) {
 		retval = ext_sd_send_cmd_get_rsp(chip, APP_CMD,
 						sd_card->sd_addr,
-						SD_RSP_TYPE_R1, NULL, 0, 0);
+						SD_RSP_TYPE_R1, NULL, 0, false);
 		if (retval != STATUS_SUCCESS)
 			TRACE_GOTO(chip, SD_Execute_Write_Cmd_Failed);
 	}
 
 	retval = ext_sd_send_cmd_get_rsp(chip, cmd_idx, arg, rsp_type,
-			sd_card->rsp, rsp_len, 0);
+			sd_card->rsp, rsp_len, false);
 	if (retval != STATUS_SUCCESS)
 		TRACE_GOTO(chip, SD_Execute_Write_Cmd_Failed);
 
@@ -4285,14 +4283,14 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 	if (send_cmd12) {
 		retval = ext_sd_send_cmd_get_rsp(chip, STOP_TRANSMISSION,
-				0, SD_RSP_TYPE_R1b, NULL, 0, 0);
+				0, SD_RSP_TYPE_R1b, NULL, 0, false);
 		if (retval != STATUS_SUCCESS)
 			TRACE_GOTO(chip, SD_Execute_Write_Cmd_Failed);
 	}
 
 	if (data_len < 512) {
 		retval = ext_sd_send_cmd_get_rsp(chip, SET_BLOCKLEN, 0x200,
-				SD_RSP_TYPE_R1, NULL, 0, 0);
+				SD_RSP_TYPE_R1, NULL, 0, false);
 		if (retval != STATUS_SUCCESS)
 			TRACE_GOTO(chip, SD_Execute_Write_Cmd_Failed);
 
@@ -4306,7 +4304,7 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	}
 
 	if ((srb->cmnd[1] & 0x02) || (srb->cmnd[1] & 0x04))
-		cmd13_checkbit = 1;
+		cmd13_checkbit = true;
 
 	for (i = 0; i < 3; i++) {
 		retval = ext_sd_send_cmd_get_rsp(chip, SEND_STATUS,
diff --git a/drivers/staging/rts5208/sd.h b/drivers/staging/rts5208/sd.h
index 735b2d0..60b7928 100644
--- a/drivers/staging/rts5208/sd.h
+++ b/drivers/staging/rts5208/sd.h
@@ -287,7 +287,7 @@ int release_sd_card(struct rtsx_chip *chip);
 #ifdef SUPPORT_CPRM
 int soft_reset_sd_card(struct rtsx_chip *chip);
 int ext_sd_send_cmd_get_rsp(struct rtsx_chip *chip, u8 cmd_idx,
-		u32 arg, u8 rsp_type, u8 *rsp, int rsp_len, int special_check);
+		u32 arg, u8 rsp_type, u8 *rsp, int rsp_len, bool special_check);
 int ext_sd_get_rsp(struct rtsx_chip *chip, int len, u8 *rsp, u8 rsp_type);
 
 int sd_pass_thru_mode(struct scsi_cmnd *srb, struct rtsx_chip *chip);
-- 
1.9.1

