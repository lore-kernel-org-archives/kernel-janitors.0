From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 23 Aug 2013 16:34:15 +0000
Subject: build regressions 2013-08-23
Message-Id: <52178f07.A3vrRmaUWuC6+0XM%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sdr-msi3101.c:(.text+0x16eafd7): undefined reference to `__umoddi3'
sdr-msi3101.c:(.text+0x16eaff7): undefined reference to `__udivdi3'
sdr-msi3101.c:(.text+0x16eb0ac): undefined reference to `__udivdi3'
fs/ntfs/mft.c:1693:1: internal compiler error: in reload, at reload1.c:1056
arch/microblaze/include/asm/uaccess.h:101:108: error: 'PFX' undeclared (first use in this function)
ERROR: "__umoddi3" undefined!

[warnings]
drivers/net/ethernet/intel/i40e/i40e_main.c:129:12: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:191:4: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:191:4: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:191:4: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:191:4: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:191:4: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:191:4: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:763:5: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:763:5: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:763:5: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:763:5: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:763:5: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:763:5: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:922:2: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:922:2: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:922:2: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:922:2: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:922:2: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:922:2: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_lan_hmc.c:407:5: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_lan_hmc.c:412:5: warning: right shift count >= width of type [enabled by default]

[sparse]
drivers/gpu/drm/radeon/atombios_i2c.c:61:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] lpI2CDataOut @@    got sable] [assigned] [usertype] lpI2CDataOut @@
drivers/gpu/drm/gma500/gma_display.c:410:25: sparse: incorrect type in assignment (different address spaces) @@    expected void *tmp_dst @@    got unsigned char [noderef] [usertype] <avoid *tmp_dst @@
drivers/net/ethernet/intel/i40e/i40e_main.c:5880:42: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_main.c:5886:37: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_main.c:5887:37: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_main.c:5899:42: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_main.c:5905:37: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_main.c:5907:42: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_main.c:474:33: sparse: incorrect type in initializer (different base types) @@    expected int [signed] stat_idx @@    got restricted __le1int [signed] stat_idx @@
drivers/net/ethernet/intel/i40e/i40e_main.c:1459:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] [usertype] flags @@    got d char [unsigned] [usertype] flags @@
drivers/net/ethernet/intel/i40e/i40e_main.c:1658:23: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_main.c:1662:34: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] valid_sections @@    got e] valid_sections @@
drivers/net/ethernet/intel/i40e/i40e_main.c:1685:23: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_main.c:1690:34: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] valid_sections @@    got e] valid_sections @@
drivers/net/ethernet/intel/i40e/i40e_main.c:1958:34: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] valid_sections @@    got e] valid_sections @@
drivers/net/ethernet/intel/i40e/i40e_main.c:1959:24: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] pvid @@    got unsignedrestricted __le16 [usertype] pvid @@
drivers/net/ethernet/intel/i40e/i40e_main.c:2100:24: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] rdylist @@    got igned] [usertype] rdylist @@
drivers/net/ethernet/intel/i40e/i40e_main.c:4425:51: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned short [unsigned] [usertype] vf_id @@    got restricted __le16unsigned short [unsigned] [usertype] vf_id @@
drivers/net/ethernet/intel/i40e/i40e_main.c:4426:51: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] v_opcode @@    got restricted __le32 [unsigned int [unsigned] [usertype] v_opcode @@
drivers/net/ethernet/intel/i40e/i40e_main.c:4427:51: sparse: incorrect type in argument 4 (different base types) @@    expected unsigned int [unsigned] [usertype] v_retval @@    got restricted __le32 [unsigned int [unsigned] [usertype] v_retval @@
drivers/net/ethernet/intel/i40e/i40e_main.c:6638:67: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_main.c:6645:50: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_main.c:6657:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] mac_seid @@    got  short [unsigned] [usertype] mac_seid @@
drivers/net/ethernet/intel/i40e/i40e_main.c:6661:58: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_main.c:6671:75: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_main.c:6684:60: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] seid @@    got  short [unsigned] [usertype] seid @@
drivers/net/ethernet/intel/i40e/i40e_main.c:6690:54: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_main.c:6695:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] mac_seid @@    got  short [unsigned] [usertype] mac_seid @@
drivers/net/ethernet/intel/i40e/i40e_main.c:6696:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] pf_seid @@    got  short [unsigned] [usertype] pf_seid @@
drivers/net/ethernet/intel/i40e/i40e_main.c:6697:51: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] main_vsi_seid @@    got  short [unsigned] [usertype] main_vsi_seid @@
drivers/net/ethernet/intel/i40e/i40e_adminq.c:697:43: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] cookie_high @@    got unsignrestricted __le32 [usertype] cookie_high @@
drivers/net/ethernet/intel/i40e/i40e_adminq.c:698:42: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] cookie_low @@    got unsignrestricted __le32 [usertype] cookie_low @@
drivers/net/ethernet/intel/i40e/i40e_adminq.c:707:21: sparse: invalid assignment: &drivers/net/ethernet/intel/i40e/i40e_adminq.c:708:21: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_common.c:110:40: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_common.c:465:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] command_flags @@    got e] command_flags @@
drivers/net/ethernet/intel/i40e/i40e_common.c:467:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] command_flags @@    got e] command_flags @@
drivers/net/ethernet/intel/i40e/i40e_common.c:468:31: sparse: cast from restricted __le16
drivers/net/ethernet/intel/i40e/i40e_common.c:893:32: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_common.c:895:32: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_common.c:897:32: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_common.c:898:26: sparse: cast from restricted __le16
drivers/net/ethernet/intel/i40e/i40e_common.c:1074:28: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] num_addresses @@    got unsignerestricted __le16 [usertype] num_addresses @@
drivers/net/ethernet/intel/i40e/i40e_common.c:1114:28: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] num_addresses @@    got unsignerestricted __le16 [usertype] num_addresses @@
drivers/net/ethernet/intel/i40e/i40e_common.c:1150:26: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [addressable] [usertype] cookie_high @@    got ed __le32 [addressable] [usertype] cookie_high @@
drivers/net/ethernet/intel/i40e/i40e_common.c:1151:25: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [addressable] [usertype] cookie_low @@    got ed __le32 [addressable] [usertype] cookie_low @@
drivers/net/ethernet/intel/i40e/i40e_common.c:1221:35: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] resource_number @@    got restricted __le32 [usertype] resource_number @@
drivers/net/ethernet/intel/i40e/i40e_common.c:1259:30: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] resource_number @@    got unsignerestricted __le32 [usertype] resource_number @@
drivers/net/ethernet/intel/i40e/i40e_common.c:1408:32: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_lan_hmc.c:799:34: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [assigned] [usertype] bitfield @@    got igned] [assigned] [usertype] bitfield @@
drivers/net/ethernet/intel/i40e/i40e_lan_hmc.c:802:34: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [assigned] [usertype] bitfield @@    got igned] [assigned] [usertype] bitfield @@
drivers/net/ethernet/intel/i40e/i40e_lan_hmc.c:805:34: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [assigned] [usertype] bitfield @@    got igned] [assigned] [usertype] bitfield @@
drivers/net/ethernet/intel/i40e/i40e_txrx.c:347:31: sparse: restricted __le64 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_txrx.c:348:23: sparse: restricted __le32 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_txrx.c:363:54: sparse: invalid assignment: &drivers/net/ethernet/intel/i40e/i40e_txrx.c:876:22: sparse: cast to restricted __le32
drivers/net/ethernet/intel/i40e/i40e_txrx.c:876:22: sparse: cast from restricted __le64
drivers/net/ethernet/intel/i40e/i40e_txrx.c:1187:42: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] qindex_flex_ptype_vsi @@    got 2 [usertype] qindex_flex_ptype_vsi @@
drivers/net/ethernet/intel/i40e/i40e_txrx.c:1191:50: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_txrx.c:1195:50: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_txrx.c:1200:42: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_txrx.c:1203:39: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [usertype] dtype_cmd_cntindex @@    got e] dtype_cmd_cntindex @@
drivers/net/ethernet/intel/i40e/i40e_txrx.c:1206:47: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_txrx.c:1210:47: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_txrx.c:1214:39: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_txrx.c:1218:39: sparse: invalid assignment: |drivers/net/ethernet/intel/i40e/i40e_txrx.c:1502:30: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] l2tag2 @@    got restricted __le16 [usertype] l2tag2 @@
drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:93:22: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:94:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] pf_queue_id @@    got igned] [usertype] pf_queue_id @@
drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:96:54: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:365:24: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [assigned] [usertype] rdylist @@    got igned] [usertype] rdylist @@
drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:2331:56: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:2430:30: sparse: restricted __le16 degrades to integer
drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:2431:30: sparse: restricted __le16 degrades to integer
drivers/gpu/drm/gma500/psb_intel_display.c:450:30: sparse: symbol 'psb_clock_funcs' was not declared. Should it be static?

[coccinelle]
drivers/gpu/drm/drm_prime.c:373:1-7: preceding lock on line 334
drivers/gpu/drm/drm_prime.c:480:1-11: second lock on line 517

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
