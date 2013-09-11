From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 11 Sep 2013 17:02:47 +0000
Subject: build regressions 2013-09-11
Message-Id: <5230a237.guHOK/KND6LoACHs%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/soc/omap/omap-mcpdm.c:46:28: fatal error: aess/omap-aess.h: No such file or directory
sound/soc/omap/omap-abe-twl6040.c:48:28: fatal error: aess/omap-aess.h: No such file or directory
sound/soc/soc-fw.c:986:8: error: 'struct snd_soc_dapm_widget' has no member named 'invert'
ERROR: "nouveau_switcheroo_optimus_dsm" undefined!
ERROR: "nouveau_switcheroo_optimus_dsm" undefined!
drivers/regulator/max8660.c:468:5: error: label 'err_out' used but not defined

[warnings]
Warning(drivers/gpu/drm/drm_edid.c:1061): No description found for parameter 'data'
sound/soc/soc-dapm.c:3724:2: warning: passing argument 1 of 'dapm_power_widgets' from incompatible pointer type [enabled by default]
sound/soc/soc-fw.c:1099:2: warning: passing argument 1 of 'snd_soc_dapm_new_widgets' from incompatible pointer type [enabled by default]
arch/x86/boot/compressed/aslr.c:101:4: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
arch/x86/boot/compressed/aslr.c:102:4: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
arch/x86/boot/compressed/aslr.c:103:4: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
arch/x86/boot/compressed/aslr.c:122:2: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
arch/x86/boot/compressed/aslr.c:123:2: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
arch/x86/boot/compressed/aslr.c:133:2: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
arch/x86/boot/compressed/aslr.c:142:2: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
arch/x86/boot/compressed/aslr.c:146:2: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
arch/x86/boot/compressed/aslr.c:151:2: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
arch/x86/boot/compressed/aslr.c:156:2: warning: passing argument 1 of 'debug_putptr' makes pointer from integer without a cast [enabled by default]
drivers/md/dm-integrity.c:372:1: warning: 'dm_int_calc_hmac' uses dynamic stack allocation [enabled by default]
drivers/md/dm-integrity.c:446:1: warning: 'dm_int_verify_io' uses dynamic stack allocation [enabled by default]
include/linux/dynamic_debug.h:64:16: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:299:5: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:721:5: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:721:5: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 9 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:741:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:741:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:748:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:748:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:768:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:795:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'sector_t' [-Wformat=]
drivers/md/dm-integrity.c:795:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'sector_t' [-Wformat=]

[sparse]
fs/xfs/xfs_buf_item.c:631:53: sparse: context imbalance in 'xfs_buf_item_unlock' - unexpected unlock
drivers/target/iscsi/iscsi_target_tq.c:141:6: sparse: symbol 'iscsi_deallocate_thread_one' was not declared. Should it be static?
drivers/scsi/megaraid/megaraid_sas_base.c:3173:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] flags @@    got  short [unsigned] [usertype] flags @@
drivers/scsi/megaraid/megaraid_sas_base.c:3176:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] data_xfer_len @@    got ed int [unsigned] [usertype] data_xfer_len @@
drivers/scsi/megaraid/megaraid_sas_base.c:3177:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] opcode @@    got ed int [unsigned] [usertype] opcode @@
drivers/scsi/megaraid/megaraid_sas_base.c:3178:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] phys_addr @@    got ed int [unsigned] [usertype] phys_addr @@
drivers/scsi/megaraid/megaraid_sas_base.c:3179:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/megaraid/megaraid_sas_base.c:3194:15: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:3200:47: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:3203:33: sparse: cast to restricted __le16
drivers/scsi/megaraid/megaraid_sas_base.c:3350:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] flags @@    got  short [unsigned] [usertype] flags @@
drivers/scsi/megaraid/megaraid_sas_base.c:3352:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] data_xfer_len @@    got ed int [unsigned] [usertype] data_xfer_len @@
drivers/scsi/megaraid/megaraid_sas_base.c:3353:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] opcode @@    got ed int [unsigned] [usertype] opcode @@
drivers/scsi/megaraid/megaraid_sas_base.c:3354:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] phys_addr @@    got ed int [unsigned] [usertype] phys_addr @@
drivers/scsi/megaraid/megaraid_sas_base.c:3355:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/megaraid/megaraid_sas_base.c:3365:23: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:3489:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] reply_queue_entries @@    got ed int [unsigned] [usertype] reply_queue_entries @@
drivers/scsi/megaraid/megaraid_sas_base.c:3490:52: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] reply_queue_start_phys_addr_lo @@    got ed int [unsigned] [usertype] reply_queue_start_phys_addr_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:3492:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] producer_index_phys_addr_lo @@    got ed int [unsigned] [usertype] producer_index_phys_addr_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:3493:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] consumer_index_phys_addr_lo @@    got ed int [unsigned] [usertype] consumer_index_phys_addr_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:3497:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] queue_info_new_phys_addr_lo @@    got ed int [unsigned] [usertype] queue_info_new_phys_addr_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:3499:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] queue_info_new_phys_addr_hi @@    got ed int [unsigned] [usertype] queue_info_new_phys_addr_hi @@
drivers/scsi/megaraid/megaraid_sas_base.c:3502:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] data_xfer_len @@    got ed int [unsigned] [usertype] data_xfer_len @@
drivers/scsi/megaraid/megaraid_sas_base.c:3988:43: sparse: cast to restricted __le16
drivers/scsi/megaraid/megaraid_sas_base.c:4001:24: sparse: cast to restricted __le16
drivers/scsi/megaraid/megaraid_sas_base.c:4009:52: sparse: cast to restricted __le16
drivers/scsi/megaraid/megaraid_sas_base.c:4044:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] flags @@    got  short [unsigned] [usertype] flags @@
drivers/scsi/megaraid/megaraid_sas_base.c:4047:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] data_xfer_len @@    got ed int [unsigned] [usertype] data_xfer_len @@
drivers/scsi/megaraid/megaraid_sas_base.c:4048:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] opcode @@    got ed int [unsigned] [usertype] opcode @@
drivers/scsi/megaraid/megaraid_sas_base.c:4049:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] <noident> @@    got restrunsigned int [unsigned] <noident> @@
drivers/scsi/megaraid/megaraid_sas_base.c:4051:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] <noident> @@    got restrunsigned int [unsigned] <noident> @@
drivers/scsi/megaraid/megaraid_sas_base.c:4052:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] phys_addr @@    got ed int [unsigned] [usertype] phys_addr @@
drivers/scsi/megaraid/megaraid_sas_base.c:4053:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/megaraid/megaraid_sas_base.c:1702:20: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:1703:20: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:1706:27: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:1723:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/scsi/megaraid/megaraid_sas_base.c:381:14: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:884:26: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_base.c:948:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] flags @@    got  short [unsigned] [usertype] flags @@
drivers/scsi/megaraid/megaraid_sas_base.c:949:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] abort_context @@    got ed int [unsigned] [usertype] abort_context @@
drivers/scsi/megaraid/megaraid_sas_base.c:950:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] abort_mfi_phys_addr_lo @@    got ed int [unsigned] [usertype] abort_mfi_phys_addr_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:952:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] abort_mfi_phys_addr_hi @@    got ed int [unsigned] [usertype] abort_mfi_phys_addr_hi @@
drivers/scsi/megaraid/megaraid_sas_base.c:992:50: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/megaraid/megaraid_sas_base.c:993:53: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] phys_addr @@    got ed int [unsigned] [usertype] phys_addr @@
drivers/scsi/megaraid/megaraid_sas_base.c:1021:50: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/megaraid/megaraid_sas_base.c:1022:53: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] phys_addr @@    got g long [unsigned] [usertype] phys_addr @@
drivers/scsi/megaraid/megaraid_sas_base.c:1049:55: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/megaraid/megaraid_sas_base.c:1051:58: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] phys_addr @@    got g long [unsigned] [usertype] phys_addr @@
drivers/scsi/megaraid/megaraid_sas_base.c:1053:53: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] flag @@    got ed int [unsigned] [usertype] flag @@
drivers/scsi/megaraid/megaraid_sas_base.c:1162:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] flags @@    got  short [unsigned] [usertype] flags @@
drivers/scsi/megaraid/megaraid_sas_base.c:1163:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] data_xfer_len @@    got ed int [unsigned] [usertype] data_xfer_len @@
drivers/scsi/megaraid/megaraid_sas_base.c:1175:40: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] timeout @@    got  short [unsigned] [usertype] timeout @@
drivers/scsi/megaraid/megaraid_sas_base.c:1182:30: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_base.c:1186:30: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_base.c:1203:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sense_buf_phys_addr_hi @@    got ed int [unsigned] [usertype] sense_buf_phys_addr_hi @@
drivers/scsi/megaraid/megaraid_sas_base.c:1205:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sense_buf_phys_addr_lo @@    got ed int [unsigned] [usertype] sense_buf_phys_addr_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:1257:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] flags @@    got  short [unsigned] [usertype] flags @@
drivers/scsi/megaraid/megaraid_sas_base.c:1265:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] lba_count @@    got ed int [unsigned] [usertype] lba_count @@
drivers/scsi/megaraid/megaraid_sas_base.c:1266:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] start_lba_lo @@    got ed int [unsigned] [usertype] start_lba_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:1270:36: sparse: invalid assignment: &drivers/scsi/megaraid/megaraid_sas_base.c:1277:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] lba_count @@    got ed int [unsigned] [usertype] lba_count @@
drivers/scsi/megaraid/megaraid_sas_base.c:1279:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] start_lba_lo @@    got ed int [unsigned] [usertype] start_lba_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:1289:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] lba_count @@    got ed int [unsigned] [usertype] lba_count @@
drivers/scsi/megaraid/megaraid_sas_base.c:1294:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] start_lba_lo @@    got ed int [unsigned] [usertype] start_lba_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:1304:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] lba_count @@    got ed int [unsigned] [usertype] lba_count @@
drivers/scsi/megaraid/megaraid_sas_base.c:1309:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] start_lba_lo @@    got ed int [unsigned] [usertype] start_lba_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:1314:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] start_lba_hi @@    got ed int [unsigned] [usertype] start_lba_hi @@
drivers/scsi/megaraid/megaraid_sas_base.c:1325:29: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_base.c:1329:29: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_base.c:1345:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sense_buf_phys_addr_lo @@    got ed int [unsigned] [usertype] sense_buf_phys_addr_lo @@
drivers/scsi/megaraid/megaraid_sas_base.c:1744:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/scsi/megaraid/megaraid_sas_base.c:1419:25: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:1419:58: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:1420:25: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:1429:53: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:1430:25: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_base.c:1436:41: sparse: too many warnings
drivers/scsi/megaraid/megaraid_sas_fusion.c:618:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] MsgVersion @@    got  short [unsigned] [usertype] MsgVersion @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:619:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] HeaderVersion @@    got  short [unsigned] [usertype] HeaderVersion @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:620:48: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] SystemRequestFrameSize @@    got  short [unsigned] [usertype] SystemRequestFrameSize @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:622:55: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] ReplyDescriptorPostQueueDepth @@    got  short [unsigned] [usertype] ReplyDescriptorPostQueueDepth @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:623:57: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] ReplyDescriptorPostQueueAddress @@    got g long [unsigned] [usertype] ReplyDescriptorPostQueueAddress @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:624:55: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] SystemRequestFrameBaseAddress @@    got g long [unsigned] [usertype] SystemRequestFrameBaseAddress @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:631:26: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_fusion.c:647:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] queue_info_new_phys_addr_lo @@    got ed int [unsigned] [usertype] queue_info_new_phys_addr_lo @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:648:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] data_xfer_len @@    got ed int [unsigned] [usertype] data_xfer_len @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:658:25: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_fusion.c:749:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] flags @@    got  short [unsigned] [usertype] flags @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:752:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] data_xfer_len @@    got ed int [unsigned] [usertype] data_xfer_len @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:753:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] opcode @@    got ed int [unsigned] [usertype] opcode @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:754:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] phys_addr @@    got ed int [unsigned] [usertype] phys_addr @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:755:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:824:19: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fusion.c:852:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] flags @@    got  short [unsigned] [usertype] flags @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:855:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] data_xfer_len @@    got ed int [unsigned] [usertype] data_xfer_len @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:858:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] opcode @@    got ed int [unsigned] [usertype] opcode @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:859:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] phys_addr @@    got ed int [unsigned] [usertype] phys_addr @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:860:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1063:16: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fusion.c:1064:16: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fusion.c:1152:33: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Length @@    got ed int [unsigned] [usertype] Length @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1153:34: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] Address @@    got g long [unsigned] [usertype] Address @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1172:38: sparse: cast to restricted __le16
drivers/scsi/megaraid/megaraid_sas_fusion.c:1196:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Length @@    got ed int [unsigned] [usertype] Length @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1197:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] Address @@    got g long [unsigned] [usertype] Address @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1255:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] IoFlags @@    got  short [unsigned] [usertype] IoFlags @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1265:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] EEDPFlags @@    got  short [unsigned] [usertype] EEDPFlags @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1272:47: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] EEDPFlags @@    got  short [unsigned] [usertype] EEDPFlags @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1276:37: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_fusion.c:1277:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] EEDPBlockSize @@    got ed int [unsigned] [usertype] EEDPBlockSize @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1305:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] IoFlags @@    got  short [unsigned] [usertype] IoFlags @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1343:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] IoFlags @@    got  short [unsigned] [usertype] IoFlags @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1411:50: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] VirtualDiskTgtId @@    got  short [unsigned] [usertype] VirtualDiskTgtId @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1475:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] DataLength @@    got ed int [unsigned] [usertype] DataLength @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1515:45: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_fusion.c:1534:54: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] timeoutValue @@    got  short [unsigned] [usertype] timeoutValue @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1553:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] DevHandle @@    got  short [unsigned] [usertype] DevHandle @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1587:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] DataLength @@    got ed int [unsigned] [usertype] DataLength @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1647:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] VirtualDiskTgtId @@    got  short [unsigned] [usertype] VirtualDiskTgtId @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1676:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] DevHandle @@    got  short [unsigned] [usertype] DevHandle @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1681:50: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] VirtualDiskTgtId @@    got  short [unsigned] [usertype] VirtualDiskTgtId @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1721:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] IoFlags @@    got  short [unsigned] [usertype] IoFlags @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1746:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] SGLFlags @@    got  short [unsigned] [usertype] SGLFlags @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1749:37: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_fusion.c:1751:37: sparse: invalid assignment: |drivers/scsi/megaraid/megaraid_sas_fusion.c:1756:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] SenseBufferLowAddress @@    got ed int [unsigned] [usertype] SenseBufferLowAddress @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1821:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] SMID @@    got  short [unsigned] [usertype] SMID @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:1883:24: sparse: cast to restricted __le16
drivers/scsi/megaraid/megaraid_sas_fusion.c:2101:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] Address @@    got g long [unsigned] [usertype] Address @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:2106:34: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] Length @@    got ed int [unsigned] [usertype] Length @@
drivers/scsi/megaraid/megaraid_sas_fusion.c:2139:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] SMID @@    got  short [unsigned] [usertype] SMID @@
drivers/scsi/megaraid/megaraid_sas_fp.c:682:32: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:428:29: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:131:16: sparse: cast to restricted __le16
drivers/scsi/megaraid/megaraid_sas_fp.c:136:16: sparse: cast to restricted __le16
drivers/scsi/megaraid/megaraid_sas_fp.c:151:16: sparse: cast to restricted __le16
drivers/scsi/megaraid/megaraid_sas_fp.c:175:13: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:177:47: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:182:41: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:185:25: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:194:19: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:216:33: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:219:29: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:221:29: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:222:33: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:222:80: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:223:33: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:226:67: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:226:97: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:229:54: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:361:29: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:366:37: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:368:37: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:369:48: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:370:59: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:371:49: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:375:61: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:376:53: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:377:62: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:493:29: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:497:37: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:498:48: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:499:59: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:500:41: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:503:59: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:504:57: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:556:29: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:778:32: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:978:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] timeoutValue @@    got  short [unsigned] [usertype] timeoutValue @@
drivers/scsi/megaraid/megaraid_sas_fp.c:987:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] regLockRowLBA @@    got g long [unsigned] [usertype] regLockRowLBA @@
drivers/scsi/megaraid/megaraid_sas_fp.c:988:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] regLockLength @@    got ed int [unsigned] [usertype] regLockLength @@
drivers/scsi/megaraid/megaraid_sas_fp.c:1063:37: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:1072:50: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:1076:45: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:1093:60: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:1094:41: sparse: cast to restricted __le64
drivers/scsi/megaraid/megaraid_sas_fp.c:1094:72: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:1095:41: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:1112:61: sparse: cast to restricted __le32
drivers/scsi/megaraid/megaraid_sas_fp.c:1138:61: sparse: cast to restricted __le32
drivers/md/dm-integrity.c:357:47: sparse: Variable length array is used.
drivers/md/dm-integrity.c:381:20: sparse: Variable length array is used.
drivers/md/dm-integrity.c:382:42: sparse: Variable length array is used.
drivers/md/dm-integrity.c:416:60: sparse: cannot size expression
sound/soc/soc-dapm.c:3724:32: sparse: incorrect type in argument 1 (different base types) @@    expected struct snd_soc_card *card @@    got struct sstruct snd_soc_card *card @@
sound/soc/soc-fw.c:988:15: sparse: no member 'invert' in struct snd_soc_dapm_widget

[coccinelle]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:11167:9-10: WARNING: return of 0/1 in function 'bnx2x_get_dropless_info' with return type bool
drivers/net/ethernet/intel/i40e/i40e_adminq.c:704:2-8: Replace memcpy with struct assignment
drivers/net/ethernet/intel/i40e/i40e_adminq.c:763:1-7: Replace memcpy with struct assignment
drivers/net/ethernet/intel/i40e/i40e_adminq.c:810:2-8: Replace memcpy with struct assignment
drivers/net/ethernet/intel/i40e/i40e_common.c:510:2-8: Replace memcpy with struct assignment
sound/soc/soc-fw.c:945:9-16: ERROR: se is NULL but dereferenced.
sound/soc/soc-fw.c:1521:8-9: ERROR: reference preceded by free on line 1521
sound/soc/soc-fw.c:1441:8-9: ERROR: reference preceded by free on line 1441
sound/soc/soc-fw.c:1481:8-9: ERROR: reference preceded by free on line 1481
sound/soc/soc-fw.c:1526:6-8: ERROR: invalid reference to the index variable of the iterator on line 1511
sound/soc/soc-fw.c:1446:6-8: ERROR: invalid reference to the index variable of the iterator on line 1431
sound/soc/soc-fw.c:1486:6-8: ERROR: invalid reference to the index variable of the iterator on line 1471

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
