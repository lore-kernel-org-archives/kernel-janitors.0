From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 11 Dec 2009 21:35:35 +0000
Subject: [PATCH 03/10] Fix misspelling of "successful" and variants in comments.
Message-Id: <1260567342-8327-4-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some comments misspell "successful" or variants of the word; this
fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 arch/arm/mach-s3c6400/setup-sdhci.c         |    2 +-
 arch/arm/mach-s3c6410/setup-sdhci.c         |    2 +-
 arch/microblaze/lib/memcpy.c                |    2 +-
 arch/microblaze/lib/memmove.c               |    2 +-
 arch/microblaze/lib/memset.c                |    2 +-
 block/blk-iopoll.c                          |    2 +-
 drivers/gpu/drm/drm_crtc.c                  |    2 +-
 drivers/media/dvb/dvb-core/dvb_frontend.h   |    2 +-
 drivers/media/dvb/frontends/stb0899_drv.c   |    2 +-
 drivers/mtd/nand/s3c2410.c                  |    2 +-
 drivers/net/sfc/falcon.c                    |    2 +-
 drivers/net/smsc911x.h                      |    2 +-
 drivers/net/ucc_geth.h                      |   20 ++++++++++----------
 drivers/net/wimax/i2400m/rx.c               |    2 +-
 drivers/net/wireless/ath/ath9k/rc.c         |    2 +-
 drivers/net/wireless/rt2x00/rt2x00link.c    |    2 +-
 drivers/net/wireless/rt2x00/rt2x00usb.c     |    2 +-
 drivers/net/wireless/zd1211rw/zd_mac.c      |    2 +-
 drivers/scsi/libfc/fc_lport.c               |    2 +-
 drivers/scsi/libiscsi_tcp.c                 |    2 +-
 drivers/scsi/lpfc/lpfc_attr.c               |    2 +-
 drivers/scsi/mpt2sas/mpt2sas_scsih.c        |    2 +-
 drivers/scsi/scsi_netlink.c                 |    2 +-
 drivers/scsi/sym53c8xx_2/sym_glue.c         |    2 +-
 drivers/staging/altpciechdma/altpciechdma.c |    6 +++---
 drivers/staging/dst/export.c                |    2 +-
 drivers/staging/hv/hv_api.h                 |    4 ++--
 drivers/staging/rar/rar_driver.c            |    4 ++--
 drivers/staging/rt2860/sta/connect.c        |    4 ++--
 drivers/staging/rt3090/sta/connect.c        |    4 ++--
 drivers/staging/sep/sep_driver.c            |    2 +-
 drivers/usb/core/message.c                  |    2 +-
 drivers/usb/gadget/pxa27x_udc.c             |    2 +-
 drivers/usb/wusbcore/wa-xfer.c              |    4 ++--
 drivers/uwb/i1480/dfu/usb.c                 |    2 +-
 fs/bio.c                                    |    2 +-
 fs/dlm/plock.c                              |    2 +-
 fs/ocfs2/alloc.c                            |    2 +-
 net/mac80211/mesh_pathtbl.c                 |    2 +-
 net/wimax/op-reset.c                        |    2 +-
 40 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/arch/arm/mach-s3c6400/setup-sdhci.c b/arch/arm/mach-s3c6400/setup-sdhci.c
index b93dafb..1039937 100644
--- a/arch/arm/mach-s3c6400/setup-sdhci.c
+++ b/arch/arm/mach-s3c6400/setup-sdhci.c
@@ -30,7 +30,7 @@ char *s3c6400_hsmmc_clksrcs[4] = {
 	[0] = "hsmmc",
 	[1] = "hsmmc",
 	[2] = "mmc_bus",
-	/* [3] = "48m", - note not succesfully used yet */
+	/* [3] = "48m", - note not successfully used yet */
 };
 
 void s3c6400_setup_sdhci_cfg_card(struct platform_device *dev,
diff --git a/arch/arm/mach-s3c6410/setup-sdhci.c b/arch/arm/mach-s3c6410/setup-sdhci.c
index 20666f3..816d2d9 100644
--- a/arch/arm/mach-s3c6410/setup-sdhci.c
+++ b/arch/arm/mach-s3c6410/setup-sdhci.c
@@ -30,7 +30,7 @@ char *s3c6410_hsmmc_clksrcs[4] = {
 	[0] = "hsmmc",
 	[1] = "hsmmc",
 	[2] = "mmc_bus",
-	/* [3] = "48m", - note not succesfully used yet */
+	/* [3] = "48m", - note not successfully used yet */
 };
 
 
diff --git a/arch/microblaze/lib/memcpy.c b/arch/microblaze/lib/memcpy.c
index 6a907c5..cc2108b 100644
--- a/arch/microblaze/lib/memcpy.c
+++ b/arch/microblaze/lib/memcpy.c
@@ -9,7 +9,7 @@
  * It is based on demo code originally Copyright 2001 by Intel Corp, taken from
  * http://www.embedded.com/showArticle.jhtml?articleID205567
  *
- * Attempts were made, unsuccesfully, to contact the original
+ * Attempts were made, unsuccessfully, to contact the original
  * author of this code (Michael Morrow, Intel).  Below is the original
  * copyright notice.
  *
diff --git a/arch/microblaze/lib/memmove.c b/arch/microblaze/lib/memmove.c
index d4e9f49..0929198 100644
--- a/arch/microblaze/lib/memmove.c
+++ b/arch/microblaze/lib/memmove.c
@@ -9,7 +9,7 @@
  * It is based on demo code originally Copyright 2001 by Intel Corp, taken from
  * http://www.embedded.com/showArticle.jhtml?articleID205567
  *
- * Attempts were made, unsuccesfully, to contact the original
+ * Attempts were made, unsuccessfully, to contact the original
  * author of this code (Michael Morrow, Intel).  Below is the original
  * copyright notice.
  *
diff --git a/arch/microblaze/lib/memset.c b/arch/microblaze/lib/memset.c
index 941dc8f..4df851d 100644
--- a/arch/microblaze/lib/memset.c
+++ b/arch/microblaze/lib/memset.c
@@ -9,7 +9,7 @@
  * It is based on demo code originally Copyright 2001 by Intel Corp, taken from
  * http://www.embedded.com/showArticle.jhtml?articleID205567
  *
- * Attempts were made, unsuccesfully, to contact the original
+ * Attempts were made, unsuccessfully, to contact the original
  * author of this code (Michael Morrow, Intel).  Below is the original
  * copyright notice.
  *
diff --git a/block/blk-iopoll.c b/block/blk-iopoll.c
index ca56420..58916af 100644
--- a/block/blk-iopoll.c
+++ b/block/blk-iopoll.c
@@ -28,7 +28,7 @@ static DEFINE_PER_CPU(struct list_head, blk_cpu_iopoll);
  * Description:
  *     Add this blk_iopoll structure to the pending poll list and trigger the
  *     raise of the blk iopoll softirq. The driver must already have gotten a
- *     succesful return from blk_iopoll_sched_prep() before calling this.
+ *     successful return from blk_iopoll_sched_prep() before calling this.
  **/
 void blk_iopoll_sched(struct blk_iopoll *iop)
 {
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 5cae0b3..0321889 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -2328,7 +2328,7 @@ int drm_mode_connector_property_set_ioctl(struct drm_device *dev,
 	} else if (connector->funcs->set_property)
 		ret = connector->funcs->set_property(connector, property, out_resp->value);
 
-	/* store the property value if succesful */
+	/* store the property value if successful */
 	if (!ret)
 		drm_connector_property_set_value(connector, property, out_resp->value);
 out:
diff --git a/drivers/media/dvb/dvb-core/dvb_frontend.h b/drivers/media/dvb/dvb-core/dvb_frontend.h
index 810f07d..52e4ce4 100644
--- a/drivers/media/dvb/dvb-core/dvb_frontend.h
+++ b/drivers/media/dvb/dvb-core/dvb_frontend.h
@@ -160,7 +160,7 @@ struct tuner_state {
  * search callback possible return status
  *
  * DVBFE_ALGO_SEARCH_SUCCESS
- * The frontend search algorithm completed and returned succesfully
+ * The frontend search algorithm completed and returned successfully
  *
  * DVBFE_ALGO_SEARCH_ASLEEP
  * The frontend search algorithm is sleeping
diff --git a/drivers/media/dvb/frontends/stb0899_drv.c b/drivers/media/dvb/frontends/stb0899_drv.c
index a04c782..1570669 100644
--- a/drivers/media/dvb/frontends/stb0899_drv.c
+++ b/drivers/media/dvb/frontends/stb0899_drv.c
@@ -1571,7 +1571,7 @@ static enum dvbfe_search stb0899_search(struct dvb_frontend *fe, struct dvb_fron
  * stb0899_track
  * periodically check the signal level against a specified
  * threshold level and perform derotator centering.
- * called once we have a lock from a succesful search
+ * called once we have a lock from a successful search
  * event.
  *
  * Will be called periodically called to maintain the
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 11dc7e6..68b5b3a 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -875,7 +875,7 @@ static void s3c2410_nand_init_chip(struct s3c2410_nand_info *info,
  * @info: The controller instance.
  * @nmtd: The driver version of the MTD instance.
  *
- * This routine is called after the chip probe has succesfully completed
+ * This routine is called after the chip probe has successfully completed
  * and the relevant per-chip information updated. This call ensure that
  * we update the internal state accordingly.
  *
diff --git a/drivers/net/sfc/falcon.c b/drivers/net/sfc/falcon.c
index c049364..70c1232 100644
--- a/drivers/net/sfc/falcon.c
+++ b/drivers/net/sfc/falcon.c
@@ -1264,7 +1264,7 @@ int falcon_flush_queues(struct efx_nic *efx)
 		msleep(FALCON_FLUSH_INTERVAL);
 		falcon_poll_flush_events(efx);
 
-		/* Check if every queue has been succesfully flushed */
+		/* Check if every queue has been successfully flushed */
 		outstanding = false;
 		efx_for_each_tx_queue(tx_queue, efx)
 			outstanding |= !tx_queue->flushed;
diff --git a/drivers/net/smsc911x.h b/drivers/net/smsc911x.h
index b5716bd..016360c 100644
--- a/drivers/net/smsc911x.h
+++ b/drivers/net/smsc911x.h
@@ -30,7 +30,7 @@
 #define SMSC_NAPI_WEIGHT	16
 
 /* implements a PHY loopback test at initialisation time, to ensure a packet
- * can be succesfully looped back */
+ * can be successfully looped back */
 #define USE_PHY_WORK_AROUND
 
 #define DPRINTK(nlevel, klevel, fmt, args...) \
diff --git a/drivers/net/ucc_geth.h b/drivers/net/ucc_geth.h
index 03a6ca0..3c97bae 100644
--- a/drivers/net/ucc_geth.h
+++ b/drivers/net/ucc_geth.h
@@ -80,16 +80,16 @@ struct ucc_geth {
 				   frames) received that were between 128
 				   (Including FCS length=4) and 255 octets */
 	u32 txok;		/* Total number of octets residing in frames
-				   that where involved in succesfull
+				   that where involved in successful
 				   transmission */
 	u16 txcf;		/* Total number of PAUSE control frames
 				   transmitted by this MAC */
 	u8 res4[0x2];
 	u32 tmca;		/* Total number of frames that were transmitted
-				   succesfully with the group address bit set
+				   successfully with the group address bit set
 				   that are not broadcast frames */
 	u32 tbca;		/* Total number of frames transmitted
-				   succesfully that had destination address
+				   successfully that had destination address
 				   field equal to the broadcast address */
 	u32 rxfok;		/* Total number of frames received OK */
 	u32 rxbok;		/* Total number of octets received OK */
@@ -98,9 +98,9 @@ struct ucc_geth {
 				   HW because it includes octets in frames that
 				   never even reach the UCC */
 	u32 rmca;		/* Total number of frames that were received
-				   succesfully with the group address bit set
+				   successfully with the group address bit set
 				   that are not broadcast frames */
-	u32 rbca;		/* Total number of frames received succesfully
+	u32 rbca;		/* Total number of frames received successfully
 				   that had destination address equal to the
 				   broadcast address */
 	u32 scar;		/* Statistics carry register */
@@ -759,15 +759,15 @@ struct ucc_geth_hardware_statistics {
 				   frames) received that were between 128
 				   (Including FCS length=4) and 255 octets */
 	u32 txok;		/* Total number of octets residing in frames
-				   that where involved in succesfull
+				   that where involved in successfull
 				   transmission */
 	u16 txcf;		/* Total number of PAUSE control frames
 				   transmitted by this MAC */
 	u32 tmca;		/* Total number of frames that were transmitted
-				   succesfully with the group address bit set
+				   successfully with the group address bit set
 				   that are not broadcast frames */
 	u32 tbca;		/* Total number of frames transmitted
-				   succesfully that had destination address
+				   successfully that had destination address
 				   field equal to the broadcast address */
 	u32 rxfok;		/* Total number of frames received OK */
 	u32 rxbok;		/* Total number of octets received OK */
@@ -776,9 +776,9 @@ struct ucc_geth_hardware_statistics {
 				   HW because it includes octets in frames that
 				   never even reach the UCC */
 	u32 rmca;		/* Total number of frames that were received
-				   succesfully with the group address bit set
+				   successfully with the group address bit set
 				   that are not broadcast frames */
-	u32 rbca;		/* Total number of frames received succesfully
+	u32 rbca;		/* Total number of frames received successfully
 				   that had destination address equal to the
 				   broadcast address */
 } __attribute__ ((packed));
diff --git a/drivers/net/wimax/i2400m/rx.c b/drivers/net/wimax/i2400m/rx.c
index 07c32e6..99d2747 100644
--- a/drivers/net/wimax/i2400m/rx.c
+++ b/drivers/net/wimax/i2400m/rx.c
@@ -1114,7 +1114,7 @@ error:
  * device. See the file header for the format. Run all checks on the
  * buffer header, then run over each payload's descriptors, verify
  * their consistency and act on each payload's contents.  If
- * everything is succesful, update the device's statistics.
+ * everything is successful, update the device's statistics.
  *
  * Note: You need to set the skb to contain only the length of the
  * received buffer; for that, use skb_trim(skb, RECEIVED_SIZE).
diff --git a/drivers/net/wireless/ath/ath9k/rc.c b/drivers/net/wireless/ath/ath9k/rc.c
index 1895d63..0a35ee6 100644
--- a/drivers/net/wireless/ath/ath9k/rc.c
+++ b/drivers/net/wireless/ath/ath9k/rc.c
@@ -969,7 +969,7 @@ static bool ath_rc_update_per(struct ath_softc *sc,
 				 * Since this probe succeeded, we allow the next
 				 * probe twice as soon.  This allows the maxRate
 				 * to move up faster if the probes are
-				 * succesful.
+				 * successful.
 				 */
 				ath_rc_priv->probe_time  					now_msec - rate_table->probe_interval / 2;
diff --git a/drivers/net/wireless/rt2x00/rt2x00link.c b/drivers/net/wireless/rt2x00/rt2x00link.c
index c708d0b..6a6a28b 100644
--- a/drivers/net/wireless/rt2x00/rt2x00link.c
+++ b/drivers/net/wireless/rt2x00/rt2x00link.c
@@ -279,7 +279,7 @@ void rt2x00link_update_stats(struct rt2x00_dev *rt2x00dev,
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 
 	/*
-	 * Frame was received successfully since non-succesfull
+	 * Frame was received successfully since non-successfull
 	 * frames would have been dropped by the hardware.
 	 */
 	qual->rx_success++;
diff --git a/drivers/net/wireless/rt2x00/rt2x00usb.c b/drivers/net/wireless/rt2x00/rt2x00usb.c
index f02b48a..f8075f8 100644
--- a/drivers/net/wireless/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/rt2x00/rt2x00usb.c
@@ -200,7 +200,7 @@ static void rt2x00usb_interrupt_txdone(struct urb *urb)
 	 * Obtain the status about this packet.
 	 * Note that when the status is 0 it does not mean the
 	 * frame was send out correctly. It only means the frame
-	 * was succesfully pushed to the hardware, we have no
+	 * was successfully pushed to the hardware, we have no
 	 * way to determine the transmission status right now.
 	 * (Only indirectly by looking at the failed TX counters
 	 * in the register).
diff --git a/drivers/net/wireless/zd1211rw/zd_mac.c b/drivers/net/wireless/zd1211rw/zd_mac.c
index 6d66635..2b7f965 100644
--- a/drivers/net/wireless/zd1211rw/zd_mac.c
+++ b/drivers/net/wireless/zd1211rw/zd_mac.c
@@ -312,7 +312,7 @@ static void tx_status(struct ieee80211_hw *hw, struct sk_buff *skb,
  * zd_mac_tx_failed - callback for failed frames
  * @dev: the mac80211 wireless device
  *
- * This function is called if a frame couldn't be succesfully be
+ * This function is called if a frame couldn't be successfully be
  * transferred. The first frame from the tx queue, will be selected and
  * reported as error to the upper layers.
  */
diff --git a/drivers/scsi/libfc/fc_lport.c b/drivers/scsi/libfc/fc_lport.c
index bd2f771..6486ae4 100644
--- a/drivers/scsi/libfc/fc_lport.c
+++ b/drivers/scsi/libfc/fc_lport.c
@@ -56,7 +56,7 @@
  * at the same time.
  *
  * When discovery succeeds or fails a callback is made to the lport as
- * notification. Currently, succesful discovery causes the lport to take no
+ * notification. Currently, successful discovery causes the lport to take no
  * action. A failure will cause the lport to reset. There is likely a circular
  * locking problem with this implementation.
  */
diff --git a/drivers/scsi/libiscsi_tcp.c b/drivers/scsi/libiscsi_tcp.c
index 2e0746d..ca25ee5 100644
--- a/drivers/scsi/libiscsi_tcp.c
+++ b/drivers/scsi/libiscsi_tcp.c
@@ -1004,7 +1004,7 @@ static struct iscsi_r2t_info *iscsi_tcp_get_curr_r2t(struct iscsi_task *task)
  * iscsi_tcp_task_xmit - xmit normal PDU task
  * @task: iscsi command task
  *
- * We're expected to return 0 when everything was transmitted succesfully,
+ * We're expected to return 0 when everything was transmitted successfully,
  * -EAGAIN if there's still data in the queue, or != 0 for any other kind
  * of error.
  */
diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index e1a30a1..6ae81d2 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -3147,7 +3147,7 @@ sysfs_ctlreg_write(struct kobject *kobj, struct bin_attribute *bin_attr,
  * sysfs_ctlreg_read - Read method for reading from ctlreg
  * @kobj: kernel kobject that contains the kernel class device.
  * @bin_attr: kernel attributes passed to us.
- * @buf: if succesful contains the data from the adapter IOREG space.
+ * @buf: if successful contains the data from the adapter IOREG space.
  * @off: offset into buffer to beginning of data.
  * @count: bytes to transfer.
  *
diff --git a/drivers/scsi/mpt2sas/mpt2sas_scsih.c b/drivers/scsi/mpt2sas/mpt2sas_scsih.c
index 86ab32d..c1977d7 100644
--- a/drivers/scsi/mpt2sas/mpt2sas_scsih.c
+++ b/drivers/scsi/mpt2sas/mpt2sas_scsih.c
@@ -2894,7 +2894,7 @@ _scsih_normalize_sense(char *sense_buffer, struct sense_info *data)
 
 #ifdef CONFIG_SCSI_MPT2SAS_LOGGING
 /**
- * _scsih_scsi_ioc_info - translated non-succesfull SCSI_IO request
+ * _scsih_scsi_ioc_info - translated non-successful SCSI_IO request
  * @ioc: per adapter object
  * @scmd: pointer to scsi command object
  * @mpi_reply: reply mf payload returned from firmware
diff --git a/drivers/scsi/scsi_netlink.c b/drivers/scsi/scsi_netlink.c
index 723fdec..0fd6ae6 100644
--- a/drivers/scsi/scsi_netlink.c
+++ b/drivers/scsi/scsi_netlink.c
@@ -613,7 +613,7 @@ EXPORT_SYMBOL_GPL(scsi_nl_send_transport_msg);
  * @data_buf:		pointer to vendor unique data buffer
  *
  * Returns:
- *   0 on succesful return
+ *   0 on successful return
  *   otherwise, failing error code
  *
  * Notes:
diff --git a/drivers/scsi/sym53c8xx_2/sym_glue.c b/drivers/scsi/sym53c8xx_2/sym_glue.c
index 45374d6..2b38f6a 100644
--- a/drivers/scsi/sym53c8xx_2/sym_glue.c
+++ b/drivers/scsi/sym53c8xx_2/sym_glue.c
@@ -1864,7 +1864,7 @@ static pci_ers_result_t sym2_io_slot_dump(struct pci_dev *pdev)
  *
  * This routine is similar to sym_set_workarounds(), except
  * that, at this point, we already know that the device was
- * succesfully intialized at least once before, and so most
+ * successfully intialized at least once before, and so most
  * of the steps taken there are un-needed here.
  */
 static void sym2_reset_workarounds(struct pci_dev *pdev)
diff --git a/drivers/staging/altpciechdma/altpciechdma.c b/drivers/staging/altpciechdma/altpciechdma.c
index e0c5ba4..2f07dd4 100644
--- a/drivers/staging/altpciechdma/altpciechdma.c
+++ b/drivers/staging/altpciechdma/altpciechdma.c
@@ -212,7 +212,7 @@ struct ape_dev {
 	int msi_enabled;
 	/* whether this driver could obtain the regions */
 	int got_regions;
-	/* irq line succesfully requested by this driver, -1 otherwise */
+	/* irq line successfully requested by this driver, -1 otherwise */
 	int irq_line;
 	/* board revision */
 	u8 revision;
@@ -336,7 +336,7 @@ static int __devinit map_bars(struct ape_dev *ape, struct pci_dev *dev)
 		printk(KERN_DEBUG "BAR[%d] mapped at 0x%p with length %lu(/%lu).\n", i,
 		ape->bar[i], bar_min_len[i], bar_length);
 	}
-	/* succesfully mapped all required BAR regions */
+	/* successfully mapped all required BAR regions */
 	rc = 0;
 	goto success;
 fail:
@@ -911,7 +911,7 @@ static int __devinit probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* perform DMA engines loop back test */
 	rc = dma_test(ape, dev);
 	(void)rc;
-	/* succesfully took the device */
+	/* successfully took the device */
 	rc = 0;
 	printk(KERN_DEBUG "probe() successful.\n");
 	goto end;
diff --git a/drivers/staging/dst/export.c b/drivers/staging/dst/export.c
index 4fbd848..a4ed16c 100644
--- a/drivers/staging/dst/export.c
+++ b/drivers/staging/dst/export.c
@@ -202,7 +202,7 @@ err_out_exit:
  * so to play good with all cases we just queue BIO into the queue
  * and wake up processing thread, which gets completed request and
  * send (encrypting if needed) it back to the client (if it was a read
- * request), or sends back reply that writing succesfully completed.
+ * request), or sends back reply that writing successfully completed.
  */
 static int dst_export_process_request_queue(struct dst_state *st)
 {
diff --git a/drivers/staging/hv/hv_api.h b/drivers/staging/hv/hv_api.h
index 251e2d1..9eb818e 100644
--- a/drivers/staging/hv/hv_api.h
+++ b/drivers/staging/hv/hv_api.h
@@ -316,13 +316,13 @@
 
 /*
  * HV_STATUS_VMX_INSTRUCTION_FAILED
- * The requested VMX instruction failed to complete succesfully.
+ * The requested VMX instruction failed to complete successfully.
  */
 #define HV_STATUS_VMX_INSTRUCTION_FAILED		((u16)0x1011)
 
 /*
  * HV_STATUS_VMX_INSTRUCTION_FAILED_WITH_STATUS
- * The requested VMX instruction failed to complete succesfully indicating
+ * The requested VMX instruction failed to complete successfully indicating
  * status.
  */
 #define HV_STATUS_VMX_INSTRUCTION_FAILED_WITH_STATUS	((u16)0x1012)
diff --git a/drivers/staging/rar/rar_driver.c b/drivers/staging/rar/rar_driver.c
index 9805d74..9d4eeee 100644
--- a/drivers/staging/rar/rar_driver.c
+++ b/drivers/staging/rar/rar_driver.c
@@ -66,7 +66,7 @@ static int __init rar_init_handler(void);
 static void __exit rar_exit_handler(void);
 
 /*
-  function that is activated on the succesfull probe of the RAR device
+  function that is activated on the successful probe of the RAR device
 */
 static int __devinit rar_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 
@@ -319,7 +319,7 @@ static int memrar_init_rar_params(struct pci_dev *pdev)
 }
 
 /*
-  function that is activaed on the succesfull probe of the RAR device
+  function that is activaed on the successful probe of the RAR device
 */
 static int __devinit rar_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
diff --git a/drivers/staging/rt2860/sta/connect.c b/drivers/staging/rt2860/sta/connect.c
index 7bc75ab..0dae822 100644
--- a/drivers/staging/rt2860/sta/connect.c
+++ b/drivers/staging/rt2860/sta/connect.c
@@ -58,8 +58,8 @@ UCHAR	CipherSuiteWpaNoneAes[] = {
 		};
 UCHAR	CipherSuiteWpaNoneAesLen = (sizeof(CipherSuiteWpaNoneAes) / sizeof(UCHAR));
 
-// The following MACRO is called after 1. starting an new IBSS, 2. succesfully JOIN an IBSS,
-// or 3. succesfully ASSOCIATE to a BSS, 4. successfully RE_ASSOCIATE to a BSS
+// The following MACRO is called after 1. starting an new IBSS, 2. successfully JOIN an IBSS,
+// or 3. successfully ASSOCIATE to a BSS, 4. successfully RE_ASSOCIATE to a BSS
 // All settings successfuly negotiated furing MLME state machines become final settings
 // and are copied to pAd->StaActive
 #define COPY_SETTINGS_FROM_MLME_AUX_TO_ACTIVE_CFG(_pAd)                                 \
diff --git a/drivers/staging/rt3090/sta/connect.c b/drivers/staging/rt3090/sta/connect.c
index 4aa35ee..583d6ee 100644
--- a/drivers/staging/rt3090/sta/connect.c
+++ b/drivers/staging/rt3090/sta/connect.c
@@ -60,8 +60,8 @@ UCHAR	CipherSuiteWpaNoneAes[] = {
 		};
 UCHAR	CipherSuiteWpaNoneAesLen = (sizeof(CipherSuiteWpaNoneAes) / sizeof(UCHAR));
 
-// The following MACRO is called after 1. starting an new IBSS, 2. succesfully JOIN an IBSS,
-// or 3. succesfully ASSOCIATE to a BSS, 4. successfully RE_ASSOCIATE to a BSS
+// The following MACRO is called after 1. starting an new IBSS, 2. successfully JOIN an IBSS,
+// or 3. successfully ASSOCIATE to a BSS, 4. successfully RE_ASSOCIATE to a BSS
 // All settings successfuly negotiated furing MLME state machines become final settings
 // and are copied to pAd->StaActive
 #define COPY_SETTINGS_FROM_MLME_AUX_TO_ACTIVE_CFG(_pAd)                                 \
diff --git a/drivers/staging/sep/sep_driver.c b/drivers/staging/sep/sep_driver.c
index f890a16..be19afe 100644
--- a/drivers/staging/sep/sep_driver.c
+++ b/drivers/staging/sep/sep_driver.c
@@ -2447,7 +2447,7 @@ static void sep_configure_dma_burst(struct sep_device *sep)
 #endif
 
 /*
-  Function that is activaed on the succesful probe of the SEP device
+  Function that is activaed on the successful probe of the SEP device
 */
 static int __devinit sep_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index da718e8..e80f1af 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1890,7 +1890,7 @@ static void cancel_async_set_config(struct usb_device *udev)
  * routine gets around the normal restrictions by using a work thread to
  * submit the change-config request.
  *
- * Returns 0 if the request was succesfully queued, error code otherwise.
+ * Returns 0 if the request was successfully queued, error code otherwise.
  * The caller has no way to know whether the queued request will eventually
  * succeed.
  */
diff --git a/drivers/usb/gadget/pxa27x_udc.c b/drivers/usb/gadget/pxa27x_udc.c
index 1937d8c..db1273b 100644
--- a/drivers/usb/gadget/pxa27x_udc.c
+++ b/drivers/usb/gadget/pxa27x_udc.c
@@ -1524,7 +1524,7 @@ static int pxa_udc_get_frame(struct usb_gadget *_gadget)
  * pxa_udc_wakeup - Force udc device out of suspend
  * @_gadget: usb gadget
  *
- * Returns 0 if succesfull, error code otherwise
+ * Returns 0 if successful, error code otherwise
  */
 static int pxa_udc_wakeup(struct usb_gadget *_gadget)
 {
diff --git a/drivers/usb/wusbcore/wa-xfer.c b/drivers/usb/wusbcore/wa-xfer.c
index 613a5fc..489b478 100644
--- a/drivers/usb/wusbcore/wa-xfer.c
+++ b/drivers/usb/wusbcore/wa-xfer.c
@@ -558,7 +558,7 @@ static void wa_seg_dto_cb(struct urb *urb)
 /*
  * Callback for the segment request
  *
- * If succesful transition state (unless already transitioned or
+ * If successful transition state (unless already transitioned or
  * outbound transfer); otherwise, take a note of the error, mark this
  * segment done and try completion.
  *
@@ -1364,7 +1364,7 @@ segment_aborted:
 /*
  * Callback for the IN data phase
  *
- * If succesful transition state; otherwise, take a note of the
+ * If successful transition state; otherwise, take a note of the
  * error, mark this segment done and try completion.
  *
  * Note we don't access until we are sure that the transfer hasn't
diff --git a/drivers/uwb/i1480/dfu/usb.c b/drivers/uwb/i1480/dfu/usb.c
index c7080d4..0bb665a 100644
--- a/drivers/uwb/i1480/dfu/usb.c
+++ b/drivers/uwb/i1480/dfu/usb.c
@@ -229,7 +229,7 @@ void i1480_usb_neep_cb(struct urb *urb)
  * will verify it.
  *
  * Set i1480->evt_result with the result of getting the event or its
- * size (if succesful).
+ * size (if successful).
  *
  * Delivers the data directly to i1480->evt_buf
  */
diff --git a/fs/bio.c b/fs/bio.c
index 12da5db..2bd671a 100644
--- a/fs/bio.c
+++ b/fs/bio.c
@@ -272,7 +272,7 @@ EXPORT_SYMBOL(bio_init);
  *   for a &struct bio to become free. If a %NULL @bs is passed in, we will
  *   fall back to just using @kmalloc to allocate the required memory.
  *
- *   Note that the caller must set ->bi_destructor on succesful return
+ *   Note that the caller must set ->bi_destructor on successful return
  *   of a bio, to do the appropriate freeing of the bio once the reference
  *   count drops to zero.
  **/
diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 16f682e..b540aa5 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -143,7 +143,7 @@ out:
 }
 EXPORT_SYMBOL_GPL(dlm_posix_lock);
 
-/* Returns failure iff a succesful lock operation should be canceled */
+/* Returns failure iff a successful lock operation should be canceled */
 static int dlm_plock_callback(struct plock_op *op)
 {
 	struct file *file;
diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index 38a42f5..7c7198a 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -2398,7 +2398,7 @@ static int ocfs2_leftmost_rec_contains(struct ocfs2_extent_list *el, u32 cpos)
  *
  * The array is assumed to be large enough to hold an entire path (tree depth).
  *
- * Upon succesful return from this function:
+ * Upon successful return from this function:
  *
  * - The 'right_path' array will contain a path to the leaf block
  *   whose range contains e_cpos.
diff --git a/net/mac80211/mesh_pathtbl.c b/net/mac80211/mesh_pathtbl.c
index 751c4d0..e7a25ac 100644
--- a/net/mac80211/mesh_pathtbl.c
+++ b/net/mac80211/mesh_pathtbl.c
@@ -530,7 +530,7 @@ static void mesh_path_node_reclaim(struct rcu_head *rp)
  * @addr: dst address (ETH_ALEN length)
  * @sdata: local subif
  *
- * Returns: 0 if succesful
+ * Returns: 0 if successful
  */
 int mesh_path_del(u8 *addr, struct ieee80211_sub_if_data *sdata)
 {
diff --git a/net/wimax/op-reset.c b/net/wimax/op-reset.c
index ca26917..35f3700 100644
--- a/net/wimax/op-reset.c
+++ b/net/wimax/op-reset.c
@@ -62,7 +62,7 @@
  * Called when wanting to reset the device for any reason. Device is
  * taken back to power on status.
  *
- * This call blocks; on succesful return, the device has completed the
+ * This call blocks; on successful return, the device has completed the
  * reset process and is ready to operate.
  */
 int wimax_reset(struct wimax_dev *wimax_dev)
-- 
1.6.3.3

