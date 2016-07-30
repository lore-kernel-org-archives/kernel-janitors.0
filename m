From: Jonas Rickert <jrickertkc@gmail.com>
Date: Sat, 30 Jul 2016 11:27:58 +0000
Subject: [PATCH] Staging: rts5208: fix double blank line coding style issues
Message-Id: <1469878078-6298-1-git-send-email-jrickertkc@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is a patch for double blank lines and a missing blank line reported
by checkpatch.pl

Signed-off-by: Jonas Rickert <jrickertkc@gmail.com>
---
 drivers/staging/rts5208/ms.c             | 11 -----------
 drivers/staging/rts5208/ms.h             |  1 -
 drivers/staging/rts5208/rtsx.c           |  7 -------
 drivers/staging/rts5208/rtsx.h           |  2 +-
 drivers/staging/rts5208/rtsx_card.c      |  1 -
 drivers/staging/rts5208/rtsx_chip.h      |  6 ------
 drivers/staging/rts5208/rtsx_scsi.c      |  4 ----
 drivers/staging/rts5208/rtsx_transport.h |  1 -
 drivers/staging/rts5208/sd.c             |  4 ----
 drivers/staging/rts5208/spi.h            |  1 -
 drivers/staging/rts5208/xd.c             |  4 ----
 11 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index 0f0cd4a..4b3c212 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -1417,7 +1417,6 @@ static int ms_read_status_reg(struct rtsx_chip *chip)
 	return STATUS_SUCCESS;
 }
 
-
 static int ms_read_extra_data(struct rtsx_chip *chip,
 		u16 block_addr, u8 page_num, u8 *buf, int buf_len)
 {
@@ -1582,7 +1581,6 @@ static int ms_write_extra_data(struct rtsx_chip *chip,
 	return STATUS_SUCCESS;
 }
 
-
 static int ms_read_page(struct rtsx_chip *chip, u16 block_addr, u8 page_num)
 {
 	struct ms_info *ms_card = &chip->ms_card;
@@ -1667,7 +1665,6 @@ static int ms_read_page(struct rtsx_chip *chip, u16 block_addr, u8 page_num)
 	return STATUS_SUCCESS;
 }
 
-
 static int ms_set_bad_block(struct rtsx_chip *chip, u16 phy_blk)
 {
 	struct ms_info *ms_card = &chip->ms_card;
@@ -1738,7 +1735,6 @@ static int ms_set_bad_block(struct rtsx_chip *chip, u16 phy_blk)
 	return STATUS_SUCCESS;
 }
 
-
 static int ms_erase_block(struct rtsx_chip *chip, u16 phy_blk)
 {
 	struct ms_info *ms_card = &chip->ms_card;
@@ -1808,7 +1804,6 @@ ERASE_RTY:
 	return STATUS_SUCCESS;
 }
 
-
 static void ms_set_page_status(u16 log_blk, u8 type, u8 *extra, int extra_len)
 {
 	if (!extra || (extra_len < MS_EXTRA_SIZE))
@@ -2152,7 +2147,6 @@ static int ms_copy_page(struct rtsx_chip *chip, u16 old_blk, u16 new_blk,
 	return STATUS_SUCCESS;
 }
 
-
 static int reset_ms(struct rtsx_chip *chip)
 {
 	struct ms_info *ms_card = &chip->ms_card;
@@ -2809,7 +2803,6 @@ BUILD_FAIL:
 	return STATUS_FAIL;
 }
 
-
 int reset_ms_card(struct rtsx_chip *chip)
 {
 	struct ms_info *ms_card = &chip->ms_card;
@@ -2896,7 +2889,6 @@ static int mspro_set_rw_cmd(struct rtsx_chip *chip,
 	return STATUS_SUCCESS;
 }
 
-
 void mspro_stop_seq_mode(struct rtsx_chip *chip)
 {
 	struct ms_info *ms_card = &chip->ms_card;
@@ -3312,7 +3304,6 @@ int mspro_format(struct scsi_cmnd *srb, struct rtsx_chip *chip,
 	return STATUS_FAIL;
 }
 
-
 static int ms_read_multiple_pages(struct rtsx_chip *chip, u16 phy_blk,
 				u16 log_blk, u8 start_page, u8 end_page,
 				u8 *buf, unsigned int *index,
@@ -3719,7 +3710,6 @@ static int ms_write_multiple_pages(struct rtsx_chip *chip, u16 old_blk,
 	return STATUS_SUCCESS;
 }
 
-
 static int ms_finish_write(struct rtsx_chip *chip, u16 old_blk, u16 new_blk,
 		u16 log_blk, u8 page_off)
 {
@@ -4082,7 +4072,6 @@ int ms_rw(struct scsi_cmnd *srb, struct rtsx_chip *chip,
 	return retval;
 }
 
-
 void ms_free_l2p_tbl(struct rtsx_chip *chip)
 {
 	struct ms_info *ms_card = &chip->ms_card;
diff --git a/drivers/staging/rts5208/ms.h b/drivers/staging/rts5208/ms.h
index d919170..d768639 100644
--- a/drivers/staging/rts5208/ms.h
+++ b/drivers/staging/rts5208/ms.h
@@ -125,7 +125,6 @@
 #define Pro_CatagoryReg		0x06
 #define Pro_ClassReg		0x07
 
-
 #define Pro_SystemParm		0x10
 #define Pro_DataCount1		0x11
 #define Pro_DataCount0		0x12
diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 25d095a..e992e03 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -111,7 +111,6 @@ static int slave_configure(struct scsi_device *sdev)
 	return 0;
 }
 
-
 /***********************************************************************
  * /proc/scsi/ functions
  ***********************************************************************/
@@ -209,7 +208,6 @@ static int bus_reset(struct scsi_cmnd *srb)
 	return result < 0 ? FAILED : SUCCESS;
 }
 
-
 /*
  * this defines our host template, with which we'll allocate hosts
  */
@@ -259,7 +257,6 @@ static struct scsi_host_template rtsx_host_template = {
 	.module =			THIS_MODULE
 };
 
-
 static int rtsx_acquire_irq(struct rtsx_dev *dev)
 {
 	struct rtsx_chip *chip = dev->chip;
@@ -282,7 +279,6 @@ static int rtsx_acquire_irq(struct rtsx_dev *dev)
 	return 0;
 }
 
-
 int rtsx_read_pci_cfg_byte(u8 bus, u8 dev, u8 func, u8 offset, u8 *val)
 {
 	struct pci_dev *pdev;
@@ -515,7 +511,6 @@ SkipForAbort:
 	complete_and_exit(&dev->control_exit, 0);
 }
 
-
 static int rtsx_polling_thread(void *__dev)
 {
 	struct rtsx_dev *dev = __dev;
@@ -625,7 +620,6 @@ Exit:
 	return IRQ_HANDLED;
 }
 
-
 /* Release all our dynamic resources */
 static void rtsx_release_resources(struct rtsx_dev *dev)
 {
@@ -994,7 +988,6 @@ errout:
 	return err;
 }
 
-
 static void rtsx_remove(struct pci_dev *pci)
 {
 	struct rtsx_dev *dev = pci_get_drvdata(pci);
diff --git a/drivers/staging/rts5208/rtsx.h b/drivers/staging/rts5208/rtsx.h
index 1396263..2f902d5 100644
--- a/drivers/staging/rts5208/rtsx.h
+++ b/drivers/staging/rts5208/rtsx.h
@@ -77,7 +77,6 @@ do {							\
 } while (0)
 #define wait_timeout(msecs)	wait_timeout_x(TASK_INTERRUPTIBLE, (msecs))
 
-
 #define STATE_TRANS_NONE	0
 #define STATE_TRANS_CMD		1
 #define STATE_TRANS_BUF		2
@@ -138,6 +137,7 @@ static inline struct Scsi_Host *rtsx_to_host(struct rtsx_dev *dev)
 {
 	return container_of((void *) dev, struct Scsi_Host, hostdata);
 }
+
 static inline struct rtsx_dev *host_to_rtsx(struct Scsi_Host *host)
 {
 	return (struct rtsx_dev *) host->hostdata;
diff --git a/drivers/staging/rts5208/rtsx_card.c b/drivers/staging/rts5208/rtsx_card.c
index 231833a..9a5cd63 100644
--- a/drivers/staging/rts5208/rtsx_card.c
+++ b/drivers/staging/rts5208/rtsx_card.c
@@ -1065,7 +1065,6 @@ int card_share_mode(struct rtsx_chip *chip, int card)
 	return STATUS_SUCCESS;
 }
 
-
 int select_card(struct rtsx_chip *chip, int card)
 {
 	int retval;
diff --git a/drivers/staging/rts5208/rtsx_chip.h b/drivers/staging/rts5208/rtsx_chip.h
index c08164f..79d1df6 100644
--- a/drivers/staging/rts5208/rtsx_chip.h
+++ b/drivers/staging/rts5208/rtsx_chip.h
@@ -101,7 +101,6 @@
 #define TRANSPORT_NO_SENSE	2  /* Command failed, no auto-sense    */
 #define TRANSPORT_ERROR		3   /* Transport bad (i.e. device dead) */
 
-
 /*-----------------------------------
     Start-Stop-Unit
 -----------------------------------*/
@@ -228,7 +227,6 @@
 #define ASCQ_LOAD_EJCT_ERR      0x00
 #define	ASCQ_WRITE_PROTECT	0x00
 
-
 struct sense_data_t {
 	unsigned char   err_code;	/* error code */
 	/* bit7 : valid */
@@ -305,7 +303,6 @@ struct sense_data_t {
 #define MS_OC_INT_EN		(1 << 23)
 #define SD_OC_INT_EN		(1 << 22)
 
-
 #define READ_REG_CMD		0
 #define WRITE_REG_CMD		1
 #define CHECK_REG_CMD		2
@@ -313,7 +310,6 @@ struct sense_data_t {
 #define HOST_TO_DEVICE		0
 #define DEVICE_TO_HOST		1
 
-
 #define RTSX_RESV_BUF_LEN	4096
 #define HOST_CMDS_BUF_LEN	1024
 #define HOST_SG_TBL_BUF_LEN	(RTSX_RESV_BUF_LEN - HOST_CMDS_BUF_LEN)
@@ -332,7 +328,6 @@ struct sense_data_t {
 #define XD_FREE_TABLE_CNT	1200
 #define MS_FREE_TABLE_CNT	512
 
-
 /* Bit Operation */
 #define SET_BIT(data, idx)	((data) |= 1 << (idx))
 #define CLR_BIT(data, idx)	((data) &= ~(1 << (idx)))
@@ -618,7 +613,6 @@ struct spi_info {
 	int spi_clock;
 };
 
-
 #ifdef _MSG_TRACE
 struct trace_msg_t {
 	u16 line;
diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
index d203104..9818e5d 100644
--- a/drivers/staging/rts5208/rtsx_scsi.c
+++ b/drivers/staging/rts5208/rtsx_scsi.c
@@ -558,7 +558,6 @@ static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	return TRANSPORT_GOOD;
 }
 
-
 static int start_stop_unit(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 {
 	unsigned int lun = SCSI_LUN(srb);
@@ -594,7 +593,6 @@ static int start_stop_unit(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	return TRANSPORT_ERROR;
 }
 
-
 static int allow_medium_removal(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 {
 	int prevent;
@@ -613,7 +611,6 @@ static int allow_medium_removal(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	return TRANSPORT_GOOD;
 }
 
-
 static int request_sense(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 {
 	struct sense_data_t *sense;
@@ -2604,7 +2601,6 @@ static int app_cmd(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	return result;
 }
 
-
 static int read_status(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 {
 	u8 rtsx_status[16];
diff --git a/drivers/staging/rts5208/rtsx_transport.h b/drivers/staging/rts5208/rtsx_transport.h
index 899bc20..4791373 100644
--- a/drivers/staging/rts5208/rtsx_transport.h
+++ b/drivers/staging/rts5208/rtsx_transport.h
@@ -38,7 +38,6 @@ void rtsx_stor_get_xfer_buf(unsigned char *buffer,
 	unsigned int buflen, struct scsi_cmnd *srb);
 void rtsx_invoke_transport(struct scsi_cmnd *srb, struct rtsx_chip *chip);
 
-
 #define rtsx_init_cmd(chip)			((chip)->ci = 0)
 
 void rtsx_add_cmd(struct rtsx_chip *chip,
diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index 6219e04..345313a 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -1428,7 +1428,6 @@ static int sd_switch_function(struct rtsx_chip *chip, u8 bus_width)
 			continue;
 		}
 
-
 		if (func_to_switch)
 			break;
 
@@ -2975,7 +2974,6 @@ SD_UNLOCK_ENTRY:
 	return STATUS_SUCCESS;
 }
 
-
 static int mmc_test_switch_bus(struct rtsx_chip *chip, u8 width)
 {
 	struct sd_info *sd_card = &(chip->sd_card);
@@ -3105,7 +3103,6 @@ static int mmc_test_switch_bus(struct rtsx_chip *chip, u8 width)
 	return SWITCH_FAIL;
 }
 
-
 static int mmc_switch_timing_bus(struct rtsx_chip *chip, bool switch_ddr)
 {
 	struct sd_info *sd_card = &(chip->sd_card);
@@ -3230,7 +3227,6 @@ static int mmc_switch_timing_bus(struct rtsx_chip *chip, bool switch_ddr)
 	return STATUS_SUCCESS;
 }
 
-
 static int reset_mmc(struct rtsx_chip *chip)
 {
 	struct sd_info *sd_card = &(chip->sd_card);
diff --git a/drivers/staging/rts5208/spi.h b/drivers/staging/rts5208/spi.h
index fc824b5..c8d2bea 100644
--- a/drivers/staging/rts5208/spi.h
+++ b/drivers/staging/rts5208/spi.h
@@ -61,5 +61,4 @@ int spi_write_flash(struct scsi_cmnd *srb, struct rtsx_chip *chip);
 int spi_erase_flash(struct scsi_cmnd *srb, struct rtsx_chip *chip);
 int spi_write_flash_status(struct scsi_cmnd *srb, struct rtsx_chip *chip);
 
-
 #endif  /* __REALTEK_RTSX_SPI_H */
diff --git a/drivers/staging/rts5208/xd.c b/drivers/staging/rts5208/xd.c
index fc1dfe0..126a2dc 100644
--- a/drivers/staging/rts5208/xd.c
+++ b/drivers/staging/rts5208/xd.c
@@ -834,7 +834,6 @@ static int xd_check_data_blank(u8 *redunt)
 		!= (XD_ECC1_ALL1 | XD_ECC2_ALL1))
 		return 0;
 
-
 	for (i = 0; i < 4; i++) {
 		if (redunt[RESERVED0 + i] != 0xFF)
 			return 0;
@@ -1402,7 +1401,6 @@ static int xd_erase_block(struct rtsx_chip *chip, u32 phy_blk)
 	return STATUS_FAIL;
 }
 
-
 static int xd_build_l2p_tbl(struct rtsx_chip *chip, int zone_no)
 {
 	struct xd_info *xd_card = &(chip->xd_card);
@@ -1830,7 +1828,6 @@ static int xd_prepare_write(struct rtsx_chip *chip,
 	return STATUS_SUCCESS;
 }
 
-
 static int xd_write_multiple_pages(struct rtsx_chip *chip, u32 old_blk,
 				u32 new_blk, u32 log_blk, u8 start_page,
 				u8 end_page, u8 *buf, unsigned int *index,
@@ -2000,7 +1997,6 @@ int xd_rw(struct scsi_cmnd *srb, struct rtsx_chip *chip,
 		return STATUS_FAIL;
 	}
 
-
 	if (detect_card_cd(chip, XD_CARD) != STATUS_SUCCESS) {
 		chip->card_fail |= XD_CARD;
 		set_sense_type(chip, lun, SENSE_TYPE_MEDIA_NOT_PRESENT);
-- 
2.7.3

