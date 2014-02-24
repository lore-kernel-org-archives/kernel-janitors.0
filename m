From: Silvan Jegen <s.jegen@gmail.com>
Date: Mon, 24 Feb 2014 20:04:52 +0000
Subject: [PATCH] Replace min macro with min_t
Message-Id: <530bb134.84ce0e0a.2d96.2b6b@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi everyone

Below I tried to prepare a patch for an issue I found out about on
the lkml:

https://lkml.org/lkml/2014/2/21/57

I replaced the min macro in all places (that I could find using a simple
regex search) with min_t regardless of whether it makes the code any
shorter or not (for consistency's sake).

I would appreciate it if somebody could review these changes and tell me
whether it is worth sending them to the linux mailing list. Alternatively,
I could rework the patch and only send the instances where usage of
min_t does not make the code longer.

If you think I should send it, would it be enough to send it to the
Trivial Patch Monkey at trivial@kernel.org and the linux kernel list or
would I have to include other individual maintainers?


Cheers,

Silvan

-- >8 --
From: Silvan Jegen <s.jegen@gmail.com>
Date: Mon, 24 Feb 2014 21:04:52 +0100
Subject: [PATCH] Replace min macro with min_t

Signed-off-by: Silvan Jegen <s.jegen@gmail.com>
---
 arch/mips/kernel/rtlx.c                    |  4 ++--
 arch/powerpc/mm/dma-noncoherent.c          |  4 ++--
 arch/tile/kernel/pci-dma.c                 |  8 ++++----
 drivers/block/drbd/drbd_bitmap.c           |  2 +-
 drivers/char/pcmcia/cm4000_cs.c            |  4 ++--
 drivers/char/virtio_console.c              |  2 +-
 drivers/dma/fsldma.c                       |  2 +-
 drivers/gpu/drm/i915/i915_debugfs.c        |  2 +-
 drivers/hid/hid-picolcd_fb.c               |  2 +-
 drivers/hid/hid-wiimote-debug.c            |  2 +-
 drivers/mfd/aat2870-core.c                 |  2 +-
 drivers/mtd/nand/nand_bbt.c                |  4 ++--
 drivers/net/wireless/b43/main.c            |  2 +-
 drivers/net/wireless/b43/sysfs.c           |  2 +-
 drivers/net/wireless/b43/xmit.c            |  2 +-
 drivers/net/wireless/b43legacy/main.c      |  4 ++--
 drivers/net/wireless/b43legacy/sysfs.c     |  2 +-
 drivers/net/wireless/b43legacy/xmit.c      |  2 +-
 drivers/net/wireless/cw1200/fwio.c         |  4 ++--
 drivers/net/wireless/ipw2x00/ipw2100.c     |  2 +-
 drivers/net/wireless/ipw2x00/ipw2200.c     |  2 +-
 drivers/net/wireless/libertas/if_sdio.c    |  4 ++--
 drivers/net/wireless/mwifiex/debugfs.c     |  4 ++--
 drivers/net/wireless/p54/p54usb.c          |  2 +-
 drivers/net/wireless/prism54/isl_ioctl.c   |  2 +-
 drivers/net/wireless/rt2x00/rt2x00debug.c  |  2 +-
 drivers/net/wireless/ti/wlcore/main.c      |  2 +-
 drivers/net/wireless/ti/wlcore/spi.c       |  4 ++--
 drivers/net/wireless/ti/wlcore/sysfs.c     |  2 +-
 drivers/pci/rom.c                          |  2 +-
 drivers/s390/char/monreader.c              |  4 ++--
 drivers/s390/char/sclp_ocf.c               |  4 ++--
 drivers/s390/char/vmur.c                   |  2 +-
 drivers/s390/char/zcore.c                  |  4 ++--
 drivers/scsi/libfc/fc_fcp.c                |  2 +-
 drivers/scsi/libfc/fc_libfc.c              |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c |  2 +-
 drivers/target/tcm_fc/tfc_io.c             | 10 +++++-----
 drivers/usb/gadget/f_fs.c                  |  6 +++---
 drivers/usb/mon/mon_bin.c                  |  2 +-
 drivers/usb/serial/sierra.c                |  2 +-
 drivers/usb/usb-skeleton.c                 |  2 +-
 drivers/uwb/i1480/dfu/phy.c                |  2 +-
 drivers/vfio/pci/vfio_pci_rdwr.c           | 10 +++++-----
 fs/cifs/file.c                             |  2 +-
 fs/file.c                                  |  2 +-
 fs/logfs/dev_bdev.c                        |  4 ++--
 lib/dma-debug.c                            |  2 +-
 net/sunrpc/xprtrdma/svc_rdma_transport.c   |  8 ++++----
 49 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/arch/mips/kernel/rtlx.c b/arch/mips/kernel/rtlx.c
index 31b1b76..fe442db 100644
--- a/arch/mips/kernel/rtlx.c
+++ b/arch/mips/kernel/rtlx.c
@@ -258,7 +258,7 @@ ssize_t rtlx_read(int index, void __user *buff, size_t count)
 		     % lx->buffer_size);
 
 	/* then how much from the read pointer onwards */
-	fl = min(count, (size_t)lx->buffer_size - lx->lx_read);
+	fl = min_t(size_t, count, lx->buffer_size - lx->lx_read);
 
 	failed = copy_to_user(buff, lx->lx_buffer + lx->lx_read, fl);
 	if (failed)
@@ -300,7 +300,7 @@ ssize_t rtlx_write(int index, const void __user *buffer, size_t count)
 						     rt->buffer_size));
 
 	/* first bit from write pointer to the end of the buffer, or count */
-	fl = min(count, (size_t) rt->buffer_size - rt->rt_write);
+	fl = min_t(size_t, count, rt->buffer_size - rt->rt_write);
 
 	failed = copy_from_user(rt->rt_buffer + rt->rt_write, buffer, fl);
 	if (failed)
diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index 7b6c107..7dbb94a 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -354,7 +354,7 @@ EXPORT_SYMBOL(__dma_sync);
 static inline void __dma_sync_page_highmem(struct page *page,
 		unsigned long offset, size_t size, int direction)
 {
-	size_t seg_size = min((size_t)(PAGE_SIZE - offset), size);
+	size_t seg_size = min_t(size_t, PAGE_SIZE - offset, size);
 	size_t cur_size = seg_size;
 	unsigned long flags, start, seg_offset = offset;
 	int nr_segs = 1 + ((size - seg_size) + PAGE_SIZE - 1)/PAGE_SIZE;
@@ -371,7 +371,7 @@ static inline void __dma_sync_page_highmem(struct page *page,
 		seg_nr++;
 
 		/* Calculate next buffer segment size */
-		seg_size = min((size_t)PAGE_SIZE, size - cur_size);
+		seg_size = min_t(size_t, PAGE_SIZE, size - cur_size);
 
 		/* Add the segment size to our running total */
 		cur_size += seg_size;
diff --git a/arch/tile/kernel/pci-dma.c b/arch/tile/kernel/pci-dma.c
index 09b5870..d44ee40 100644
--- a/arch/tile/kernel/pci-dma.c
+++ b/arch/tile/kernel/pci-dma.c
@@ -173,14 +173,14 @@ static void __dma_prep_pa_range(dma_addr_t dma_addr, size_t size,
 {
 	struct page *page = pfn_to_page(PFN_DOWN(dma_addr));
 	unsigned long offset = dma_addr & (PAGE_SIZE - 1);
-	size_t bytes = min(size, (size_t)(PAGE_SIZE - offset));
+	size_t bytes = min_t(size_t, size, PAGE_SIZE - offset);
 
 	while (size != 0) {
 		__dma_prep_page(page, offset, bytes, direction);
 		size -= bytes;
 		++page;
 		offset = 0;
-		bytes = min((size_t)PAGE_SIZE, size);
+		bytes = min_t(size_t, PAGE_SIZE, size);
 	}
 }
 
@@ -189,14 +189,14 @@ static void __dma_complete_pa_range(dma_addr_t dma_addr, size_t size,
 {
 	struct page *page = pfn_to_page(PFN_DOWN(dma_addr));
 	unsigned long offset = dma_addr & (PAGE_SIZE - 1);
-	size_t bytes = min(size, (size_t)(PAGE_SIZE - offset));
+	size_t bytes = min_t(size_t, size, PAGE_SIZE - offset);
 
 	while (size != 0) {
 		__dma_complete_page(page, offset, bytes, direction);
 		size -= bytes;
 		++page;
 		offset = 0;
-		bytes = min((size_t)PAGE_SIZE, size);
+		bytes = min_t(size_t, PAGE_SIZE, size);
 	}
 }
 
diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 597f111..d3b2fca 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -1687,7 +1687,7 @@ int drbd_bm_e_weight(struct drbd_conf *mdev, unsigned long enr)
 		bm_print_lock_info(mdev);
 
 	s = S2W(enr);
-	e = min((size_t)S2W(enr+1), b->bm_words);
+	e = min_t(size_t, S2W(enr+1), b->bm_words);
 	count = 0;
 	if (s < b->bm_words) {
 		int n = e-s;
diff --git a/drivers/char/pcmcia/cm4000_cs.c b/drivers/char/pcmcia/cm4000_cs.c
index c115217..980944a 100644
--- a/drivers/char/pcmcia/cm4000_cs.c
+++ b/drivers/char/pcmcia/cm4000_cs.c
@@ -985,7 +985,7 @@ static ssize_t cmm_read(struct file *filp, __user char *buf, size_t count,
 	}
 
 	DEBUGP(4, dev, "begin read answer\n");
-	j = min(count, (size_t)(dev->rlen - dev->rpos));
+	j = min_t(size_t, count, dev->rlen - dev->rpos);
 	k = dev->rpos;
 	if (k + j > 255)
 		j = 256 - k;
@@ -994,7 +994,7 @@ static ssize_t cmm_read(struct file *filp, __user char *buf, size_t count,
 		xoutb(k++, REG_BUF_ADDR(iobase));
 		dev->rbuf[i] = xinb(REG_BUF_DATA(iobase));
 	}
-	j = min(count, (size_t)(dev->rlen - dev->rpos));
+	j = min_t(size_t, count, dev->rlen - dev->rpos);
 	if (k + j > 255) {
 		DEBUGP(4, dev, "read2 j=%d\n", j);
 		dev->flags1 |= 0x10;	/* MSB buf addr set */
diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 6928d09..ca562ee 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -831,7 +831,7 @@ static ssize_t port_fops_write(struct file *filp, const char __user *ubuf,
 	if (ret < 0)
 		return ret;
 
-	count = min((size_t)(32 * 1024), count);
+	count = min_t(size_t, 32 * 1024, count);
 
 	buf = alloc_buf(port->out_vq, count, 0);
 	if (!buf)
diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index f157c6f..54b8223 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -574,7 +574,7 @@ fsl_dma_prep_memcpy(struct dma_chan *dchan,
 			goto fail;
 		}
 
-		copy = min(len, (size_t)FSL_DMA_BCR_MAX_CNT);
+		copy = min_t(size_t, len, FSL_DMA_BCR_MAX_CNT);
 
 		set_desc_cnt(chan, &new->hw, copy);
 		set_desc_src(chan, &new->hw, dma_src);
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index b2b46c5..917a0ea 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -2106,7 +2106,7 @@ i915_pipe_crc_read(struct file *filep, char __user *user_buf, size_t count,
 	/* We now have one or more entries to read */
 	head = pipe_crc->head;
 	tail = pipe_crc->tail;
-	n_entries = min((size_t)CIRC_CNT(head, tail, INTEL_PIPE_CRC_ENTRIES_NR),
+	n_entries = min_t(size_t, CIRC_CNT(head, tail, INTEL_PIPE_CRC_ENTRIES_NR),
 			count / PIPE_CRC_LINE_LEN);
 	spin_unlock_irq(&pipe_crc->lock);
 
diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index c930ab8..8cc1433 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -472,7 +472,7 @@ static ssize_t picolcd_fb_update_rate_show(struct device *dev,
 		else
 			ret += snprintf(buf+ret, PAGE_SIZE-ret, "%u ", i);
 	if (ret > 0)
-		buf[min(ret, (size_t)PAGE_SIZE)-1] = '\n';
+		buf[min_t(size_t, ret, PAGE_SIZE)-1] = '\n';
 	return ret;
 }
 
diff --git a/drivers/hid/hid-wiimote-debug.c b/drivers/hid/hid-wiimote-debug.c
index c13fb5b..97b4023 100644
--- a/drivers/hid/hid-wiimote-debug.c
+++ b/drivers/hid/hid-wiimote-debug.c
@@ -137,7 +137,7 @@ static ssize_t wiidebug_drm_write(struct file *f, const char __user *u,
 	if (s = 0)
 		return -EINVAL;
 
-	len = min((size_t) 15, s);
+	len = min_t(size_t, 15, s);
 	if (copy_from_user(buf, u, len))
 		return -EFAULT;
 
diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 14d9542..773ab4c 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -293,7 +293,7 @@ static ssize_t aat2870_reg_write_file(struct file *file,
 	unsigned long addr, val;
 	int ret;
 
-	buf_size = min(count, (size_t)(sizeof(buf)-1));
+	buf_size = min_t(size_t, count, sizeof(buf)-1);
 	if (copy_from_user(buf, user_buf, buf_size)) {
 		dev_err(aat2870->dev, "Failed to copy from user\n");
 		return -EFAULT;
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index c0615d1..7f61464 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -188,7 +188,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 	from = ((loff_t)page) << this->page_shift;
 
 	while (totlen) {
-		len = min(totlen, (size_t)(1 << this->bbt_erase_shift));
+		len = min_t(size_t, totlen, 1 << this->bbt_erase_shift);
 		if (marker_len) {
 			/*
 			 * In case the BBT marker is not in the OOB area it
@@ -326,7 +326,7 @@ static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 
 	while (len > 0) {
 		ops.datbuf = buf;
-		ops.len = min(len, (size_t)mtd->writesize);
+		ops.len = min_t(size_t, len, mtd->writesize);
 		ops.oobbuf = buf + ops.len;
 
 		res = mtd_read_oob(mtd, offs, &ops);
diff --git a/drivers/net/wireless/b43/main.c b/drivers/net/wireless/b43/main.c
index c75237e..69fc3d6 100644
--- a/drivers/net/wireless/b43/main.c
+++ b/drivers/net/wireless/b43/main.c
@@ -1549,7 +1549,7 @@ static void b43_write_beacon_template(struct b43_wldev *dev,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(dev->wl->current_beacon);
 
 	bcn = (const struct ieee80211_mgmt *)(dev->wl->current_beacon->data);
-	len = min((size_t) dev->wl->current_beacon->len,
+	len = min_t(size_t, dev->wl->current_beacon->len,
 		  0x200 - sizeof(struct b43_plcp_hdr6));
 	rate = ieee80211_get_tx_rate(dev->wl->hw, info)->hw_value;
 
diff --git a/drivers/net/wireless/b43/sysfs.c b/drivers/net/wireless/b43/sysfs.c
index 8e8431d..3190493 100644
--- a/drivers/net/wireless/b43/sysfs.c
+++ b/drivers/net/wireless/b43/sysfs.c
@@ -40,7 +40,7 @@ static int get_integer(const char *buf, size_t count)
 
 	if (count = 0)
 		goto out;
-	count = min(count, (size_t) 10);
+	count = min_t(size_t, count, 10);
 	memcpy(tmp, buf, count);
 	ret = simple_strtol(tmp, NULL, 10);
       out:
diff --git a/drivers/net/wireless/b43/xmit.c b/drivers/net/wireless/b43/xmit.c
index 50e5ddb..bd8e456 100644
--- a/drivers/net/wireless/b43/xmit.c
+++ b/drivers/net/wireless/b43/xmit.c
@@ -337,7 +337,7 @@ int b43_generate_txhdr(struct b43_wldev *dev,
 			/* iv16 */
 			memcpy(txhdr->iv + 10, ((u8 *) wlhdr) + wlhdr_len, 3);
 		} else {
-			iv_len = min((size_t) info->control.hw_key->iv_len,
+			iv_len = min_t(size_t, info->control.hw_key->iv_len,
 				     ARRAY_SIZE(txhdr->iv));
 			memcpy(txhdr->iv, ((u8 *) wlhdr) + wlhdr_len, iv_len);
 		}
diff --git a/drivers/net/wireless/b43legacy/main.c b/drivers/net/wireless/b43legacy/main.c
index 349c776..1aec214 100644
--- a/drivers/net/wireless/b43legacy/main.c
+++ b/drivers/net/wireless/b43legacy/main.c
@@ -978,7 +978,7 @@ static void b43legacy_write_beacon_template(struct b43legacy_wldev *dev,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(dev->wl->current_beacon);
 
 	bcn = (const struct ieee80211_mgmt *)(dev->wl->current_beacon->data);
-	len = min((size_t)dev->wl->current_beacon->len,
+	len = min_t(size_t, dev->wl->current_beacon->len,
 		  0x200 - sizeof(struct b43legacy_plcp_hdr6));
 	rate = ieee80211_get_tx_rate(dev->wl->hw, info)->hw_value;
 
@@ -1155,7 +1155,7 @@ static void b43legacy_write_probe_resp_template(struct b43legacy_wldev *dev,
 	b43legacy_write_probe_resp_plcp(dev, 0x350, size,
 					&b43legacy_b_ratetable[3]);
 
-	size = min((size_t)size,
+	size = min_t(size_t, size,
 		   0x200 - sizeof(struct b43legacy_plcp_hdr6));
 	b43legacy_write_template_common(dev, probe_resp_data,
 					size, ram_offset,
diff --git a/drivers/net/wireless/b43legacy/sysfs.c b/drivers/net/wireless/b43legacy/sysfs.c
index 57f8b08..2a1da15 100644
--- a/drivers/net/wireless/b43legacy/sysfs.c
+++ b/drivers/net/wireless/b43legacy/sysfs.c
@@ -42,7 +42,7 @@ static int get_integer(const char *buf, size_t count)
 
 	if (count = 0)
 		goto out;
-	count = min(count, (size_t)10);
+	count = min_t(size_t, count, 10);
 	memcpy(tmp, buf, count);
 	ret = simple_strtol(tmp, NULL, 10);
 out:
diff --git a/drivers/net/wireless/b43legacy/xmit.c b/drivers/net/wireless/b43legacy/xmit.c
index 86588c9..34bf3f0 100644
--- a/drivers/net/wireless/b43legacy/xmit.c
+++ b/drivers/net/wireless/b43legacy/xmit.c
@@ -254,7 +254,7 @@ static int generate_txhdr_fw3(struct b43legacy_wldev *dev,
 				   B43legacy_TX4_MAC_KEYALG_SHIFT) &
 				   B43legacy_TX4_MAC_KEYALG;
 			wlhdr_len = ieee80211_hdrlen(wlhdr->frame_control);
-			iv_len = min((size_t)info->control.hw_key->iv_len,
+			iv_len = min_t(size_t, info->control.hw_key->iv_len,
 				     ARRAY_SIZE(txhdr->iv));
 			memcpy(txhdr->iv, ((u8 *)wlhdr) + wlhdr_len, iv_len);
 		} else {
diff --git a/drivers/net/wireless/cw1200/fwio.c b/drivers/net/wireless/cw1200/fwio.c
index 5a9ffd3..e23d67e 100644
--- a/drivers/net/wireless/cw1200/fwio.c
+++ b/drivers/net/wireless/cw1200/fwio.c
@@ -202,8 +202,8 @@ static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
 		}
 
 		/* calculate the block size */
-		tx_size = block_size = min((size_t)(firmware->size - put),
-			(size_t)DOWNLOAD_BLOCK_SIZE);
+		tx_size = block_size = min_t(size_t, firmware->size - put,
+					DOWNLOAD_BLOCK_SIZE);
 
 		memcpy(buf, &firmware->data[put], block_size);
 		if (block_size < DOWNLOAD_BLOCK_SIZE) {
diff --git a/drivers/net/wireless/ipw2x00/ipw2100.c b/drivers/net/wireless/ipw2x00/ipw2100.c
index 3aba492..dfc6dfc 100644
--- a/drivers/net/wireless/ipw2x00/ipw2100.c
+++ b/drivers/net/wireless/ipw2x00/ipw2100.c
@@ -7065,7 +7065,7 @@ static int ipw2100_wx_set_nick(struct net_device *dev,
 	if (wrqu->data.length > IW_ESSID_MAX_SIZE)
 		return -E2BIG;
 
-	wrqu->data.length = min((size_t) wrqu->data.length, sizeof(priv->nick));
+	wrqu->data.length = min_t(size_t, wrqu->data.length, sizeof(priv->nick));
 	memset(priv->nick, 0, sizeof(priv->nick));
 	memcpy(priv->nick, extra, wrqu->data.length);
 
diff --git a/drivers/net/wireless/ipw2x00/ipw2200.c b/drivers/net/wireless/ipw2x00/ipw2200.c
index 1393260..c5aa404 100644
--- a/drivers/net/wireless/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/ipw2x00/ipw2200.c
@@ -9169,7 +9169,7 @@ static int ipw_wx_set_nick(struct net_device *dev,
 	if (wrqu->data.length > IW_ESSID_MAX_SIZE)
 		return -E2BIG;
 	mutex_lock(&priv->mutex);
-	wrqu->data.length = min((size_t) wrqu->data.length, sizeof(priv->nick));
+	wrqu->data.length = min_t(size_t, wrqu->data.length, sizeof(priv->nick));
 	memset(priv->nick, 0, sizeof(priv->nick));
 	memcpy(priv->nick, extra, wrqu->data.length);
 	IPW_DEBUG_TRACE("<<\n");
diff --git a/drivers/net/wireless/libertas/if_sdio.c b/drivers/net/wireless/libertas/if_sdio.c
index 58c6ee5d..33ceda2 100644
--- a/drivers/net/wireless/libertas/if_sdio.c
+++ b/drivers/net/wireless/libertas/if_sdio.c
@@ -498,7 +498,7 @@ static int if_sdio_prog_helper(struct if_sdio_card *card,
 		 */
 		mdelay(2);
 
-		chunk_size = min(size, (size_t)60);
+		chunk_size = min_t(size_t, size, 60);
 
 		*((__le32*)chunk_buffer) = cpu_to_le32(chunk_size);
 		memcpy(chunk_buffer + 4, firmware, chunk_size);
@@ -639,7 +639,7 @@ static int if_sdio_prog_real(struct if_sdio_card *card,
 			req_size = size;
 
 		while (req_size) {
-			chunk_size = min(req_size, (size_t)512);
+			chunk_size = min_t(size_t, req_size, 512);
 
 			memcpy(chunk_buffer, firmware, chunk_size);
 /*
diff --git a/drivers/net/wireless/mwifiex/debugfs.c b/drivers/net/wireless/mwifiex/debugfs.c
index a5f9875..e1e18bb 100644
--- a/drivers/net/wireless/mwifiex/debugfs.c
+++ b/drivers/net/wireless/mwifiex/debugfs.c
@@ -493,7 +493,7 @@ mwifiex_regrdwr_write(struct file *file,
 {
 	unsigned long addr = get_zeroed_page(GFP_KERNEL);
 	char *buf = (char *) addr;
-	size_t buf_size = min(count, (size_t) (PAGE_SIZE - 1));
+	size_t buf_size = min_t(size_t, count, PAGE_SIZE - 1);
 	int ret;
 	u32 reg_type = 0, reg_offset = 0, reg_value = UINT_MAX;
 
@@ -594,7 +594,7 @@ mwifiex_rdeeprom_write(struct file *file,
 {
 	unsigned long addr = get_zeroed_page(GFP_KERNEL);
 	char *buf = (char *) addr;
-	size_t buf_size = min(count, (size_t) (PAGE_SIZE - 1));
+	size_t buf_size = min_t(size_t, count, PAGE_SIZE - 1);
 	int ret = 0;
 	int offset = -1, bytes = -1;
 
diff --git a/drivers/net/wireless/p54/p54usb.c b/drivers/net/wireless/p54/p54usb.c
index 6e635cf..b7ab3df 100644
--- a/drivers/net/wireless/p54/p54usb.c
+++ b/drivers/net/wireless/p54/p54usb.c
@@ -513,7 +513,7 @@ static int p54u_upload_firmware_3887(struct ieee80211_hw *dev)
 	if (!buf)
 		return -ENOMEM;
 
-	left = block_size = min((size_t)P54U_FW_BLOCK, priv->fw->size);
+	left = block_size = min_t(size_t, P54U_FW_BLOCK, priv->fw->size);
 	strcpy(buf, p54u_firmware_upload_3887);
 	left -= strlen(p54u_firmware_upload_3887);
 	tmp += strlen(p54u_firmware_upload_3887);
diff --git a/drivers/net/wireless/prism54/isl_ioctl.c b/drivers/net/wireless/prism54/isl_ioctl.c
index 78fa64d..ecbb054 100644
--- a/drivers/net/wireless/prism54/isl_ioctl.c
+++ b/drivers/net/wireless/prism54/isl_ioctl.c
@@ -644,7 +644,7 @@ prism54_translate_bss(struct net_device *ndev, struct iw_request_info *info,
 	wpa_ie_len = prism54_wpa_bss_ie_get(priv, bss->address, wpa_ie);
 	if (wpa_ie_len > 0) {
 		iwe.cmd = IWEVGENIE;
-		iwe.u.data.length = min(wpa_ie_len, (size_t)MAX_WPA_IE_LEN);
+		iwe.u.data.length = min_t(size_t, wpa_ie_len, MAX_WPA_IE_LEN);
 		current_ev = iwe_stream_add_point(info, current_ev, end_buf,
 						  &iwe, wpa_ie);
 	}
diff --git a/drivers/net/wireless/rt2x00/rt2x00debug.c b/drivers/net/wireless/rt2x00/rt2x00debug.c
index 2e3d164..90fdb02 100644
--- a/drivers/net/wireless/rt2x00/rt2x00debug.c
+++ b/drivers/net/wireless/rt2x00/rt2x00debug.c
@@ -286,7 +286,7 @@ static ssize_t rt2x00debug_read_queue_dump(struct file *file,
 	if (retval)
 		return retval;
 
-	status = min((size_t)skb->len, length);
+	status = min_t(size_t, skb->len, length);
 	if (copy_to_user(buf, skb->data, status)) {
 		status = -EFAULT;
 		goto exit;
diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless/ti/wlcore/main.c
index b46b311..4f01834 100644
--- a/drivers/net/wireless/ti/wlcore/main.c
+++ b/drivers/net/wireless/ti/wlcore/main.c
@@ -803,7 +803,7 @@ size_t wl12xx_copy_fwlog(struct wl1271 *wl, u8 *memblock, size_t maxlen)
 	size_t len;
 
 	/* Make sure we have enough room */
-	len = min(maxlen, (size_t)(PAGE_SIZE - wl->fwlog_size));
+	len = min_t(size_t, maxlen, PAGE_SIZE - wl->fwlog_size);
 
 	/* Fill the FW log file, consumed by the sysfs fwlog entry */
 	memcpy(wl->fwlog + wl->fwlog_size, memblock, len);
diff --git a/drivers/net/wireless/ti/wlcore/spi.c b/drivers/net/wireless/ti/wlcore/spi.c
index b2c018d..dbe826d 100644
--- a/drivers/net/wireless/ti/wlcore/spi.c
+++ b/drivers/net/wireless/ti/wlcore/spi.c
@@ -211,7 +211,7 @@ static int __must_check wl12xx_spi_raw_read(struct device *child, int addr,
 	u32 chunk_len;
 
 	while (len > 0) {
-		chunk_len = min((size_t)WSPI_MAX_CHUNK_SIZE, len);
+		chunk_len = min_t(size_t, WSPI_MAX_CHUNK_SIZE, len);
 
 		cmd = &wl->buffer_cmd;
 		busy_buf = wl->buffer_busyword;
@@ -285,7 +285,7 @@ static int __must_check wl12xx_spi_raw_write(struct device *child, int addr,
 	cmd = &commands[0];
 	i = 0;
 	while (len > 0) {
-		chunk_len = min((size_t)WSPI_MAX_CHUNK_SIZE, len);
+		chunk_len = min_t(size_t, WSPI_MAX_CHUNK_SIZE, len);
 
 		*cmd = 0;
 		*cmd |= WSPI_CMD_WRITE;
diff --git a/drivers/net/wireless/ti/wlcore/sysfs.c b/drivers/net/wireless/ti/wlcore/sysfs.c
index 8e58349..24dd288 100644
--- a/drivers/net/wireless/ti/wlcore/sysfs.c
+++ b/drivers/net/wireless/ti/wlcore/sysfs.c
@@ -152,7 +152,7 @@ static ssize_t wl1271_sysfs_read_fwlog(struct file *filp, struct kobject *kobj,
 	}
 
 	/* Seeking is not supported - old logs are not kept. Disregard pos. */
-	len = min(count, (size_t)wl->fwlog_size);
+	len = min_t(size_t, count, wl->fwlog_size);
 	wl->fwlog_size -= len;
 	memcpy(buffer, wl->fwlog, len);
 
diff --git a/drivers/pci/rom.c b/drivers/pci/rom.c
index 5d59572..b270551 100644
--- a/drivers/pci/rom.c
+++ b/drivers/pci/rom.c
@@ -97,7 +97,7 @@ size_t pci_get_rom_size(struct pci_dev *pdev, void __iomem *rom, size_t size)
 
 	/* never return a size larger than the PCI resource window */
 	/* there are known ROMs that get the size wrong */
-	return min((size_t)(image - rom), size);
+	return min_t(size_t, image - rom, size);
 }
 
 /**
diff --git a/drivers/s390/char/monreader.c b/drivers/s390/char/monreader.c
index 0da3ae3..d9b0978 100644
--- a/drivers/s390/char/monreader.c
+++ b/drivers/s390/char/monreader.c
@@ -395,7 +395,7 @@ static ssize_t mon_read(struct file *filp, char __user *data,
 	/* read monitor control element (12 bytes) first */
 	mce_start = mon_mca_start(monmsg) + monmsg->mca_offset;
 	if ((monmsg->pos >= mce_start) && (monmsg->pos < mce_start + 12)) {
-		count = min(count, (size_t) mce_start + 12 - monmsg->pos);
+		count = min_t(size_t, count, mce_start + 12 - monmsg->pos);
 		ret = copy_to_user(data, (void *) (unsigned long) monmsg->pos,
 				   count);
 		if (ret)
@@ -408,7 +408,7 @@ static ssize_t mon_read(struct file *filp, char __user *data,
 
 	/* read records */
 	if (monmsg->pos <= mon_rec_end(monmsg)) {
-		count = min(count, (size_t) mon_rec_end(monmsg) - monmsg->pos
+		count = min_t(size_t, count, mon_rec_end(monmsg) - monmsg->pos
 					    + 1);
 		ret = copy_to_user(data, (void *) (unsigned long) monmsg->pos,
 				   count);
diff --git a/drivers/s390/char/sclp_ocf.c b/drivers/s390/char/sclp_ocf.c
index 2553db0..a0da238 100644
--- a/drivers/s390/char/sclp_ocf.c
+++ b/drivers/s390/char/sclp_ocf.c
@@ -65,13 +65,13 @@ static void sclp_ocf_handler(struct evbuf_header *evbuf)
 	/* Copy network name and cpc name. */
 	spin_lock(&sclp_ocf_lock);
 	if (netid) {
-		size = min(OCF_LENGTH_HMC_NETWORK, (size_t) netid->length);
+		size = min_t(size_t, OCF_LENGTH_HMC_NETWORK, netid->length);
 		memcpy(hmc_network, netid + 1, size);
 		EBCASC(hmc_network, size);
 		hmc_network[size] = 0;
 	}
 	if (cpc) {
-		size = min(OCF_LENGTH_CPC_NAME, (size_t) cpc->length);
+		size = min_t(size_t, OCF_LENGTH_CPC_NAME, cpc->length);
 		memcpy(cpc_name, cpc + 1, size);
 		EBCASC(cpc_name, size);
 		cpc_name[size] = 0;
diff --git a/drivers/s390/char/vmur.c b/drivers/s390/char/vmur.c
index 0efb27f..a0a855b 100644
--- a/drivers/s390/char/vmur.c
+++ b/drivers/s390/char/vmur.c
@@ -523,7 +523,7 @@ static ssize_t diag14_read(struct file *file, char __user *ubuf, size_t count,
 	if (rc)
 		return rc;
 
-	len = min((size_t) PAGE_SIZE, count);
+	len = min_t(size_t, PAGE_SIZE, count);
 	buf = (char *) __get_free_page(GFP_KERNEL | GFP_DMA);
 	if (!buf)
 		return -ENOMEM;
diff --git a/drivers/s390/char/zcore.c b/drivers/s390/char/zcore.c
index 3d8e4d6..c794d15 100644
--- a/drivers/s390/char/zcore.c
+++ b/drivers/s390/char/zcore.c
@@ -309,11 +309,11 @@ static ssize_t zcore_read(struct file *file, char __user *buf, size_t count,
 		goto fail;
 	}
 
-	count = min(count, (size_t) (sys_info.mem_size + HEADER_SIZE - *ppos));
+	count = min_t(size_t, count, sys_info.mem_size + HEADER_SIZE - *ppos);
 
 	/* Copy dump header */
 	if (*ppos < HEADER_SIZE) {
-		size = min(count, (size_t) (HEADER_SIZE - *ppos));
+		size = min_t(size_t, count, HEADER_SIZE - *ppos);
 		if (copy_to_user(buf, &zcore_header + *ppos, size)) {
 			rc = -EFAULT;
 			goto fail;
diff --git a/drivers/scsi/libfc/fc_fcp.c b/drivers/scsi/libfc/fc_fcp.c
index 1d7e76e..be7de83 100644
--- a/drivers/scsi/libfc/fc_fcp.c
+++ b/drivers/scsi/libfc/fc_fcp.c
@@ -597,7 +597,7 @@ static int fc_fcp_send_data(struct fc_fcp_pkt *fsp, struct fc_seq *seq,
 	 */
 	t_blen = fsp->max_payload;
 	if (lport->seq_offload) {
-		t_blen = min(seq_blen, (size_t)lport->lso_max);
+		t_blen = min_t(size_t, seq_blen, lport->lso_max);
 		FC_FCP_DBG(fsp, "fsp=%p:lso:blen=%zx lso_max=0x%x t_blen=%zx\n",
 			   fsp, seq_blen, lport->lso_max, t_blen);
 	}
diff --git a/drivers/scsi/libfc/fc_libfc.c b/drivers/scsi/libfc/fc_libfc.c
index 8d65a51a..6721308 100644
--- a/drivers/scsi/libfc/fc_libfc.c
+++ b/drivers/scsi/libfc/fc_libfc.c
@@ -139,8 +139,8 @@ u32 fc_copy_buffer_to_sglist(void *buf, size_t len,
 		 * but we are limited to mapping PAGE_SIZE at a time.
 		 */
 		off = *offset + sg->offset;
-		sg_bytes = min(sg_bytes,
-			       (size_t)(PAGE_SIZE - (off & ~PAGE_MASK)));
+		sg_bytes = min_t(size_t, sg_bytes,
+			       PAGE_SIZE - (off & ~PAGE_MASK));
 		page_addr = kmap_atomic(sg_page(sg) + (off >> PAGE_SHIFT));
 		if (crc)
 			*crc = crc32(*crc, buf, sg_bytes);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 6202358..498995d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -609,7 +609,7 @@ static int r8192_wx_set_nick(struct net_device *dev,
 	if (wrqu->data.length > IW_ESSID_MAX_SIZE)
 		return -E2BIG;
 	down(&priv->wx_sem);
-	wrqu->data.length = min((size_t) wrqu->data.length, sizeof(priv->nick));
+	wrqu->data.length = min_t(size_t, wrqu->data.length, sizeof(priv->nick));
 	memset(priv->nick, 0, sizeof(priv->nick));
 	memcpy(priv->nick, extra, wrqu->data.length);
 	up(&priv->wx_sem);
diff --git a/drivers/target/tcm_fc/tfc_io.c b/drivers/target/tcm_fc/tfc_io.c
index e415af3..2a11dd6 100644
--- a/drivers/target/tcm_fc/tfc_io.c
+++ b/drivers/target/tcm_fc/tfc_io.c
@@ -112,7 +112,7 @@ int ft_queue_data_in(struct se_cmd *se_cmd)
 		}
 		if (!mem_len) {
 			sg = sg_next(sg);
-			mem_len = min((size_t)sg->length, remaining);
+			mem_len = min_t(size_t, sg->length, remaining);
 			mem_off = sg->offset;
 			page = sg_page(sg);
 		}
@@ -157,8 +157,8 @@ int ft_queue_data_in(struct se_cmd *se_cmd)
 			from = kmap_atomic(page + (mem_off >> PAGE_SHIFT));
 			page_addr = from;
 			from += mem_off & ~PAGE_MASK;
-			tlen = min(tlen, (size_t)(PAGE_SIZE -
-						(mem_off & ~PAGE_MASK)));
+			tlen = min_t(size_t, tlen, PAGE_SIZE -
+						(mem_off & ~PAGE_MASK));
 			memcpy(to, from, tlen);
 			kunmap_atomic(page_addr);
 			to += tlen;
@@ -308,8 +308,8 @@ void ft_recv_write_data(struct ft_cmd *cmd, struct fc_frame *fp)
 		to = kmap_atomic(page + (mem_off >> PAGE_SHIFT));
 		page_addr = to;
 		to += mem_off & ~PAGE_MASK;
-		tlen = min(tlen, (size_t)(PAGE_SIZE -
-					  (mem_off & ~PAGE_MASK)));
+		tlen = min_t(size_t, tlen, PAGE_SIZE -
+					(mem_off & ~PAGE_MASK));
 		memcpy(to, from, tlen);
 		kunmap_atomic(page_addr);
 
diff --git a/drivers/usb/gadget/f_fs.c b/drivers/usb/gadget/f_fs.c
index 2b43343..7403bb9 100644
--- a/drivers/usb/gadget/f_fs.c
+++ b/drivers/usb/gadget/f_fs.c
@@ -331,7 +331,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 		}
 
 		/* FFS_SETUP_PENDING and not stall */
-		len = min(len, (size_t)le16_to_cpu(ffs->ev.setup.wLength));
+		len = min_t(size_t, len, le16_to_cpu(ffs->ev.setup.wLength));
 
 		spin_unlock_irq(&ffs->ev.waitq.lock);
 
@@ -465,7 +465,7 @@ static ssize_t ffs_ep0_read(struct file *file, char __user *buf,
 		}
 
 		return __ffs_ep0_read_events(ffs, buf,
-					     min(n, (size_t)ffs->ev.count));
+					     min_t(size_t, n, ffs->ev.count));
 
 	case FFS_SETUP_PENDING:
 		if (ffs->ev.setup.bRequestType & USB_DIR_IN) {
@@ -474,7 +474,7 @@ static ssize_t ffs_ep0_read(struct file *file, char __user *buf,
 			goto done_mutex;
 		}
 
-		len = min(len, (size_t)le16_to_cpu(ffs->ev.setup.wLength));
+		len = min_t(size_t, len, le16_to_cpu(ffs->ev.setup.wLength));
 
 		spin_unlock_irq(&ffs->ev.waitq.lock);
 
diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index 9a62e89..62ec02c 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -816,7 +816,7 @@ static ssize_t mon_bin_read(struct file *file, char __user *buf,
 	ep = MON_OFF2HDR(rp, rp->b_out);
 
 	if (rp->b_read < hdrbytes) {
-		step_len = min(nbytes, (size_t)(hdrbytes - rp->b_read));
+		step_len = min_t(size_t, nbytes, hdrbytes - rp->b_read);
 		ptr = ((char *)ep) + rp->b_read;
 		if (step_len && copy_to_user(buf, ptr, step_len)) {
 			mutex_unlock(&rp->fetch_lock);
diff --git a/drivers/usb/serial/sierra.c b/drivers/usb/serial/sierra.c
index a9eb622..aefeccb 100644
--- a/drivers/usb/serial/sierra.c
+++ b/drivers/usb/serial/sierra.c
@@ -463,7 +463,7 @@ static int sierra_write(struct tty_struct *tty, struct usb_serial_port *port,
 	unsigned long flags;
 	unsigned char *buffer;
 	struct urb *urb;
-	size_t writesize = min((size_t)count, (size_t)MAX_TRANSFER);
+	size_t writesize = min_t(size_t, count, MAX_TRANSFER);
 	int retval = 0;
 
 	/* verify that we actually have some data to write */
diff --git a/drivers/usb/usb-skeleton.c b/drivers/usb/usb-skeleton.c
index 545d09b..0f45b30 100644
--- a/drivers/usb/usb-skeleton.c
+++ b/drivers/usb/usb-skeleton.c
@@ -365,7 +365,7 @@ static ssize_t skel_write(struct file *file, const char *user_buffer,
 	int retval = 0;
 	struct urb *urb = NULL;
 	char *buf = NULL;
-	size_t writesize = min(count, (size_t)MAX_TRANSFER);
+	size_t writesize = min_t(size_t, count, MAX_TRANSFER);
 
 	dev = file->private_data;
 
diff --git a/drivers/uwb/i1480/dfu/phy.c b/drivers/uwb/i1480/dfu/phy.c
index 3b1a87d..a0beefe 100644
--- a/drivers/uwb/i1480/dfu/phy.c
+++ b/drivers/uwb/i1480/dfu/phy.c
@@ -174,7 +174,7 @@ int i1480_phy_fw_upload(struct i1480 *i1480)
 	/* Loop writing data in chunks as big as possible until done. */
 	for (data_itr = fw->data, data_top = data_itr + fw->size;
 	     data_itr < data_top; data_itr += MAX_BLK_SIZE) {
-		data_size = min(MAX_BLK_SIZE, (size_t) (data_top - data_itr));
+		data_size = min_t(size_t, MAX_BLK_SIZE, data_top - data_itr);
 		result = i1480_mpi_write(i1480, data_itr, data_size);
 		if (result < 0)
 			goto error_mpi_write;
diff --git a/drivers/vfio/pci/vfio_pci_rdwr.c b/drivers/vfio/pci/vfio_pci_rdwr.c
index 210db24..fe6dc92 100644
--- a/drivers/vfio/pci/vfio_pci_rdwr.c
+++ b/drivers/vfio/pci/vfio_pci_rdwr.c
@@ -37,7 +37,7 @@ static ssize_t do_io_rw(void __iomem *io, char __user *buf,
 		size_t fillable, filled;
 
 		if (off < x_start)
-			fillable = min(count, (size_t)(x_start - off));
+			fillable = min_t(size_t, count, x_start - off);
 		else if (off >= x_end)
 			fillable = count;
 		else
@@ -132,7 +132,7 @@ ssize_t vfio_pci_bar_rw(struct vfio_pci_device *vdev, char __user *buf,
 	if (pos >= end)
 		return -EINVAL;
 
-	count = min(count, (size_t)(end - pos));
+	count = min_t(size_t, count, end - pos);
 
 	if (bar = PCI_ROM_RESOURCE) {
 		/*
@@ -192,21 +192,21 @@ ssize_t vfio_pci_vga_rw(struct vfio_pci_device *vdev, char __user *buf,
 
 	switch (pos) {
 	case 0xa0000 ... 0xbffff:
-		count = min(count, (size_t)(0xc0000 - pos));
+		count = min_t(size_t, count, 0xc0000 - pos);
 		iomem = ioremap_nocache(0xa0000, 0xbffff - 0xa0000 + 1);
 		off = pos - 0xa0000;
 		rsrc = VGA_RSRC_LEGACY_MEM;
 		is_ioport = false;
 		break;
 	case 0x3b0 ... 0x3bb:
-		count = min(count, (size_t)(0x3bc - pos));
+		count = min_t(size_t, count, 0x3bc - pos);
 		iomem = ioport_map(0x3b0, 0x3bb - 0x3b0 + 1);
 		off = pos - 0x3b0;
 		rsrc = VGA_RSRC_LEGACY_IO;
 		is_ioport = true;
 		break;
 	case 0x3c0 ... 0x3df:
-		count = min(count, (size_t)(0x3e0 - pos));
+		count = min_t(size_t, count, 0x3e0 - pos);
 		iomem = ioport_map(0x3c0, 0x3df - 0x3c0 + 1);
 		off = pos - 0x3c0;
 		rsrc = VGA_RSRC_LEGACY_IO;
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 53c1507..1619988 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -1670,7 +1670,7 @@ cifs_write(struct cifsFileInfo *open_file, __u32 pid, const char *write_data,
 					break;
 			}
 
-			len = min((size_t)cifs_sb->wsize,
+			len = min_t(size_t, cifs_sb->wsize,
 				  write_size - total_written);
 			/* iov[0] is reserved for smb header */
 			iov[1].iov_base = (char *)write_data + total_written;
diff --git a/fs/file.c b/fs/file.c
index db25c2b..3e4f79d 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -431,7 +431,7 @@ void exit_files(struct task_struct *tsk)
 
 void __init files_defer_init(void)
 {
-	sysctl_nr_open_max = min((size_t)INT_MAX, ~(size_t)0/sizeof(void *)) &
+	sysctl_nr_open_max = min_t(size_t, INT_MAX, ~0/sizeof(void *)) &
 			     -BITS_PER_LONG;
 }
 
diff --git a/fs/logfs/dev_bdev.c b/fs/logfs/dev_bdev.c
index 76279e1..46b181b 100644
--- a/fs/logfs/dev_bdev.c
+++ b/fs/logfs/dev_bdev.c
@@ -83,7 +83,7 @@ static int __bdev_writeseg(struct super_block *sb, u64 ofs, pgoff_t index,
 	unsigned int max_pages;
 	int i;
 
-	max_pages = min(nr_pages, (size_t) bio_get_nr_vecs(super->s_bdev));
+	max_pages = min_t(size_t, nr_pages, bio_get_nr_vecs(super->s_bdev));
 
 	bio = bio_alloc(GFP_NOFS, max_pages);
 	BUG_ON(!bio);
@@ -175,7 +175,7 @@ static int do_erase(struct super_block *sb, u64 ofs, pgoff_t index,
 	unsigned int max_pages;
 	int i;
 
-	max_pages = min(nr_pages, (size_t) bio_get_nr_vecs(super->s_bdev));
+	max_pages = min_t(size_t, nr_pages, bio_get_nr_vecs(super->s_bdev));
 
 	bio = bio_alloc(GFP_NOFS, max_pages);
 	BUG_ON(!bio);
diff --git a/lib/dma-debug.c b/lib/dma-debug.c
index 2defd13..25282ca 100644
--- a/lib/dma-debug.c
+++ b/lib/dma-debug.c
@@ -764,7 +764,7 @@ static ssize_t filter_write(struct file *file, const char __user *userbuf,
 	 * disabled. Since copy_from_user can fault and may sleep we
 	 * need to copy to temporary buffer first
 	 */
-	len = min(count, (size_t)(NAME_MAX_LEN - 1));
+	len = min_t(size_t, count, NAME_MAX_LEN - 1);
 	if (copy_from_user(buf, userbuf, len))
 		return -EFAULT;
 
diff --git a/net/sunrpc/xprtrdma/svc_rdma_transport.c b/net/sunrpc/xprtrdma/svc_rdma_transport.c
index 62e4f9b..68c3f4a 100644
--- a/net/sunrpc/xprtrdma/svc_rdma_transport.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_transport.c
@@ -863,10 +863,10 @@ static struct svc_xprt *svc_rdma_accept(struct svc_xprt *xprt)
 
 	/* Qualify the transport resource defaults with the
 	 * capabilities of this particular device */
-	newxprt->sc_max_sge = min((size_t)devattr.max_sge,
-				  (size_t)RPCSVC_MAXPAGES);
-	newxprt->sc_max_requests = min((size_t)devattr.max_qp_wr,
-				   (size_t)svcrdma_max_requests);
+	newxprt->sc_max_sge = min_t(size_t, devattr.max_sge,
+					RPCSVC_MAXPAGES);
+	newxprt->sc_max_requests = min_t(size_t, devattr.max_qp_wr,
+					svcrdma_max_requests);
 	newxprt->sc_sq_depth = RPCRDMA_SQ_DEPTH_MULT * newxprt->sc_max_requests;
 
 	/*
-- 
1.9.0

