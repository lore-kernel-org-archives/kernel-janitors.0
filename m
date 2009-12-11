From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 11 Dec 2009 21:35:42 +0000
Subject: [PATCH 10/10] Fix misspellings of "separate" in comments.
Message-Id: <1260567342-8327-11-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Some comments misspell "separate"; this fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 arch/arm/mach-ep93xx/micro9.c                      |    2 +-
 arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h  |    2 +-
 .../arm/plat-s3c/include/plat/regs-usb-hsotg-phy.h |    2 +-
 arch/arm/plat-s3c64xx/irq.c                        |    2 +-
 arch/arm/plat-s5pc1xx/irq.c                        |    2 +-
 arch/cris/arch-v10/lib/old_checksum.c              |    2 +-
 arch/cris/arch-v32/mm/tlb.c                        |    2 +-
 block/bsg.c                                        |    2 +-
 drivers/acpi/dock.c                                |    2 +-
 drivers/char/agp/intel-agp.c                       |    2 +-
 drivers/char/hw_random/n2-drv.c                    |    2 +-
 drivers/i2c/busses/i2c-pxa.c                       |    2 +-
 drivers/input/misc/yealink.h                       |    2 +-
 drivers/media/dvb/dvb-core/dvb_frontend.h          |    8 ++++----
 drivers/mmc/host/mxcmmc.c                          |    2 +-
 drivers/net/chelsio/sge.c                          |    2 +-
 drivers/net/sungem.c                               |    2 +-
 drivers/net/wireless/ath/ar9170/main.c             |    2 +-
 drivers/net/wireless/rt2x00/rt2500usb.c            |    4 ++--
 drivers/net/wireless/rt2x00/rt2800usb.c            |    4 ++--
 drivers/net/wireless/rt2x00/rt2x00debug.c          |    2 +-
 drivers/net/wireless/rt2x00/rt2x00dev.c            |    2 +-
 drivers/net/wireless/rt2x00/rt2x00queue.c          |    2 +-
 drivers/net/wireless/rt2x00/rt61pci.c              |    6 +++---
 drivers/net/wireless/rt2x00/rt73usb.c              |    6 +++---
 drivers/scsi/lpfc/lpfc_els.c                       |    2 +-
 drivers/staging/comedi/drivers/das08.h             |    2 +-
 drivers/staging/dream/camera/msm_vfe8x_proc.c      |    2 +-
 drivers/staging/echo/echo.c                        |    2 +-
 drivers/staging/rt2860/mlme.h                      |    2 +-
 drivers/staging/rt3090/mlme.h                      |    2 +-
 drivers/staging/rtl8192e/ieee80211.h               |    2 +-
 drivers/staging/rtl8192e/ieee80211/ieee80211.h     |    2 +-
 drivers/staging/rtl8192e/r8190_rtl8256.c           |    4 ++--
 drivers/staging/rtl8192su/ieee80211/ieee80211.h    |    2 +-
 drivers/staging/rtl8192su/r8192S_phy.c             |    4 ++--
 drivers/usb/musb/musb_regs.h                       |    2 +-
 drivers/video/omap/lcdc.c                          |    2 +-
 fs/binfmt_elf_fdpic.c                              |    2 +-
 fs/nfsd/nfs4xdr.c                                  |    2 +-
 fs/ocfs2/dlmglue.c                                 |    2 +-
 fs/ocfs2/extent_map.c                              |    2 +-
 include/media/davinci/vpfe_capture.h               |    2 +-
 net/netfilter/nf_conntrack_sip.c                   |    4 ++--
 net/netfilter/xt_hashlimit.c                       |    2 +-
 45 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/arch/arm/mach-ep93xx/micro9.c b/arch/arm/mach-ep93xx/micro9.c
index f3757a1..c33360e 100644
--- a/arch/arm/mach-ep93xx/micro9.c
+++ b/arch/arm/mach-ep93xx/micro9.c
@@ -28,7 +28,7 @@
  *
  * Micro9-High has up to 64MB of 32-bit flash on CS1
  * Micro9-Mid has up to 64MB of either 32-bit or 16-bit flash on CS1
- * Micro9-Lite uses a seperate MTD map driver for flash support
+ * Micro9-Lite uses a separate MTD map driver for flash support
  * Micro9-Slim has up to 64MB of either 32-bit or 16-bit flash on CS1
  *************************************************************************/
 static struct physmap_flash_data micro9_flash_data;
diff --git a/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h b/arch/arm/p=
lat-s3c/include/plat/gpio-cfg-helpers.h
index 652e2bb..dda19da 100644
--- a/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h
+++ b/arch/arm/plat-s3c/include/plat/gpio-cfg-helpers.h
@@ -78,7 +78,7 @@ extern int s3c_gpio_setcfg_s3c24xx_a(struct s3c_gpio_chip=
 *chip,
  *	others =3D Special functions (dependant on bank)
  *
  * Note, since the code to deal with the case where there are two control
- * registers instead of one, we do not have a seperate set of functions for
+ * registers instead of one, we do not have a separate set of functions for
  * each case.
 */
 extern int s3c_gpio_setcfg_s3c64xx_4bit(struct s3c_gpio_chip *chip,
diff --git a/arch/arm/plat-s3c/include/plat/regs-usb-hsotg-phy.h b/arch/arm=
/plat-s3c/include/plat/regs-usb-hsotg-phy.h
index 36a85f5..a111ad8 100644
--- a/arch/arm/plat-s3c/include/plat/regs-usb-hsotg-phy.h
+++ b/arch/arm/plat-s3c/include/plat/regs-usb-hsotg-phy.h
@@ -12,7 +12,7 @@
  * published by the Free Software Foundation.
 */
=20
-/* Note, this is a seperate header file as some of the clock framework
+/* Note, this is a separate header file as some of the clock framework
  * needs to touch this if the clk_48m is used as the USB OHCI or other
  * peripheral source.
 */
diff --git a/arch/arm/plat-s3c64xx/irq.c b/arch/arm/plat-s3c64xx/irq.c
index 8dc5b6d..3adb464 100644
--- a/arch/arm/plat-s3c64xx/irq.c
+++ b/arch/arm/plat-s3c64xx/irq.c
@@ -136,7 +136,7 @@ static inline unsigned int s3c_irq_uart_bit(unsigned in=
t irq)
 	return irq & 3;
 }
=20
-/* UART interrupt registers, not worth adding to seperate include header */
+/* UART interrupt registers, not worth adding to separate include header */
=20
 static void s3c_irq_uart_mask(unsigned int irq)
 {
diff --git a/arch/arm/plat-s5pc1xx/irq.c b/arch/arm/plat-s5pc1xx/irq.c
index 80d6dd9..bb56e8d 100644
--- a/arch/arm/plat-s5pc1xx/irq.c
+++ b/arch/arm/plat-s5pc1xx/irq.c
@@ -134,7 +134,7 @@ static inline unsigned int s3c_irq_uart_bit(unsigned in=
t irq)
 	return irq & 3;
 }
=20
-/* UART interrupt registers, not worth adding to seperate include header */
+/* UART interrupt registers, not worth adding to separate include header */
 #define S3C64XX_UINTP	0x30
 #define S3C64XX_UINTSP	0x34
 #define S3C64XX_UINTM	0x38
diff --git a/arch/cris/arch-v10/lib/old_checksum.c b/arch/cris/arch-v10/lib=
/old_checksum.c
index 1734b46..8f79163 100644
--- a/arch/cris/arch-v10/lib/old_checksum.c
+++ b/arch/cris/arch-v10/lib/old_checksum.c
@@ -77,7 +77,7 @@ __wsum csum_partial(const void *p, int len, __wsum __sum)
 		sum +=3D *buff++;
=20
 	if (endMarker > buff)
-		sum +=3D *(const u8 *)buff;	/* add extra byte seperately */
+		sum +=3D *(const u8 *)buff;	/* add extra byte separately */
=20
 	BITOFF;
 	return (__force __wsum)sum;
diff --git a/arch/cris/arch-v32/mm/tlb.c b/arch/cris/arch-v32/mm/tlb.c
index 6779bcb..c030d02 100644
--- a/arch/cris/arch-v32/mm/tlb.c
+++ b/arch/cris/arch-v32/mm/tlb.c
@@ -189,7 +189,7 @@ switch_mm(struct mm_struct *prev, struct mm_struct *nex=
t,
 		spin_unlock(&mmu_context_lock);
=20
 		/*
-		 * Remember the pgd for the fault handlers. Keep a seperate
+		 * Remember the pgd for the fault handlers. Keep a separate
 		 * copy of it because current and active_mm might be invalid
 		 * at points where * there's still a need to derefer the pgd.
 		 */
diff --git a/block/bsg.c b/block/bsg.c
index 0676301..be1f562 100644
--- a/block/bsg.c
+++ b/block/bsg.c
@@ -259,7 +259,7 @@ bsg_map_hdr(struct bsg_device *bd, struct sg_io_v4 *hdr=
, fmode_t has_write_perm,
 		return ERR_PTR(ret);
=20
 	/*
-	 * map scatter-gather elements seperately and string them to request
+	 * map scatter-gather elements separately and string them to request
 	 */
 	rq =3D blk_get_request(q, rw, GFP_KERNEL);
 	if (!rq)
diff --git a/drivers/acpi/dock.c b/drivers/acpi/dock.c
index 7338b6a..2fabd22 100644
--- a/drivers/acpi/dock.c
+++ b/drivers/acpi/dock.c
@@ -622,7 +622,7 @@ register_hotplug_dock_device(acpi_handle handle, struct=
 acpi_dock_ops *ops,
 	list_for_each_entry(dock_station, &dock_stations, sibling) {
 		/*
 		 * An ATA bay can be in a dock and itself can be ejected
-		 * seperately, so there are two 'dock stations' which need the
+		 * separately, so there are two 'dock stations' which need the
 		 * ops
 		 */
 		dd =3D find_dock_dependent_device(dock_station, handle);
diff --git a/drivers/char/agp/intel-agp.c b/drivers/char/agp/intel-agp.c
index 3cb56a0..7608e7f 100644
--- a/drivers/char/agp/intel-agp.c
+++ b/drivers/char/agp/intel-agp.c
@@ -268,7 +268,7 @@ static void intel_agp_insert_sg_entries(struct agp_memo=
ry *mem,
 			j++;
 		}
 	} else {
-		/* sg may merge pages, but we have to seperate
+		/* sg may merge pages, but we have to separate
 		 * per-page addr for GTT */
 		unsigned int len, m;
=20
diff --git a/drivers/char/hw_random/n2-drv.c b/drivers/char/hw_random/n2-dr=
v.c
index 9b3e09c..10f868e 100644
--- a/drivers/char/hw_random/n2-drv.c
+++ b/drivers/char/hw_random/n2-drv.c
@@ -71,7 +71,7 @@ MODULE_VERSION(DRV_MODULE_VERSION);
  *        x22 + x21 + x17 + x15 + x13 + x12 + x11 + x7 + x5 + x + 1
  *
  * The RNG_CTL_VCO value of each noise cell must be programmed
- * seperately.  This is why 4 control register values must be provided
+ * separately.  This is why 4 control register values must be provided
  * to the hypervisor.  During a write, the hypervisor writes them all,
  * one at a time, to the actual RNG_CTL register.  The first three
  * values are used to setup the desired RNG_CTL_VCO for each entropy
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 0495557..11b3e46 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -12,7 +12,7 @@
  *
  *  History:
  *    Apr 2002: Initial version [CS]
- *    Jun 2002: Properly seperated algo/adap [FB]
+ *    Jun 2002: Properly separated algo/adap [FB]
  *    Jan 2003: Fixed several bugs concerning interrupt handling [Kai-Uwe =
Bloem]
  *    Jan 2003: added limited signal handling [Kai-Uwe Bloem]
  *    Sep 2004: Major rework to ensure efficient bus handling [RMK]
diff --git a/drivers/input/misc/yealink.h b/drivers/input/misc/yealink.h
index 48af0be..1e0f523 100644
--- a/drivers/input/misc/yealink.h
+++ b/drivers/input/misc/yealink.h
@@ -127,7 +127,7 @@ struct yld_ctl_packet {
  * yld_status struct.
  */
=20
-/* LCD, each segment must be driven seperately.
+/* LCD, each segment must be driven separately.
  *
  * Layout:
  *
diff --git a/drivers/media/dvb/dvb-core/dvb_frontend.h b/drivers/media/dvb/=
dvb-core/dvb_frontend.h
index 52e4ce4..80dda30 100644
--- a/drivers/media/dvb/dvb-core/dvb_frontend.h
+++ b/drivers/media/dvb/dvb-core/dvb_frontend.h
@@ -214,14 +214,14 @@ struct dvb_tuner_ops {
 	int (*get_status)(struct dvb_frontend *fe, u32 *status);
 	int (*get_rf_strength)(struct dvb_frontend *fe, u16 *strength);
=20
-	/** These are provided seperately from set_params in order to facilitate =
silicon
-	 * tuners which require sophisticated tuning loops, controlling each para=
meter seperately. */
+	/** These are provided separately from set_params in order to facilitate =
silicon
+	 * tuners which require sophisticated tuning loops, controlling each para=
meter separately. */
 	int (*set_frequency)(struct dvb_frontend *fe, u32 frequency);
 	int (*set_bandwidth)(struct dvb_frontend *fe, u32 bandwidth);
=20
 	/*
-	 * These are provided seperately from set_params in order to facilitate s=
ilicon
-	 * tuners which require sophisticated tuning loops, controlling each para=
meter seperately.
+	 * These are provided separately from set_params in order to facilitate s=
ilicon
+	 * tuners which require sophisticated tuning loops, controlling each para=
meter separately.
 	 */
 	int (*set_state)(struct dvb_frontend *fe, enum tuner_param param, struct =
tuner_state *state);
 	int (*get_state)(struct dvb_frontend *fe, enum tuner_param param, struct =
tuner_state *state);
diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index 8867152..7a81373 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -4,7 +4,7 @@
  *  This is a driver for the SDHC controller found in Freescale MX2/MX3
  *  SoCs. It is basically the same hardware as found on MX1 (imxmmc.c).
  *  Unlike the hardware found on MX1, this hardware just works and does
- *  not need all the quirks found in imxmmc.c, hence the seperate driver.
+ *  not need all the quirks found in imxmmc.c, hence the separate driver.
  *
  *  Copyright (C) 2008 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
  *  Copyright (C) 2006 Pavel Pisa, PiKRON <ppisa@pikron.com>
diff --git a/drivers/net/chelsio/sge.c b/drivers/net/chelsio/sge.c
index 8c658cf..5b857fb 100644
--- a/drivers/net/chelsio/sge.c
+++ b/drivers/net/chelsio/sge.c
@@ -248,7 +248,7 @@ static void restart_sched(unsigned long);
  *
  * Interrupts are handled by a single CPU and it is likely that on a MP sy=
stem
  * the application is migrated to another CPU. In that scenario, we try to
- * seperate the RX(in irq context) and TX state in order to decrease memory
+ * separate the RX(in irq context) and TX state in order to decrease memory
  * contention.
  */
 struct sge {
diff --git a/drivers/net/sungem.c b/drivers/net/sungem.c
index 61640b9..ad3af63 100644
--- a/drivers/net/sungem.c
+++ b/drivers/net/sungem.c
@@ -782,7 +782,7 @@ static int gem_rx(struct gem *gp, int work_to_do)
 			break;
=20
 		/* When writing back RX descriptor, GEM writes status
-		 * then buffer address, possibly in seperate transactions.
+		 * then buffer address, possibly in separate transactions.
 		 * If we don't wait for the chip to write both, we could
 		 * post a new buffer to this descriptor then have GEM spam
 		 * on the buffer address.  We sync on the RX completion
diff --git a/drivers/net/wireless/ath/ar9170/main.c b/drivers/net/wireless/=
ath/ar9170/main.c
index c1f8c69..102d913 100644
--- a/drivers/net/wireless/ath/ar9170/main.c
+++ b/drivers/net/wireless/ath/ar9170/main.c
@@ -2523,7 +2523,7 @@ void *ar9170_alloc(size_t priv_size)
 	/*
 	 * this buffer is used for rx stream reconstruction.
 	 * Under heavy load this device (or the transport layer?)
-	 * tends to split the streams into seperate rx descriptors.
+	 * tends to split the streams into separate rx descriptors.
 	 */
=20
 	skb =3D __dev_alloc_skb(AR9170_MAX_RX_BUFFER_SIZE, GFP_KERNEL);
diff --git a/drivers/net/wireless/rt2x00/rt2500usb.c b/drivers/net/wireless=
/rt2x00/rt2500usb.c
index 22dd6d9..26240b8 100644
--- a/drivers/net/wireless/rt2x00/rt2500usb.c
+++ b/drivers/net/wireless/rt2x00/rt2500usb.c
@@ -368,7 +368,7 @@ static int rt2500usb_config_key(struct rt2x00_dev *rt2x=
00dev,
=20
 		/*
 		 * The encryption key doesn't fit within the CSR cache,
-		 * this means we should allocate it seperately and use
+		 * this means we should allocate it separately and use
 		 * rt2x00usb_vendor_request() to send the key to the hardware.
 		 */
 		reg =3D KEY_ENTRY(key->hw_key_idx);
@@ -382,7 +382,7 @@ static int rt2500usb_config_key(struct rt2x00_dev *rt2x=
00dev,
 		/*
 		 * The driver does not support the IV/EIV generation
 		 * in hardware. However it demands the data to be provided
-		 * both seperately as well as inside the frame.
+		 * both separately as well as inside the frame.
 		 * We already provided the CONFIG_CRYPTO_COPY_IV to rt2x00lib
 		 * to ensure rt2x00lib will not strip the data from the
 		 * frame after the copy, now we must tell mac80211
diff --git a/drivers/net/wireless/rt2x00/rt2800usb.c b/drivers/net/wireless=
/rt2x00/rt2800usb.c
index 9fe770f..22344dc 100644
--- a/drivers/net/wireless/rt2x00/rt2800usb.c
+++ b/drivers/net/wireless/rt2x00/rt2800usb.c
@@ -1115,7 +1115,7 @@ static int rt2800usb_check_firmware(struct rt2x00_dev=
 *rt2x00dev,
 	 * There are 2 variations of the rt2870 firmware.
 	 * a) size: 4kb
 	 * b) size: 8kb
-	 * Note that (b) contains 2 seperate firmware blobs of 4k
+	 * Note that (b) contains 2 separate firmware blobs of 4k
 	 * within the file. The first blob is the same firmware as (a),
 	 * but the second blob is for the additional chipsets.
 	 */
@@ -1133,7 +1133,7 @@ static int rt2800usb_check_firmware(struct rt2x00_dev=
 *rt2x00dev,
=20
 	/*
 	 * 8kb firmware files must be checked as if it were
-	 * 2 seperate firmware files.
+	 * 2 separate firmware files.
 	 */
 	while (offset < len) {
 		if (!rt2800usb_check_crc(data + offset, 4096))
diff --git a/drivers/net/wireless/rt2x00/rt2x00debug.c b/drivers/net/wirele=
ss/rt2x00/rt2x00debug.c
index 68bc9bb..c2e92e8 100644
--- a/drivers/net/wireless/rt2x00/rt2x00debug.c
+++ b/drivers/net/wireless/rt2x00/rt2x00debug.c
@@ -109,7 +109,7 @@ struct rt2x00debug_intf {
=20
 	/*
 	 * HW crypto statistics.
-	 * All statistics are stored seperately per cipher type.
+	 * All statistics are stored separately per cipher type.
 	 */
 	struct rt2x00debug_crypto crypto_stats[CIPHER_MAX];
=20
diff --git a/drivers/net/wireless/rt2x00/rt2x00dev.c b/drivers/net/wireless=
/rt2x00/rt2x00dev.c
index 73bbec5..b9517f8 100644
--- a/drivers/net/wireless/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/rt2x00/rt2x00dev.c
@@ -396,7 +396,7 @@ void rt2x00lib_rxdone(struct rt2x00_dev *rt2x00dev,
 	/*
 	 * Hardware might have stripped the IV/EIV/ICV data,
 	 * in that case it is possible that the data was
-	 * provided seperately (through hardware descriptor)
+	 * provided separately (through hardware descriptor)
 	 * in which case we should reinsert the data into the frame.
 	 */
 	if ((rxdesc.dev_flags & RXDONE_CRYPTO_IV) &&
diff --git a/drivers/net/wireless/rt2x00/rt2x00queue.c b/drivers/net/wirele=
ss/rt2x00/rt2x00queue.c
index 577029e..521220c 100644
--- a/drivers/net/wireless/rt2x00/rt2x00queue.c
+++ b/drivers/net/wireless/rt2x00/rt2x00queue.c
@@ -497,7 +497,7 @@ int rt2x00queue_write_tx_frame(struct data_queue *queue=
, struct sk_buff *skb)
 	/*
 	 * When hardware encryption is supported, and this frame
 	 * is to be encrypted, we should strip the IV/EIV data from
-	 * the frame so we can provide it to the driver seperately.
+	 * the frame so we can provide it to the driver separately.
 	 */
 	if (test_bit(ENTRY_TXD_ENCRYPT, &txdesc.flags) &&
 	    !test_bit(ENTRY_TXD_ENCRYPT_IV, &txdesc.flags)) {
diff --git a/drivers/net/wireless/rt2x00/rt61pci.c b/drivers/net/wireless/r=
t2x00/rt61pci.c
index b20e3ea..8648f85 100644
--- a/drivers/net/wireless/rt2x00/rt61pci.c
+++ b/drivers/net/wireless/rt2x00/rt61pci.c
@@ -386,7 +386,7 @@ static int rt61pci_config_shared_key(struct rt2x00_dev =
*rt2x00dev,
 		 * The driver does not support the IV/EIV generation
 		 * in hardware. However it doesn't support the IV/EIV
 		 * inside the ieee80211 frame either, but requires it
-		 * to be provided seperately for the descriptor.
+		 * to be provided separately for the descriptor.
 		 * rt2x00lib will cut the IV/EIV data out of all frames
 		 * given to us by mac80211, but we must tell mac80211
 		 * to generate the IV/EIV data.
@@ -476,7 +476,7 @@ static int rt61pci_config_pairwise_key(struct rt2x00_de=
v *rt2x00dev,
 		 * The driver does not support the IV/EIV generation
 		 * in hardware. However it doesn't support the IV/EIV
 		 * inside the ieee80211 frame either, but requires it
-		 * to be provided seperately for the descriptor.
+		 * to be provided separately for the descriptor.
 		 * rt2x00lib will cut the IV/EIV data out of all frames
 		 * given to us by mac80211, but we must tell mac80211
 		 * to generate the IV/EIV data.
@@ -1986,7 +1986,7 @@ static void rt61pci_fill_rxdone(struct queue_entry *e=
ntry,
=20
 		/*
 		 * Hardware has stripped IV/EIV data from 802.11 frame during
-		 * decryption. It has provided the data seperately but rt2x00lib
+		 * decryption. It has provided the data separately but rt2x00lib
 		 * should decide if it should be reinserted.
 		 */
 		rxdesc->flags |=3D RX_FLAG_IV_STRIPPED;
diff --git a/drivers/net/wireless/rt2x00/rt73usb.c b/drivers/net/wireless/r=
t2x00/rt73usb.c
index 14e7bb2..5db71a8 100644
--- a/drivers/net/wireless/rt2x00/rt73usb.c
+++ b/drivers/net/wireless/rt2x00/rt73usb.c
@@ -339,7 +339,7 @@ static int rt73usb_config_shared_key(struct rt2x00_dev =
*rt2x00dev,
 		 * The driver does not support the IV/EIV generation
 		 * in hardware. However it doesn't support the IV/EIV
 		 * inside the ieee80211 frame either, but requires it
-		 * to be provided seperately for the descriptor.
+		 * to be provided separately for the descriptor.
 		 * rt2x00lib will cut the IV/EIV data out of all frames
 		 * given to us by mac80211, but we must tell mac80211
 		 * to generate the IV/EIV data.
@@ -439,7 +439,7 @@ static int rt73usb_config_pairwise_key(struct rt2x00_de=
v *rt2x00dev,
 		 * The driver does not support the IV/EIV generation
 		 * in hardware. However it doesn't support the IV/EIV
 		 * inside the ieee80211 frame either, but requires it
-		 * to be provided seperately for the descriptor.
+		 * to be provided separately for the descriptor.
 		 * rt2x00lib will cut the IV/EIV data out of all frames
 		 * given to us by mac80211, but we must tell mac80211
 		 * to generate the IV/EIV data.
@@ -1665,7 +1665,7 @@ static void rt73usb_fill_rxdone(struct queue_entry *e=
ntry,
=20
 		/*
 		 * Hardware has stripped IV/EIV data from 802.11 frame during
-		 * decryption. It has provided the data seperately but rt2x00lib
+		 * decryption. It has provided the data separately but rt2x00lib
 		 * should decide if it should be reinserted.
 		 */
 		rxdesc->flags |=3D RX_FLAG_IV_STRIPPED;
diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index 45337cd..19c1c60 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -3099,7 +3099,7 @@ lpfc_cmpl_els_rsp(struct lpfc_hba *phba, struct lpfc_=
iocbq *cmdiocb,
 	if (ndlp && NLP_CHK_NODE_ACT(ndlp) &&
 	    (*((uint32_t *) (pcmd)) =3D ELS_CMD_LS_RJT)) {
 		/* A LS_RJT associated with Default RPI cleanup has its own
-		 * seperate code path.
+		 * separate code path.
 		 */
 		if (!(ndlp->nlp_flag & NLP_RM_DFLT_RPI))
 			ls_rjt =3D 1;
diff --git a/drivers/staging/comedi/drivers/das08.h b/drivers/staging/comed=
i/drivers/das08.h
index 35d2660..2a30d76 100644
--- a/drivers/staging/comedi/drivers/das08.h
+++ b/drivers/staging/comedi/drivers/das08.h
@@ -62,7 +62,7 @@ struct i8254_struct {
 #define I8254_CTRL 3
=20
 struct das08_private_struct {
-	unsigned int do_mux_bits;	/*  bits for do/mux register on boards without =
seperate do register */
+	unsigned int do_mux_bits;	/*  bits for do/mux register on boards without =
separate do register */
 	unsigned int do_bits;	/*  bits for do register on boards with register de=
dicated to digital out only */
 	const unsigned int *pg_gainlist;
 	struct pci_dev *pdev;	/*  struct for pci-das08 */
diff --git a/drivers/staging/dream/camera/msm_vfe8x_proc.c b/drivers/stagin=
g/dream/camera/msm_vfe8x_proc.c
index 10aef0e..f80ef96 100644
--- a/drivers/staging/dream/camera/msm_vfe8x_proc.c
+++ b/drivers/staging/dream/camera/msm_vfe8x_proc.c
@@ -3828,7 +3828,7 @@ void vfe_camif_config(struct vfe_cmd_camif_config *in)
 		ctrl->vfeImaskLocal.camifEpoch2Irq =3D 1;
 	}
=20
-	/*  save the content to program CAMIF_CONFIG seperately. */
+	/*  save the content to program CAMIF_CONFIG separately. */
 	ctrl->vfeCamifConfigLocal.camifCfgFromCmd =3D in->camifConfig;
=20
 	/* EFS_Config */
diff --git a/drivers/staging/echo/echo.c b/drivers/staging/echo/echo.c
index 4cc4f2e..58c4e90 100644
--- a/drivers/staging/echo/echo.c
+++ b/drivers/staging/echo/echo.c
@@ -603,7 +603,7 @@ int16_t oslec_update(struct oslec_state *ec, int16_t tx=
, int16_t rx)
 }
 EXPORT_SYMBOL_GPL(oslec_update);
=20
-/* This function is seperated from the echo canceller is it is usually cal=
led
+/* This function is separated from the echo canceller is it is usually cal=
led
    as part of the tx process.  See rx HP (DC blocking) filter above, it's
    the same design.
=20
diff --git a/drivers/staging/rt2860/mlme.h b/drivers/staging/rt2860/mlme.h
index 3d1a828..0643276 100644
--- a/drivers/staging/rt2860/mlme.h
+++ b/drivers/staging/rt2860/mlme.h
@@ -324,7 +324,7 @@ typedef struct  _TRIGGER_EVENTA{
 	UCHAR	BSSID[6];
 	UCHAR	RegClass;	// Regulatory Class
 	USHORT	Channel;
-	ULONG	CDCounter;   // Maintain a seperate count down counter for each Eve=
nt A.
+	ULONG	CDCounter;   // Maintain a separate count down counter for each Eve=
nt A.
 } TRIGGER_EVENTA, *PTRIGGER_EVENTA;
=20
 // 20/40 trigger event table
diff --git a/drivers/staging/rt3090/mlme.h b/drivers/staging/rt3090/mlme.h
index 2336743..91017a8 100644
--- a/drivers/staging/rt3090/mlme.h
+++ b/drivers/staging/rt3090/mlme.h
@@ -436,7 +436,7 @@ typedef struct  _TRIGGER_EVENTA{
 	UCHAR	BSSID[6];
 	UCHAR	RegClass;	// Regulatory Class
 	USHORT	Channel;
-	ULONG	CDCounter;   // Maintain a seperate count down counter for each Eve=
nt A.
+	ULONG	CDCounter;   // Maintain a separate count down counter for each Eve=
nt A.
 } TRIGGER_EVENTA, *PTRIGGER_EVENTA;
=20
 // 20/40 trigger event table
diff --git a/drivers/staging/rtl8192e/ieee80211.h b/drivers/staging/rtl8192=
e/ieee80211.h
index 97137dd..0a60ff1 100644
--- a/drivers/staging/rtl8192e/ieee80211.h
+++ b/drivers/staging/rtl8192e/ieee80211.h
@@ -1849,7 +1849,7 @@ struct ieee80211_device {
 	spinlock_t bw_spinlock;
=20
 	spinlock_t reorder_spinlock;
-	// for HT operation rate set.  we use this one for HT data rate to sepera=
te different descriptors
+	// for HT operation rate set.  we use this one for HT data rate to separa=
te different descriptors
 	//the way fill this is the same as in the IE
 	u8	Regdot11HTOperationalRateSet[16];		//use RATR format
 	u8	dot11HTOperationalRateSet[16];		//use RATR format
diff --git a/drivers/staging/rtl8192e/ieee80211/ieee80211.h b/drivers/stagi=
ng/rtl8192e/ieee80211/ieee80211.h
index 83c8452..3ef2c09 100644
--- a/drivers/staging/rtl8192e/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192e/ieee80211/ieee80211.h
@@ -1936,7 +1936,7 @@ struct ieee80211_device {
 	spinlock_t bw_spinlock;
=20
 	spinlock_t reorder_spinlock;
-	// for HT operation rate set.  we use this one for HT data rate to sepera=
te different descriptors
+	// for HT operation rate set.  we use this one for HT data rate to separa=
te different descriptors
 	//the way fill this is the same as in the IE
 	u8	Regdot11HTOperationalRateSet[16];		//use RATR format
 	u8	dot11HTOperationalRateSet[16];		//use RATR format
diff --git a/drivers/staging/rtl8192e/r8190_rtl8256.c b/drivers/staging/rtl=
8192e/r8190_rtl8256.c
index 0eaee3a..27f5336 100644
--- a/drivers/staging/rtl8192e/r8190_rtl8256.c
+++ b/drivers/staging/rtl8192e/r8190_rtl8256.c
@@ -780,7 +780,7 @@ MgntDisconnectIBSS(
=20
 			case RT_OP_MODE_IBSS:
 				btMsr |=3D MSR_LINK_ADHOC;
-				// led link set seperate
+				// led link set separate
 				break;
=20
 			case RT_OP_MODE_AP:
@@ -863,7 +863,7 @@ MlmeDisassociateRequest(
=20
 			case RT_OP_MODE_IBSS:
 				btMsr |=3D MSR_LINK_ADHOC;
-				// led link set seperate
+				// led link set separate
 				break;
=20
 			case RT_OP_MODE_AP:
diff --git a/drivers/staging/rtl8192su/ieee80211/ieee80211.h b/drivers/stag=
ing/rtl8192su/ieee80211/ieee80211.h
index f22d024..776a60d 100644
--- a/drivers/staging/rtl8192su/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192su/ieee80211/ieee80211.h
@@ -1165,7 +1165,7 @@ struct ieee80211_device {
 	spinlock_t reorder_spinlock;
 	/*
 	 * for HT operation rate set, we use this one for HT data rate to
-	 * seperate different descriptors the way fill this is the same as
+	 * separate different descriptors the way fill this is the same as
 	 * in the IE
 	 */
 	u8	Regdot11HTOperationalRateSet[16];	/* use RATR format */
diff --git a/drivers/staging/rtl8192su/r8192S_phy.c b/drivers/staging/rtl81=
92su/r8192S_phy.c
index 2c111d7..250f2f1 100644
--- a/drivers/staging/rtl8192su/r8192S_phy.c
+++ b/drivers/staging/rtl8192su/r8192S_phy.c
@@ -24,7 +24,7 @@
 	08/08/2008  MHC    	1. Port from 9x series phycfg.c
 						2. Reorganize code arch and ad description.
 						3. Collect similar function.
-						4. Seperate extern/local API.
+						4. Separate extern/local API.
 	08/12/2008	MHC		We must merge or move USB PHY relative function later.
 	10/07/2008	MHC		Add IQ calibration for PHY.(Only 1T2R mode now!!!)
 	11/06/2008	MHC		Add TX Power index PG file to config in 0xExx register
@@ -882,7 +882,7 @@ phy_BB8192S_Config_ParaFile(struct net_device* dev)
=20
 	//
 	// 1. Read PHY_REG.TXT BB INIT!!
-	// We will seperate as 1T1R/1T2R/1T2R_GREEN/2T2R
+	// We will separate as 1T1R/1T2R/1T2R_GREEN/2T2R
 	//
 	if (priv->rf_type =3D RF_1T2R || priv->rf_type =3D RF_2T2R ||
 	    priv->rf_type =3D RF_1T1R ||priv->rf_type =3D RF_2T2R_GREEN)
diff --git a/drivers/usb/musb/musb_regs.h b/drivers/usb/musb/musb_regs.h
index cc1d71b..86a041d 100644
--- a/drivers/usb/musb/musb_regs.h
+++ b/drivers/usb/musb/musb_regs.h
@@ -436,7 +436,7 @@ static inline void  musb_write_txhubport(void __iomem *=
mbase, u8 epnum,
 #define MUSB_FLAT_OFFSET(_epnum, _offset)	\
 	(USB_OFFSET(USB_EP_NI0_TXMAXP) + (0x40 * (_epnum)) + (_offset))
=20
-/* Not implemented - HW has seperate Tx/Rx FIFO */
+/* Not implemented - HW has separate Tx/Rx FIFO */
 #define MUSB_TXCSR_MODE			0x0000
=20
 static inline void musb_write_txfifosz(void __iomem *mbase, u8 c_size)
diff --git a/drivers/video/omap/lcdc.c b/drivers/video/omap/lcdc.c
index ab39492..c687ab5 100644
--- a/drivers/video/omap/lcdc.c
+++ b/drivers/video/omap/lcdc.c
@@ -419,7 +419,7 @@ static int omap_lcdc_enable_plane(int plane, int enable)
 /*
  * Configure the LCD DMA for a palette load operation and do the palette
  * downloading synchronously. We don't use the frame+palette load mode of
- * the controller, since the palette can always be downloaded seperately.
+ * the controller, since the palette can always be downloaded separately.
  */
 static void load_palette(void)
 {
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index 38502c6..663479b 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1379,7 +1379,7 @@ static inline void fill_note(struct memelfnote *note,=
 const char *name, int type
=20
 /*
  * fill up all the fields in prstatus from the given task struct, except
- * registers which need to be filled up seperately.
+ * registers which need to be filled up separately.
  */
 static void fill_prstatus(struct elf_prstatus *prstatus,
 			  struct task_struct *p, long signr)
diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 0fbd50c..7a017e5 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -1536,7 +1536,7 @@ static void write_cinfo(__be32 **p, struct nfsd4_chan=
ge_info *c)
 	} } while (0);
=20
 /* Encode as an array of strings the string given with components
- * seperated @sep.
+ * separated @sep.
  */
 static __be32 nfsd4_encode_components(char sep, char *components,
 				   __be32 **pp, int *buflen)
diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 0d38d67..ac37488 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -1757,7 +1757,7 @@ out:
  * ocfs2_file_lock() and ocfs2_file_unlock() map to a single pair of
  * flock() calls. The locking approach this requires is sufficiently
  * different from all other cluster lock types that we implement a
- * seperate path to the "low-level" dlm calls. In particular:
+ * separate path to the "low-level" dlm calls. In particular:
  *
  * - No optimization of lock levels is done - we take at exactly
  *   what's been requested.
diff --git a/fs/ocfs2/extent_map.c b/fs/ocfs2/extent_map.c
index 843db64..100524d 100644
--- a/fs/ocfs2/extent_map.c
+++ b/fs/ocfs2/extent_map.c
@@ -452,7 +452,7 @@ static int ocfs2_get_clusters_nocache(struct inode *ino=
de,
 	if (i =3D -1) {
 		/*
 		 * Holes can be larger than the maximum size of an
-		 * extent, so we return their lengths in a seperate
+		 * extent, so we return their lengths in a separate
 		 * field.
 		 */
 		if (hole_len) {
diff --git a/include/media/davinci/vpfe_capture.h b/include/media/davinci/v=
pfe_capture.h
index 71d8982..cd8aeaf 100644
--- a/include/media/davinci/vpfe_capture.h
+++ b/include/media/davinci/vpfe_capture.h
@@ -163,7 +163,7 @@ struct vpfe_device {
 	u8 started;
 	/*
 	 * offset where second field starts from the starting of the
-	 * buffer for field seperated YCbCr formats
+	 * buffer for field separated YCbCr formats
 	 */
 	u32 field_off;
 };
diff --git a/net/netfilter/nf_conntrack_sip.c b/net/netfilter/nf_conntrack_=
sip.c
index 4b57216..38b4fd6 100644
--- a/net/netfilter/nf_conntrack_sip.c
+++ b/net/netfilter/nf_conntrack_sip.c
@@ -276,7 +276,7 @@ EXPORT_SYMBOL_GPL(ct_sip_parse_request);
  * tabs, spaces and continuation lines, which are treated as a single whit=
espace
  * character.
  *
- * Some headers may appear multiple times. A comma seperated list of value=
s is
+ * Some headers may appear multiple times. A comma separated list of value=
s is
  * equivalent to multiple headers.
  */
 static const struct sip_header ct_sip_hdrs[] =3D {
@@ -412,7 +412,7 @@ int ct_sip_get_header(const struct nf_conn *ct, const c=
har *dptr,
 }
 EXPORT_SYMBOL_GPL(ct_sip_get_header);
=20
-/* Get next header field in a list of comma seperated values */
+/* Get next header field in a list of comma separated values */
 static int ct_sip_next_header(const struct nf_conn *ct, const char *dptr,
 			      unsigned int dataoff, unsigned int datalen,
 			      enum sip_header_types type,
diff --git a/net/netfilter/xt_hashlimit.c b/net/netfilter/xt_hashlimit.c
index dd16e40..cbaac92 100644
--- a/net/netfilter/xt_hashlimit.c
+++ b/net/netfilter/xt_hashlimit.c
@@ -1,6 +1,6 @@
 /*
  *	xt_hashlimit - Netfilter module to limit the number of packets per time
- *	seperately for each hashbucket (sourceip/sourceport/dstip/dstport)
+ *	separately for each hashbucket (sourceip/sourceport/dstip/dstport)
  *
  *	(C) 2003-2004 by Harald Welte <laforge@netfilter.org>
  *	Copyright =C2=A9 CC Computer Consultants GmbH, 2007 - 2008
--=20
1.6.3.3

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
