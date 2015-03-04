From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 04 Mar 2015 10:31:01 +0000
Subject: [PATCH 1/2] staging: rts5208: Convert non-returned local variable to boolean when relevant
Message-Id: <20150304103101.GA9451@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This patch was produced using Coccinelle. A simplified version of the
semantic patch is:

@r exists@
identifier f;
local idexpression u8 x;
identifier xname;
@@

f(...) {
...when any
(
  x@xname = 1;
|
  x@xname = 0;
)
...when any
}

@bad exists@
identifier r.f;
local idexpression u8 r.x
expression e1 != {0, 1}, e2;
@@

f(...) {
...when any
(
  x = e1;
|
  x + e2
)
...when any
}

@depends on !bad@
identifier r.f;
local idexpression u8 r.x;
identifier r.xname;
@@

f(...) {
...
++ bool xname;
- int xname;
<...
(
  x - 1
+ true
|
  x - -1
+ false
)
...>

}

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/rts5208/ms.c        | 14 +++---
 drivers/staging/rts5208/rtsx_chip.c | 56 ++++++++++++-----------
 drivers/staging/rts5208/rtsx_scsi.c | 38 +++++++++-------
 drivers/staging/rts5208/sd.c        | 88 +++++++++++++++++++------------------
 4 files changed, 105 insertions(+), 91 deletions(-)

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index a47a191..050bc47 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -1560,7 +1560,8 @@ static int ms_copy_page(struct rtsx_chip *chip, u16 old_blk, u16 new_blk,
 		u16 log_blk, u8 start_page, u8 end_page)
 {
 	struct ms_info *ms_card = &(chip->ms_card);
-	int retval, rty_cnt, uncorrect_flag = 0;
+	bool uncorrect_flag = false;
+	int retval, rty_cnt;
 	u8 extra[MS_EXTRA_SIZE], val, i, j, data[16];
 
 	dev_dbg(rtsx_dev(chip), "Copy page from 0x%x to 0x%x, logical block is 0x%x\n",
@@ -1642,10 +1643,10 @@ static int ms_copy_page(struct rtsx_chip *chip, u16 old_blk, u16 new_blk,
 			if (val & INT_REG_ERR) {
 				retval = ms_read_status_reg(chip);
 				if (retval != STATUS_SUCCESS) {
-					uncorrect_flag = 1;
+					uncorrect_flag = true;
 					dev_dbg(rtsx_dev(chip), "Uncorrectable error\n");
 				} else {
-					uncorrect_flag = 0;
+					uncorrect_flag = false;
 				}
 
 				retval = ms_transfer_tpc(chip,
@@ -2187,7 +2188,8 @@ static int ms_build_l2p_tbl(struct rtsx_chip *chip, int seg_no)
 {
 	struct ms_info *ms_card = &(chip->ms_card);
 	struct zone_entry *segment;
-	int retval, table_size, disable_cnt, defect_flag, i;
+	bool defect_flag;
+	int retval, table_size, disable_cnt, i;
 	u16 start, end, phy_blk, log_blk, tmp_blk;
 	u8 extra[MS_EXTRA_SIZE], us1, us2;
 
@@ -2236,10 +2238,10 @@ static int ms_build_l2p_tbl(struct rtsx_chip *chip, int seg_no)
 
 	for (phy_blk = start; phy_blk < end; phy_blk++) {
 		if (disable_cnt) {
-			defect_flag = 0;
+			defect_flag = false;
 			for (i = 0; i < segment->disable_count; i++) {
 				if (phy_blk = segment->defect_list[i]) {
-					defect_flag = 1;
+					defect_flag = true;
 					break;
 				}
 			}
diff --git a/drivers/staging/rts5208/rtsx_chip.c b/drivers/staging/rts5208/rtsx_chip.c
index 9593d81..35fa19d 100644
--- a/drivers/staging/rts5208/rtsx_chip.c
+++ b/drivers/staging/rts5208/rtsx_chip.c
@@ -153,22 +153,22 @@ static int rtsx_pre_handle_sdio_old(struct rtsx_chip *chip)
 static int rtsx_pre_handle_sdio_new(struct rtsx_chip *chip)
 {
 	u8 tmp;
-	int sw_bypass_sd = 0;
+	bool sw_bypass_sd = false;
 	int retval;
 
 	if (chip->driver_first_load) {
 		if (CHECK_PID(chip, 0x5288)) {
 			RTSX_READ_REG(chip, 0xFE5A, &tmp);
 			if (tmp & 0x08)
-				sw_bypass_sd = 1;
+				sw_bypass_sd = true;
 		} else if (CHECK_PID(chip, 0x5208)) {
 			RTSX_READ_REG(chip, 0xFE70, &tmp);
 			if (tmp & 0x80)
-				sw_bypass_sd = 1;
+				sw_bypass_sd = true;
 		}
 	} else {
 		if (chip->sdio_in_charge)
-			sw_bypass_sd = 1;
+			sw_bypass_sd = true;
 	}
 	dev_dbg(rtsx_dev(chip), "chip->sdio_in_charge = %d\n",
 		chip->sdio_in_charge);
@@ -501,13 +501,14 @@ nextcard:
 
 static inline int check_sd_speed_prior(u32 sd_speed_prior)
 {
-	int i, fake_para = 0;
+	bool fake_para = false;
+	int i;
 
 	for (i = 0; i < 4; i++) {
 		u8 tmp = (u8)(sd_speed_prior >> (i*8));
 
 		if ((tmp < 0x01) || (tmp > 0x04)) {
-			fake_para = 1;
+			fake_para = true;
 			break;
 		}
 	}
@@ -517,13 +518,14 @@ static inline int check_sd_speed_prior(u32 sd_speed_prior)
 
 static inline int check_sd_current_prior(u32 sd_current_prior)
 {
-	int i, fake_para = 0;
+	bool fake_para = false;
+	int i;
 
 	for (i = 0; i < 4; i++) {
 		u8 tmp = (u8)(sd_current_prior >> (i*8));
 
 		if (tmp > 0x03) {
-			fake_para = 1;
+			fake_para = true;
 			break;
 		}
 	}
@@ -784,31 +786,31 @@ static inline void rtsx_blink_led(struct rtsx_chip *chip)
 
 static void rtsx_monitor_aspm_config(struct rtsx_chip *chip)
 {
-	int maybe_support_aspm, reg_changed;
+	bool reg_changed, maybe_support_aspm;
 	u32 tmp = 0;
 	u8 reg0 = 0, reg1 = 0;
 
-	maybe_support_aspm = 0;
-	reg_changed = 0;
+	maybe_support_aspm = false;
+	reg_changed = false;
 	rtsx_read_config_byte(chip, LCTLR, &reg0);
 	if (chip->aspm_level[0] != reg0) {
-		reg_changed = 1;
+		reg_changed = true;
 		chip->aspm_level[0] = reg0;
 	}
 	if (CHK_SDIO_EXIST(chip) && !CHK_SDIO_IGNORED(chip)) {
 		rtsx_read_cfg_dw(chip, 1, 0xC0, &tmp);
 		reg1 = (u8)tmp;
 		if (chip->aspm_level[1] != reg1) {
-			reg_changed = 1;
+			reg_changed = true;
 			chip->aspm_level[1] = reg1;
 		}
 
 		if ((reg0 & 0x03) && (reg1 & 0x03))
-			maybe_support_aspm = 1;
+			maybe_support_aspm = true;
 
 	} else {
 		if (reg0 & 0x03)
-			maybe_support_aspm = 1;
+			maybe_support_aspm = true;
 	}
 
 	if (reg_changed) {
@@ -835,7 +837,7 @@ void rtsx_polling_func(struct rtsx_chip *chip)
 #ifdef SUPPORT_SD_LOCK
 	struct sd_info *sd_card = &chip->sd_card;
 #endif
-	int ss_allowed;
+	bool ss_allowed;
 
 	if (rtsx_chk_stat(chip, RTSX_STAT_SUSPEND))
 		return;
@@ -887,21 +889,21 @@ void rtsx_polling_func(struct rtsx_chip *chip)
 	rtsx_init_cards(chip);
 
 	if (chip->ss_en) {
-		ss_allowed = 1;
+		ss_allowed = true;
 
 		if (CHECK_PID(chip, 0x5288)) {
-			ss_allowed = 0;
+			ss_allowed = false;
 		} else {
 			if (CHK_SDIO_EXIST(chip) && !CHK_SDIO_IGNORED(chip)) {
 				u32 val;
 
 				rtsx_read_cfg_dw(chip, 1, 0x04, &val);
 				if (val & 0x07)
-					ss_allowed = 0;
+					ss_allowed = false;
 			}
 		}
 	} else {
-		ss_allowed = 0;
+		ss_allowed = false;
 	}
 
 	if (ss_allowed && !chip->sd_io) {
@@ -1358,7 +1360,8 @@ int rtsx_read_cfg_seq(struct rtsx_chip *chip, u8 func, u16 addr, u8 *buf,
 
 int rtsx_write_phy_register(struct rtsx_chip *chip, u8 addr, u16 val)
 {
-	int i, finished = 0;
+	bool finished = false;
+	int i;
 	u8 tmp;
 
 	RTSX_WRITE_REG(chip, PHYDATA0, 0xFF, (u8)val);
@@ -1369,7 +1372,7 @@ int rtsx_write_phy_register(struct rtsx_chip *chip, u8 addr, u16 val)
 	for (i = 0; i < 100000; i++) {
 		RTSX_READ_REG(chip, PHYRWCTL, &tmp);
 		if (!(tmp & 0x80)) {
-			finished = 1;
+			finished = true;
 			break;
 		}
 	}
@@ -1382,7 +1385,8 @@ int rtsx_write_phy_register(struct rtsx_chip *chip, u8 addr, u16 val)
 
 int rtsx_read_phy_register(struct rtsx_chip *chip, u8 addr, u16 *val)
 {
-	int i, finished = 0;
+	bool finished = false;
+	int i;
 	u16 data = 0;
 	u8 tmp;
 
@@ -1392,7 +1396,7 @@ int rtsx_read_phy_register(struct rtsx_chip *chip, u8 addr, u16 *val)
 	for (i = 0; i < 100000; i++) {
 		RTSX_READ_REG(chip, PHYRWCTL, &tmp);
 		if (!(tmp & 0x80)) {
-			finished = 1;
+			finished = true;
 			break;
 		}
 	}
@@ -1615,7 +1619,7 @@ void rtsx_exit_ss(struct rtsx_chip *chip)
 int rtsx_pre_handle_interrupt(struct rtsx_chip *chip)
 {
 	u32 status, int_enable;
-	int exit_ss = 0;
+	bool exit_ss = false;
 #ifdef SUPPORT_OCP
 	u32 ocp_int = 0;
 
@@ -1625,7 +1629,7 @@ int rtsx_pre_handle_interrupt(struct rtsx_chip *chip)
 	if (chip->ss_en) {
 		chip->ss_counter = 0;
 		if (rtsx_get_stat(chip) = RTSX_STAT_SS) {
-			exit_ss = 1;
+			exit_ss = true;
 			rtsx_exit_L1(chip);
 			rtsx_set_stat(chip, RTSX_STAT_RUN);
 		}
diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
index 42645834..a00ba21 100644
--- a/drivers/staging/rts5208/rtsx_scsi.c
+++ b/drivers/staging/rts5208/rtsx_scsi.c
@@ -39,7 +39,8 @@ void scsi_show_command(struct rtsx_chip *chip)
 {
 	struct scsi_cmnd *srb = chip->srb;
 	char *what = NULL;
-	int unknown_cmd = 0, len;
+	bool unknown_cmd = false;
+	int len;
 
 	switch (srb->cmnd[0]) {
 	case TEST_UNIT_READY:
@@ -310,7 +311,8 @@ void scsi_show_command(struct rtsx_chip *chip)
 		what = "Realtek's vendor command";
 		break;
 	default:
-		what = "(unknown command)"; unknown_cmd = 1;
+		what = "(unknown command)";
+		unknown_cmd = true;
 		break;
 	}
 
@@ -485,7 +487,7 @@ static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	unsigned char sendbytes;
 	unsigned char *buf;
 	u8 card = get_lun_card(chip, lun);
-	int pro_formatter_flag = 0;
+	bool pro_formatter_flag = false;
 	unsigned char inquiry_buf[] = {
 		QULIFIRE|DRCT_ACCESS_DEV,
 		RMB_DISC|0x0D,
@@ -520,7 +522,7 @@ static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	if (chip->mspro_formatter_enable)
 #endif
 		if (!card || (card = MS_CARD))
-			pro_formatter_flag = 1;
+			pro_formatter_flag = true;
 
 	if (pro_formatter_flag) {
 		if (scsi_bufflen(srb) < 56)
@@ -663,7 +665,7 @@ static void ms_mode_sense(struct rtsx_chip *chip, u8 cmd,
 	struct ms_info *ms_card = &(chip->ms_card);
 	int sys_info_offset;
 	int data_size = buf_len;
-	int support_format = 0;
+	bool support_format = false;
 	int i = 0;
 
 	if (cmd = MODE_SENSE) {
@@ -684,10 +686,10 @@ static void ms_mode_sense(struct rtsx_chip *chip, u8 cmd,
 	/* Medium Type Code */
 	if (check_card_ready(chip, lun)) {
 		if (CHK_MSXC(ms_card)) {
-			support_format = 1;
+			support_format = true;
 			buf[i++] = 0x40;
 		} else if (CHK_MSPRO(ms_card)) {
-			support_format = 1;
+			support_format = true;
 			buf[i++] = 0x20;
 		} else {
 			buf[i++] = 0x10;
@@ -755,7 +757,7 @@ static int mode_sense(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	unsigned int lun = SCSI_LUN(srb);
 	unsigned int dataSize;
 	int status;
-	int pro_formatter_flag;
+	bool pro_formatter_flag;
 	unsigned char pageCode, *buf;
 	u8 card = get_lun_card(chip, lun);
 
@@ -767,20 +769,20 @@ static int mode_sense(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	}
 #endif
 
-	pro_formatter_flag = 0;
+	pro_formatter_flag = false;
 	dataSize = 8;
 #ifdef SUPPORT_MAGIC_GATE
 	if ((chip->lun2card[lun] & MS_CARD)) {
 		if (!card || (card = MS_CARD)) {
 			dataSize = 108;
 			if (chip->mspro_formatter_enable)
-				pro_formatter_flag = 1;
+				pro_formatter_flag = true;
 		}
 	}
 #else
 	if (card = MS_CARD) {
 		if (chip->mspro_formatter_enable) {
-			pro_formatter_flag = 1;
+			pro_formatter_flag = true;
 			dataSize = 108;
 		}
 	}
@@ -2295,7 +2297,8 @@ Exit:
 static int read_cfg_byte(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 {
 	int retval;
-	u8 func, func_max;
+	bool func_max;
+	u8 func;
 	u16 addr, len;
 	u8 *buf;
 
@@ -2315,9 +2318,9 @@ static int read_cfg_byte(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 		__func__, func, addr, len);
 
 	if (CHK_SDIO_EXIST(chip) && !CHK_SDIO_IGNORED(chip))
-		func_max = 1;
+		func_max = true;
 	else
-		func_max = 0;
+		func_max = false;
 
 	if (func > func_max) {
 		set_sense_type(chip, SCSI_LUN(srb),
@@ -2349,7 +2352,8 @@ static int read_cfg_byte(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 static int write_cfg_byte(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 {
 	int retval;
-	u8 func, func_max;
+	bool func_max;
+	u8 func;
 	u16 addr, len;
 	u8 *buf;
 
@@ -2369,9 +2373,9 @@ static int write_cfg_byte(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 		__func__, func, addr);
 
 	if (CHK_SDIO_EXIST(chip) && !CHK_SDIO_IGNORED(chip))
-		func_max = 1;
+		func_max = true;
 	else
-		func_max = 0;
+		func_max = false;
 
 	if (func > func_max) {
 		set_sense_type(chip, SCSI_LUN(srb),
diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index c28a927..62bf570 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -791,7 +791,7 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
 	u16 SD_VP_CTL, SD_DCMPS_CTL;
 	u8 val;
 	int retval;
-	int ddr_rx = 0;
+	bool ddr_rx = false;
 
 	dev_dbg(rtsx_dev(chip), "sd_change_phase (sample_point = %d, tune_dir = %d)\n",
 		sample_point, tune_dir);
@@ -800,7 +800,7 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
 		SD_VP_CTL = SD_VPRX_CTL;
 		SD_DCMPS_CTL = SD_DCMPS_RX_CTL;
 		if (CHK_SD_DDR50(sd_card))
-			ddr_rx = 1;
+			ddr_rx = true;
 	} else {
 		SD_VP_CTL = SD_VPTX_CTL;
 		SD_DCMPS_CTL = SD_DCMPS_TX_CTL;
@@ -1121,7 +1121,7 @@ static int sd_check_switch(struct rtsx_chip *chip,
 {
 	int retval;
 	int i;
-	int switch_good = 0;
+	bool switch_good = false;
 
 	for (i = 0; i < 3; i++) {
 		if (detect_card_cd(chip, SD_CARD) != STATUS_SUCCESS) {
@@ -1137,7 +1137,7 @@ static int sd_check_switch(struct rtsx_chip *chip,
 			retval = sd_check_switch_mode(chip, SD_SWITCH_MODE,
 					func_group, func_to_switch, bus_width);
 			if (retval = STATUS_SUCCESS) {
-				switch_good = 1;
+				switch_good = true;
 				break;
 			}
 
@@ -1524,7 +1524,8 @@ static u8 sd_search_final_phase(struct rtsx_chip *chip, u32 phase_map,
 	struct sd_info *sd_card = &(chip->sd_card);
 	struct timing_phase_path path[MAX_PHASE + 1];
 	int i, j, cont_path_cnt;
-	int new_block, max_len, final_path_idx;
+	bool new_block;
+	int max_len, final_path_idx;
 	u8 final_phase = 0xFF;
 
 	if (phase_map = 0xFFFFFFFF) {
@@ -1537,12 +1538,12 @@ static u8 sd_search_final_phase(struct rtsx_chip *chip, u32 phase_map,
 	}
 
 	cont_path_cnt = 0;
-	new_block = 1;
+	new_block = true;
 	j = 0;
 	for (i = 0; i < MAX_PHASE + 1; i++) {
 		if (phase_map & (1 << i)) {
 			if (new_block) {
-				new_block = 0;
+				new_block = false;
 				j = cont_path_cnt++;
 				path[j].start = i;
 				path[j].end = i;
@@ -1550,7 +1551,7 @@ static u8 sd_search_final_phase(struct rtsx_chip *chip, u32 phase_map,
 				path[j].end = i;
 			}
 		} else {
-			new_block = 1;
+			new_block = true;
 			if (cont_path_cnt) {
 				int idx = cont_path_cnt - 1;
 
@@ -2141,14 +2142,15 @@ static int sd_check_wp_state(struct rtsx_chip *chip)
 static int reset_sd(struct rtsx_chip *chip)
 {
 	struct sd_info *sd_card = &(chip->sd_card);
-	int retval, i = 0, j = 0, k = 0, hi_cap_flow = 0;
-	int sd_dont_switch = 0;
-	int support_1v8 = 0;
-	int try_sdio = 1;
+	bool hi_cap_flow = false;
+	int retval, i = 0, j = 0, k = 0;
+	bool sd_dont_switch = false;
+	bool support_1v8 = false;
+	bool try_sdio = true;
 	u8 rsp[16];
 	u8 switch_bus_width;
 	u32 voltage = 0;
-	int sd20_mode = 0;
+	bool sd20_mode = false;
 
 	SET_SD(sd_card);
 
@@ -2157,7 +2159,7 @@ Switch_Fail:
 	i = 0;
 	j = 0;
 	k = 0;
-	hi_cap_flow = 0;
+	hi_cap_flow = false;
 
 #ifdef SUPPORT_SD_LOCK
 	if (sd_card->sd_lock_status & SD_UNLOCK_POW_ON)
@@ -2217,7 +2219,7 @@ RTY_SD_RST:
 				SD_RSP_TYPE_R7, rsp, 5);
 	if (retval = STATUS_SUCCESS) {
 		if ((rsp[4] = 0xAA) && ((rsp[3] & 0x0f) = 0x01)) {
-			hi_cap_flow = 1;
+			hi_cap_flow = true;
 			voltage = SUPPORT_VOLTAGE | 0x40000000;
 		}
 	}
@@ -2272,10 +2274,10 @@ RTY_SD_RST:
 		else
 			CLR_SD_HCXC(sd_card);
 
-		support_1v8 = 0;
+		support_1v8 = false;
 	} else {
 		CLR_SD_HCXC(sd_card);
-		support_1v8 = 0;
+		support_1v8 = false;
 	}
 	dev_dbg(rtsx_dev(chip), "support_1v8 = %d\n", support_1v8);
 
@@ -2361,7 +2363,7 @@ SD_UNLOCK_ENTRY:
 		TRACE_RET(chip, STATUS_FAIL);
 
 	if (!(sd_card->raw_csd[4] & 0x40))
-		sd_dont_switch = 1;
+		sd_dont_switch = true;
 
 	if (!sd_dont_switch) {
 		if (sd20_mode) {
@@ -2378,16 +2380,16 @@ SD_UNLOCK_ENTRY:
 			retval = sd_switch_function(chip, switch_bus_width);
 			if (retval != STATUS_SUCCESS) {
 				sd_init_power(chip);
-				sd_dont_switch = 1;
-				try_sdio = 0;
+				sd_dont_switch = true;
+				try_sdio = false;
 
 				goto Switch_Fail;
 			}
 		} else {
 			if (support_1v8) {
 				sd_init_power(chip);
-				sd_dont_switch = 1;
-				try_sdio = 0;
+				sd_dont_switch = true;
+				try_sdio = false;
 
 				goto Switch_Fail;
 			}
@@ -2433,8 +2435,8 @@ SD_UNLOCK_ENTRY:
 				if (retval != STATUS_SUCCESS)
 					TRACE_RET(chip, STATUS_FAIL);
 
-				try_sdio = 0;
-				sd20_mode = 1;
+				try_sdio = false;
+				sd20_mode = true;
 				goto Switch_Fail;
 			}
 		}
@@ -2458,8 +2460,8 @@ SD_UNLOCK_ENTRY:
 					if (retval != STATUS_SUCCESS)
 						TRACE_RET(chip, STATUS_FAIL);
 
-					try_sdio = 0;
-					sd20_mode = 1;
+					try_sdio = false;
+					sd20_mode = true;
 					goto Switch_Fail;
 				}
 			}
@@ -3702,7 +3704,7 @@ int sd_execute_no_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	unsigned int lun = SCSI_LUN(srb);
 	int retval, rsp_len;
 	u8 cmd_idx, rsp_type;
-	u8 standby = 0, acmd = 0;
+	bool standby = false, acmd = false;
 	u32 arg;
 
 	if (!sd_card->sd_pass_thru_en) {
@@ -3722,10 +3724,10 @@ int sd_execute_no_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 	cmd_idx = srb->cmnd[2] & 0x3F;
 	if (srb->cmnd[1] & 0x02)
-		standby = 1;
+		standby = true;
 
 	if (srb->cmnd[1] & 0x01)
-		acmd = 1;
+		acmd = true;
 
 	arg = ((u32)srb->cmnd[3] << 24) | ((u32)srb->cmnd[4] << 16) |
 		((u32)srb->cmnd[5] << 8) | srb->cmnd[6];
@@ -3812,9 +3814,10 @@ int sd_execute_read_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	struct sd_info *sd_card = &(chip->sd_card);
 	unsigned int lun = SCSI_LUN(srb);
 	int retval, rsp_len, i;
-	int cmd13_checkbit = 0, read_err = 0;
+	int cmd13_checkbit = 0;
+	bool read_err = false;
 	u8 cmd_idx, rsp_type, bus_width;
-	u8 send_cmd12 = 0, standby = 0, acmd = 0;
+	bool standby = false, send_cmd12 = false, acmd = false;
 	u32 data_len;
 
 	if (!sd_card->sd_pass_thru_en) {
@@ -3834,13 +3837,13 @@ int sd_execute_read_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 	cmd_idx = srb->cmnd[2] & 0x3F;
 	if (srb->cmnd[1] & 0x04)
-		send_cmd12 = 1;
+		send_cmd12 = true;
 
 	if (srb->cmnd[1] & 0x02)
-		standby = 1;
+		standby = true;
 
 	if (srb->cmnd[1] & 0x01)
-		acmd = 1;
+		acmd = true;
 
 	data_len = ((u32)srb->cmnd[7] << 16) | ((u32)srb->cmnd[8]
 						<< 8) | srb->cmnd[9];
@@ -3915,7 +3918,7 @@ int sd_execute_read_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 		retval = sd_read_data(chip, SD_TM_NORMAL_READ, cmd, 5, byte_cnt,
 				       blk_cnt, bus_width, buf, data_len, 2000);
 		if (retval != STATUS_SUCCESS) {
-			read_err = 1;
+			read_err = true;
 			kfree(buf);
 			rtsx_clear_sd_error(chip);
 			TRACE_GOTO(chip, SD_Execute_Read_Cmd_Failed);
@@ -3964,7 +3967,7 @@ int sd_execute_read_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 					scsi_bufflen(srb), scsi_sg_count(srb),
 					DMA_FROM_DEVICE, 10000);
 		if (retval < 0) {
-			read_err = 1;
+			read_err = true;
 			rtsx_clear_sd_error(chip);
 			TRACE_GOTO(chip, SD_Execute_Read_Cmd_Failed);
 		}
@@ -4041,9 +4044,10 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	struct sd_info *sd_card = &(chip->sd_card);
 	unsigned int lun = SCSI_LUN(srb);
 	int retval, rsp_len, i;
-	int cmd13_checkbit = 0, write_err = 0;
+	int cmd13_checkbit = 0;
+	bool write_err = false;
 	u8 cmd_idx, rsp_type;
-	u8 send_cmd12 = 0, standby = 0, acmd = 0;
+	bool standby = false, send_cmd12 = false, acmd = false;
 	u32 data_len, arg;
 #ifdef SUPPORT_SD_LOCK
 	int lock_cmd_fail = 0;
@@ -4068,13 +4072,13 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 	cmd_idx = srb->cmnd[2] & 0x3F;
 	if (srb->cmnd[1] & 0x04)
-		send_cmd12 = 1;
+		send_cmd12 = true;
 
 	if (srb->cmnd[1] & 0x02)
-		standby = 1;
+		standby = true;
 
 	if (srb->cmnd[1] & 0x01)
-		acmd = 1;
+		acmd = true;
 
 	data_len = ((u32)srb->cmnd[7] << 16) | ((u32)srb->cmnd[8]
 						<< 8) | srb->cmnd[9];
@@ -4247,7 +4251,7 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	}
 
 	if (retval < 0) {
-		write_err = 1;
+		write_err = true;
 		rtsx_clear_sd_error(chip);
 		TRACE_GOTO(chip, SD_Execute_Write_Cmd_Failed);
 	}
-- 
1.9.1

