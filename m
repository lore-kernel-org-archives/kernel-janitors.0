From: Carlo Perassi <carlo@linux.it>
Date: Tue, 02 Nov 2004 10:55:41 +0000
Subject: Re: [KJ] [PATCH] driver/net/tg3.c: some s/int/unsigned int
Message-Id: <20041102105541.GA4485@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041102101835.GA4083@voyager>
In-Reply-To: <20041102101835.GA4083@voyager>
To: kernel-janitors@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi
this version fix the diff absolute path (2 lines differs)

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="unsigned_drivers_net_tg3_a.patch"

Signed-off-by: Carlo Perassi <carlo@linux.it>

---

--- linux-2.6.10-rc1-orig/drivers/net/tg3.c	2004-10-23 18:34:24.000000000 +0200
+++ linux-2.6.10-rc1/drivers/net/tg3.c	2004-11-01 23:11:18.000000000 +0100
@@ -471,7 +471,8 @@ static void tg3_switch_clocks(struct tg3
 static int tg3_readphy(struct tg3 *tp, int reg, u32 *val)
 {
 	u32 frame_val;
-	int loops, ret;
+	int ret;
+	unsigned int loops;
 
 	if ((tp->mi_mode & MAC_MI_MODE_AUTO_POLL) != 0) {
 		tw32_f(MAC_MI_MODE,
@@ -518,7 +519,8 @@ static int tg3_readphy(struct tg3 *tp, i
 static int tg3_writephy(struct tg3 *tp, int reg, u32 val)
 {
 	u32 frame_val;
-	int loops, ret;
+	int ret;
+	unsigned int loops;
 
 	if ((tp->mi_mode & MAC_MI_MODE_AUTO_POLL) != 0) {
 		tw32_f(MAC_MI_MODE,
@@ -573,7 +575,8 @@ static void tg3_phy_set_wirespeed(struct
 static int tg3_bmcr_reset(struct tg3 *tp)
 {
 	u32 phy_control;
-	int limit, err;
+	int err;
+	unsigned int limit;
 
 	/* OK, reset it, and poll the BMCR_RESET bit until it
 	 * clears or we time out.
@@ -595,7 +598,7 @@ static int tg3_bmcr_reset(struct tg3 *tp
 		}
 		udelay(10);
 	}
-	if (limit <= 0)
+	if (!limit)
 		return -EBUSY;
 
 	return 0;
@@ -603,7 +606,7 @@ static int tg3_bmcr_reset(struct tg3 *tp
 
 static int tg3_wait_macro_done(struct tg3 *tp)
 {
-	int limit = 100;
+	unsigned int limit = 100;
 
 	while (limit--) {
 		u32 tmp32;
@@ -612,7 +615,7 @@ static int tg3_wait_macro_done(struct tg
 		if ((tmp32 & 0x1000) == 0)
 			break;
 	}
-	if (limit <= 0)
+	if (!limit)
 		return -EBUSY;
 
 	return 0;
@@ -626,10 +629,10 @@ static int tg3_phy_write_and_check_testp
 	{ 0x00005a5a, 0x00000005, 0x00002a6a, 0x0000000a, 0x00001bcd, 0x00000003 },
 	{ 0x00002a5a, 0x0000000a, 0x000033c3, 0x00000003, 0x00002ef1, 0x00000005 }
 	};
-	int chan;
+	unsigned int chan;
 
 	for (chan = 0; chan < 4; chan++) {
-		int i;
+		unsigned int i;
 
 		tg3_writephy(tp, MII_TG3_DSP_ADDRESS,
 			     (chan * 0x2000) | 0x0200);
@@ -671,7 +674,7 @@ static int tg3_phy_write_and_check_testp
 			low &= 0x7fff;
 			high &= 0x000f;
 			if (low != test_pat[chan][i] ||
-			    high != test_pat[chan][i+1]) {
+			    high != test_pat[chan][i + 1]) {
 				tg3_writephy(tp, MII_TG3_DSP_ADDRESS, 0x000b);
 				tg3_writephy(tp, MII_TG3_DSP_RW_PORT, 0x4001);
 				tg3_writephy(tp, MII_TG3_DSP_RW_PORT, 0x4005);
@@ -686,10 +689,10 @@ static int tg3_phy_write_and_check_testp
 
 static int tg3_phy_reset_chanpat(struct tg3 *tp)
 {
-	int chan;
+	unsigned int chan;
 
 	for (chan = 0; chan < 4; chan++) {
-		int i;
+		unsigned int i;
 
 		tg3_writephy(tp, MII_TG3_DSP_ADDRESS,
 			     (chan * 0x2000) | 0x0200);
@@ -707,7 +710,8 @@ static int tg3_phy_reset_chanpat(struct 
 static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 {
 	u32 reg32, phy9_orig;
-	int retries, do_phy_reset, err;
+	int retries, err;
+	unsigned int do_phy_reset;
 
 	retries = 10;
 	do_phy_reset = 1;
@@ -1213,7 +1217,7 @@ static void tg3_aux_stat_to_speed_duplex
 static int tg3_phy_copper_begin(struct tg3 *tp)
 {
 	u32 new_adv;
-	int i;
+	unsigned int i;
 
 	if (tp->link_config.phy_is_low_power) {
 		/* Entering low power mode.  Disable gigabit and
@@ -1401,11 +1405,11 @@ static int tg3_copper_is_advertising_all
 
 static int tg3_setup_copper_phy(struct tg3 *tp, int force_reset)
 {
-	int current_link_up;
 	u32 bmsr, dummy;
 	u16 current_speed;
 	u8 current_duplex;
-	int i, err;
+	int err;
+	unsigned int current_link_up, i;
 
 	tw32(MAC_EVENT, 0);
 
@@ -1989,9 +1993,9 @@ static int tg3_fiber_aneg_smachine(struc
 
 static int fiber_autoneg(struct tg3 *tp, u32 *flags)
 {
-	int res = 0;
 	struct tg3_fiber_aneginfo aninfo;
 	int status = ANEG_FAILED;
+	unsigned int res = 0;
 	unsigned int tick;
 	u32 tmp;
 
@@ -2034,7 +2038,7 @@ static int fiber_autoneg(struct tg3 *tp,
 static void tg3_init_bcm8002(struct tg3 *tp)
 {
 	u32 mac_status = tr32(MAC_STATUS);
-	int i;
+	unsigned int i;
 
 	/* Reset when initting first time or we have a link. */
 	if ((tp->tg3_flags & TG3_FLAG_INIT_COMPLETE) &&
@@ -2085,8 +2089,7 @@ static int tg3_setup_fiber_hw_autoneg(st
 {
 	u32 sg_dig_ctrl, sg_dig_status;
 	u32 serdes_cfg, expected_sg_dig_ctrl;
-	int workaround, port_a;
-	int current_link_up;
+	unsigned int current_link_up, port_a, workaround;
 
 	serdes_cfg = 0;
 	expected_sg_dig_ctrl = 0;
@@ -2194,7 +2197,7 @@ out:
 
 static int tg3_setup_fiber_by_hand(struct tg3 *tp, u32 mac_status)
 {
-	int current_link_up = 0;
+	unsigned int current_link_up = 0;
 
  	if (!(mac_status & MAC_STATUS_PCS_SYNCED)) {
 		tp->tg3_flags &= ~TG3_FLAG_GOT_SERDES_FLOWCTL;
@@ -2257,7 +2260,7 @@ static int tg3_setup_fiber_phy(struct tg
 	u8 orig_active_duplex;
 	u32 mac_status;
 	int current_link_up;
-	int i;
+	unsigned int i;
 
 	orig_pause_cfg =
 		(tp->tg3_flags & (TG3_FLAG_RX_PAUSE |
@@ -2533,7 +2536,7 @@ static void tg3_recycle_rx(struct tg3 *t
 {
 	struct tg3_rx_buffer_desc *src_desc, *dest_desc;
 	struct ring_info *src_map, *dest_map;
-	int dest_idx;
+	unsigned int dest_idx;
 
 	switch (opaque_key) {
 	case RXD_OPAQUE_RING_STD:
@@ -2601,7 +2604,7 @@ static int tg3_rx(struct tg3 *tp, int bu
 	u32 work_mask;
 	u32 rx_rcb_ptr = tp->rx_rcb_ptr;
 	u16 hw_idx, sw_idx;
-	int received;
+	unsigned int received;
 
 	hw_idx = tp->hw_status->idx[0].rx_producer;
 	/*
@@ -2739,7 +2742,7 @@ static int tg3_poll(struct net_device *n
 	struct tg3 *tp = netdev_priv(netdev);
 	struct tg3_hw_status *sblk = tp->hw_status;
 	unsigned long flags;
-	int done;
+	unsigned int done;
 
 	spin_lock_irqsave(&tp->lock, flags);
 
@@ -2962,7 +2965,7 @@ static void tg3_set_txd(struct tg3 *tp, 
 			u32 mss_and_is_end)
 {
 	struct tg3_tx_buffer_desc *txd = &tp->tx_ring[entry];
-	int is_end = (mss_and_is_end & 0x1);
+	unsigned int is_end = (mss_and_is_end & 0x1);
 	u32 mss = (mss_and_is_end >> 1);
 	u32 vlan_tag = 0;
 
@@ -3238,7 +3241,7 @@ static int tg3_change_mtu(struct net_dev
 static void tg3_free_rings(struct tg3 *tp)
 {
 	struct ring_info *rxp;
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < TG3_RX_RING_SIZE; i++) {
 		rxp = &tp->rx_std_buffers[i];
@@ -3528,7 +3531,8 @@ static int tg3_stop_block(struct tg3 *tp
 /* tp->lock is held. */
 static int tg3_abort_hw(struct tg3 *tp)
 {
-	int i, err;
+	int err;
+	unsigned int i;
 
 	tg3_disable_ints(tp);
 
@@ -3597,7 +3601,7 @@ out:
 static int tg3_nvram_lock(struct tg3 *tp)
 {
 	if (tp->tg3_flags & TG3_FLAG_NVRAM) {
-		int i;
+		unsigned int i;
 
 		tw32(NVRAM_SWARB, SWARB_REQ_SET1);
 		for (i = 0; i < 8000; i++) {
@@ -3701,7 +3705,7 @@ static int tg3_chip_reset(struct tg3 *tp
 {
 	u32 val;
 	u32 flags_save;
-	int i;
+	unsigned int i;
 
 	if (!(tp->tg3_flags2 & TG3_FLG2_SUN_570X))
 		tg3_nvram_lock(tp);
@@ -3763,7 +3767,7 @@ static int tg3_chip_reset(struct tg3 *tp
 
 	if (tp->tg3_flags2 & TG3_FLG2_PCI_EXPRESS) {
 		if (tp->pci_chip_rev_id == CHIPREV_ID_5750_A0) {
-			int i;
+			unsigned int i;
 			u32 cfg_val;
 
 			/* Wait for link training to complete.  */
@@ -3871,7 +3875,7 @@ static void tg3_stop_fw(struct tg3 *tp)
 {
 	if (tp->tg3_flags & TG3_FLAG_ENABLE_ASF) {
 		u32 val;
-		int i;
+		unsigned int i;
 
 		tg3_write_mem(tp, NIC_SRAM_FW_CMD_MBOX, FWCMD_NICDRV_PAUSE_FW);
 		val = tr32(GRC_RX_CPU_EVENT);
@@ -4040,7 +4044,7 @@ u32 tg3FwData[(TG3_FW_DATA_LEN / sizeof(
 /* tp->lock is held. */
 static int tg3_halt_cpu(struct tg3 *tp, u32 offset)
 {
-	int i;
+	unsigned int i;
 
 	if (offset == TX_CPU_BASE &&
 	    GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5705)
@@ -4152,7 +4156,8 @@ out:
 static int tg3_load_5701_a0_firmware_fix(struct tg3 *tp)
 {
 	struct fw_info info;
-	int err, i;
+	int err;
+	unsigned int i;
 
 	info.text_base = TG3_FW_TEXT_ADDR;
 	info.text_len = TG3_FW_TEXT_LEN;
@@ -4711,7 +4716,8 @@ static int tg3_load_tso_firmware(struct 
 {
 	struct fw_info info;
 	unsigned long cpu_base, cpu_scratch_base, cpu_scratch_size;
-	int err, i;
+	int err;
+	unsigned int i;
 
 	if (GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5750)
 		return 0;
@@ -4784,7 +4790,7 @@ static int tg3_load_tso_firmware(struct 
 static void __tg3_set_mac_addr(struct tg3 *tp)
 {
 	u32 addr_high, addr_low;
-	int i;
+	unsigned int i;
 
 	addr_high = ((tp->dev->dev_addr[0] << 8) |
 		     tp->dev->dev_addr[1]);
@@ -4857,7 +4863,8 @@ static void __tg3_set_rx_mode(struct net
 static int tg3_reset_hw(struct tg3 *tp)
 {
 	u32 val, rdmac_mode;
-	int i, err, limit;
+	int err, limit;
+	unsigned int i;
 
 	tg3_disable_ints(tp);
 
@@ -6136,7 +6143,7 @@ static inline u32 calc_crc(unsigned char
 {
 	u32 reg;
 	u32 tmp;
-	int j, k;
+	unsigned int j, k;
 
 	reg = 0xffffffff;
 
@@ -6802,7 +6809,7 @@ static struct ethtool_ops tg3_ethtool_op
 /* Chips other than 5700/5701 use the NVRAM for fetching info. */
 static void __devinit tg3_nvram_init(struct tg3 *tp)
 {
-	int j;
+	unsigned int j;
 
 	if (tp->tg3_flags2 & TG3_FLG2_SUN_570X)
 		return;
@@ -6856,7 +6863,7 @@ static int tg3_nvram_read_using_eeprom(s
 					u32 offset, u32 *val)
 {
 	u32 tmp;
-	int i;
+	unsigned int i;
 
 	if (offset > EEPROM_ADDR_ADDR_MASK ||
 	    (offset % 4) != 0)
@@ -6889,7 +6896,7 @@ static int tg3_nvram_read_using_eeprom(s
 static int __devinit tg3_nvram_read(struct tg3 *tp,
 				    u32 offset, u32 *val)
 {
-	int i;
+	unsigned int i;
 
 	if (tp->tg3_flags2 & TG3_FLG2_SUN_570X) {
 		printk(KERN_ERR PFX "Attempt to do nvram_read on Sun 570X\n");
@@ -6989,7 +6996,7 @@ static struct subsys_tbl_ent subsys_id_t
 
 static inline struct subsys_tbl_ent *lookup_by_subsys(struct tg3 *tp)
 {
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(subsys_id_to_phy_id); i++) {
 		if ((subsys_id_to_phy_id[i].subsys_vendor ==
@@ -7225,7 +7232,7 @@ skip_phy_reset:
 static void __devinit tg3_read_partno(struct tg3 *tp)
 {
 	unsigned char vpd_data[256];
-	int i;
+	unsigned int i;
 
 	if (tp->tg3_flags2 & TG3_FLG2_SUN_570X) {
 		/* Sun decided not to put the necessary bits in the
@@ -7765,7 +7772,8 @@ static int __devinit tg3_do_test_dma(str
 {
 	struct tg3_internal_buffer_desc test_desc;
 	u32 sram_dma_descs;
-	int i, ret;
+	int ret;
+	unsigned int i;
 
 	sram_dma_descs = NIC_SRAM_DMA_DESC_POOL_BASE;
 
@@ -8106,7 +8114,8 @@ static int __devinit tg3_init_one(struct
 	unsigned long tg3reg_base, tg3reg_len;
 	struct net_device *dev;
 	struct tg3 *tp;
-	int i, err, pci_using_dac, pm_cap;
+	int err, pm_cap;
+	unsigned int i, pci_using_dac;
 
 	if (tg3_version_printed++ == 0)
 		printk(KERN_INFO "%s", version);

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--UugvWAfsgieZRqgk--
