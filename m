From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 18 Dec 2009 20:40:42 +0000
Subject: [PATCH 2/2] Fix misspelling of "should" and "shouldn't" in comments.
Message-Id: <1261168842-9996-2-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some comments misspell "should" or "shouldn't"; this fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 arch/x86/kernel/ptrace.c          |    2 +-
 drivers/ata/libata-core.c         |    2 +-
 drivers/gpu/drm/radeon/atombios.h |    2 +-
 drivers/ieee1394/pcilynx.c        |    2 +-
 drivers/input/tablet/aiptek.c     |    2 +-
 drivers/mmc/card/sdio_uart.c      |    2 +-
 drivers/scsi/lpfc/lpfc_scsi.c     |    4 ++--
 drivers/video/sstfb.c             |    2 +-
 fs/locks.c                        |    2 +-
 kernel/audit.c                    |    2 +-
 mm/slub.c                         |    2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/ptrace.c b/arch/x86/kernel/ptrace.c
index 017d937..1184280 100644
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@ -604,7 +604,7 @@ ptrace_modify_breakpoint(struct perf_event *bp, int len, int type,
 	struct perf_event_attr attr;
 
 	/*
-	 * We shoud have at least an inactive breakpoint at this
+	 * We should have at least an inactive breakpoint at this
 	 * slot. It means the user is writing dr7 without having
 	 * written the address register first
 	 */
diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 22ff51b..c6b9f5a 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2232,7 +2232,7 @@ retry:
 		 * Some drives were very specific about that exact sequence.
 		 *
 		 * Note that ATA4 says lba is mandatory so the second check
-		 * shoud never trigger.
+		 * should never trigger.
 		 */
 		if (ata_id_major_version(id) < 4 || !ata_id_has_lba(id)) {
 			err_mask = ata_dev_init_params(dev, id[3], id[6]);
diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 5f48515..a4c8771 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -2275,7 +2275,7 @@ typedef struct _ATOM_LCD_RTS_RECORD {
 	UCHAR ucRTSValue;
 } ATOM_LCD_RTS_RECORD;
 
-/* !! If the record below exits, it shoud always be the first record for easy use in command table!!! */
+/* !! If the record below exits, it should always be the first record for easy use in command table!!! */
 typedef struct _ATOM_LCD_MODE_CONTROL_CAP {
 	UCHAR ucRecordType;
 	USHORT usLCDCap;
diff --git a/drivers/ieee1394/pcilynx.c b/drivers/ieee1394/pcilynx.c
index 9555fd2..bf47fee 100644
--- a/drivers/ieee1394/pcilynx.c
+++ b/drivers/ieee1394/pcilynx.c
@@ -1452,7 +1452,7 @@ static int __devinit add_card(struct pci_dev *dev,
                                 PRINT(KERN_ERR, lynx->id, "unable to read bus info block from i2c");
                         } else {
                                 PRINT(KERN_INFO, lynx->id, "got bus info block from serial eeprom");
-				/* FIXME: probably we shoud rewrite the max_rec, max_ROM(1394a),
+				/* FIXME: probably we should rewrite the max_rec, max_ROM(1394a),
 				 * generation(1394a) and link_spd(1394a) field and recalculate
 				 * the CRC */
 
diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 7d005a3..4be039d 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -362,7 +362,7 @@ static const int macroKeyEvents[] = {
 };
 
 /***********************************************************************
- * Map values to strings and back. Every map shoudl have the following
+ * Map values to strings and back. Every map should have the following
  * as its last element: { NULL, AIPTEK_INVALID_VALUE }.
  */
 #define AIPTEK_INVALID_VALUE	-1
diff --git a/drivers/mmc/card/sdio_uart.c b/drivers/mmc/card/sdio_uart.c
index f537555..a4e3775 100644
--- a/drivers/mmc/card/sdio_uart.c
+++ b/drivers/mmc/card/sdio_uart.c
@@ -581,7 +581,7 @@ static int uart_carrier_raised(struct tty_port *tport)
 	struct sdio_uart_port *port  			container_of(tport, struct sdio_uart_port, port);
 	unsigned int ret = sdio_uart_claim_func(port);
-	if (ret)	/* Missing hardware shoudn't block for carrier */
+	if (ret)	/* Missing hardware shouldn't block for carrier */
 		return 1;
 	ret = sdio_uart_get_mctrl(port);
 	sdio_uart_release_func(port);
diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index a246410..28c6bfd 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -1574,7 +1574,7 @@ lpfc_bg_scsi_prep_dma_buf(struct lpfc_hba *phba,
 		case LPFC_PG_TYPE_NO_DIF:
 			num_bde = lpfc_bg_setup_bpl(phba, scsi_cmnd, bpl,
 					datasegcnt);
-			/* we shoud have 2 or more entries in buffer list */
+			/* we should have 2 or more entries in buffer list */
 			if (num_bde < 2)
 				goto err;
 			break;
@@ -1611,7 +1611,7 @@ lpfc_bg_scsi_prep_dma_buf(struct lpfc_hba *phba,
 
 			num_bde = lpfc_bg_setup_bpl_prot(phba, scsi_cmnd, bpl,
 					datasegcnt, protsegcnt);
-			/* we shoud have 3 or more entries in buffer list */
+			/* we should have 3 or more entries in buffer list */
 			if (num_bde < 3)
 				goto err;
 			break;
diff --git a/drivers/video/sstfb.c b/drivers/video/sstfb.c
index 609d0a5..79840f1 100644
--- a/drivers/video/sstfb.c
+++ b/drivers/video/sstfb.c
@@ -1102,7 +1102,7 @@ static void sst_set_vidmod_ics(struct fb_info *info, const int bpp)
  * detect dac type
  * prerequisite : write to FbiInitx enabled, video and fbi and pci fifo reset,
  * dram refresh disabled, FbiInit remaped.
- * TODO: mmh.. maybe i shoud put the "prerequisite" in the func ...
+ * TODO: mmh.. maybe i should put the "prerequisite" in the func ...
  */
 
 
diff --git a/fs/locks.c b/fs/locks.c
index a8794f2..cde572d 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -1454,7 +1454,7 @@ EXPORT_SYMBOL(generic_setlease);
  *	leases held by processes on this node.
  *
  *	There is also no break_lease method; filesystems that
- *	handle their own leases shoud break leases themselves from the
+ *	handle their own leases should break leases themselves from the
  *	filesystem's open, create, and (on truncate) setattr methods.
  *
  *	Warning: the only current setlease methods exist only to disable
diff --git a/kernel/audit.c b/kernel/audit.c
index 5feed23..78f7f86 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -398,7 +398,7 @@ static void kauditd_send_skb(struct sk_buff *skb)
 	skb_get(skb);
 	err = netlink_unicast(audit_sock, skb, audit_nlk_pid, 0);
 	if (err < 0) {
-		BUG_ON(err != -ECONNREFUSED); /* Shoudn't happen */
+		BUG_ON(err != -ECONNREFUSED); /* Shouldn't happen */
 		printk(KERN_ERR "audit: *NO* daemon at audit_pid=%d\n", audit_pid);
 		audit_log_lost("auditd dissapeared\n");
 		audit_pid = 0;
diff --git a/mm/slub.c b/mm/slub.c
index 8d71aaf..00e0961 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3086,7 +3086,7 @@ static void slab_mem_offline_callback(void *arg)
 			/*
 			 * if n->nr_slabs > 0, slabs still exist on the node
 			 * that is going down. We were unable to free them,
-			 * and offline_pages() function shoudn't call this
+			 * and offline_pages() function shouldn't call this
 			 * callback. So, we must fail.
 			 */
 			BUG_ON(slabs_node(s, offline_node));
-- 
1.6.3.3

