From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 27 Aug 2013 16:57:35 +0000
Subject: build regressions 2013-08-27
Message-Id: <521cda7f.YLkco5RrdjwZ9rtY%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/of/of_reserved_mem.c:49:9: error: implicit declaration of function 'of_flat_dt_is_compatible' [-Werror=implicit-function-declaration]
drivers/of/of_reserved_mem.c:57:2: error: implicit declaration of function 'of_get_flat_dt_prop' [-Werror=implicit-function-declaration]
drivers/of/of_reserved_mem.c:64:23: error: 'dt_root_size_cells' undeclared (first use in this function)
drivers/of/of_reserved_mem.c:64:44: error: 'dt_root_addr_cells' undeclared (first use in this function)
drivers/of/of_reserved_mem.c:71:2: error: implicit declaration of function 'dt_mem_next_cell' [-Werror=implicit-function-declaration]
drivers/of/of_reserved_mem.c:173:2: error: implicit declaration of function 'of_scan_flat_dt_by_path' [-Werror=implicit-function-declaration]
drivers/base/core.c:496:2: error: implicit declaration of function 'sysfs_create_groups' [-Werror=implicit-function-declaration]
drivers/base/core.c:502:2: error: implicit declaration of function 'sysfs_remove_groups' [-Werror=implicit-function-declaration]
drivers/base/bus.c:887:2: error: implicit declaration of function 'sysfs_create_groups' [-Werror=implicit-function-declaration]
drivers/base/bus.c:893:2: error: implicit declaration of function 'sysfs_remove_groups' [-Werror=implicit-function-declaration]
drivers/base/driver.c:129:2: error: implicit declaration of function 'sysfs_create_groups' [-Werror=implicit-function-declaration]
drivers/base/driver.c:135:2: error: implicit declaration of function 'sysfs_remove_groups' [-Werror=implicit-function-declaration]
fs/f2fs/namei.c:450:31: error: expected ';' before ':' token
kernel/capability.c:280:2: error: too few arguments to function 'audit_log_capset'
xfs_trace.c:(.text+0x1a1480): undefined reference to `from_kqid'
xfs_trace.c:(.text+0x1a15ca): undefined reference to `from_kqid'

[warnings]
drivers/net/wireless/ath/ath9k/ar9003_eeprom.c:3618: warning: 'regval' is used uninitialized in this function
Warning(include/linux/fence.h:99): Excess struct/union/enum/typedef member 'priv' description in 'fence_cb'
drivers/scsi/ufs/ufshcd.c:2687:3: warning: 'flush_work_sync' is deprecated (declared at include/linux/workqueue.h:619) [-Wdeprecated-declarations]
drivers/scsi/arcmsr/arcmsr_hba.c:1602:2: warning: 'flush_work_sync' is deprecated (declared at include/linux/workqueue.h:619) [-Wdeprecated-declarations]
drivers/scsi/arcmsr/arcmsr_hba.c:1664:2: warning: 'flush_work_sync' is deprecated (declared at include/linux/workqueue.h:619) [-Wdeprecated-declarations]
kernel/cgroup.c:5741:3: warning: passing argument 2 of 'cgroup_css' makes pointer from integer without a cast [enabled by default]
drivers/of/of_reserved_mem.c:57:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/of/of_reserved_mem.c:63:7: warning: assignment makes pointer from integer without a cast [enabled by default]
sound/soc/codecs/lm4857.c:197:2: warning: passing argument 1 of 'snd_soc_dapm_new_widgets' from incompatible pointer type [enabled by default]
kernel/capability.c:280:2: warning: passing argument 1 of 'audit_log_capset' makes integer from pointer without a cast [enabled by default]

[sparse]
kernel/cgroup.c:5741:43: sparse: incorrect type in argument 2 (different base types) @@    expected struct cgroup_subsys *ss @@    got roup_subsys *ss @@
drivers/scsi/esas2r/esas2r_disc.c:1180:59: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1260:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] handle @@    got ed int [unsigned] [usertype] handle @@
drivers/scsi/esas2r/esas2r.h:1278:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] ppsense_buf @@    got g long [unsigned] [usertype] ppsense_buf @@
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1260:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] handle @@    got ed int [unsigned] [usertype] handle @@
drivers/scsi/esas2r/esas2r.h:1278:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] ppsense_buf @@    got g long [unsigned] [usertype] ppsense_buf @@
drivers/scsi/esas2r/esas2r_disc.c:765:36: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1260:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] handle @@    got ed int [unsigned] [usertype] handle @@
drivers/scsi/esas2r/esas2r.h:1278:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] ppsense_buf @@    got g long [unsigned] [usertype] ppsense_buf @@
drivers/scsi/esas2r/esas2r_disc.c:849:30: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_disc.c:851:36: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_disc.c:853:21: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_disc.c:855:33: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1260:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] handle @@    got ed int [unsigned] [usertype] handle @@
drivers/scsi/esas2r/esas2r.h:1278:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] ppsense_buf @@    got g long [unsigned] [usertype] ppsense_buf @@
drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_disc.c:932:43: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_disc.c:962:27: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1260:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] handle @@    got ed int [unsigned] [usertype] handle @@
drivers/scsi/esas2r/esas2r.h:1278:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] ppsense_buf @@    got g long [unsigned] [usertype] ppsense_buf @@
drivers/scsi/esas2r/esas2r_disc.c:660:42: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_disc.c:661:42: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_flash.c:252:47: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:253:23: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] device_id @@    got  short [unsigned] [usertype] device_id @@
drivers/scsi/esas2r/esas2r_flash.c:258:37: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:261:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/scsi/esas2r/esas2r_flash.c:288:52: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:290:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] device_id @@    got  short [unsigned] [usertype] device_id @@
drivers/scsi/esas2r/esas2r_flash.c:291:32: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:603:24: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:604:24: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:613:38: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_flash.c:633:25: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:636:30: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:650:16: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:676:33: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:895:19: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_flash.c:900:32: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_flash.c:1050:24: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:1052:24: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:1061:40: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_flash.c:1119:52: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:1121:38: sparse: restricted __le16 degrades to integer
drivers/scsi/esas2r/esas2r_flash.c:1137:33: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:1161:40: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_flash.c:1302:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_flash.c:1305:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_flash.c:1308:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ctl_len @@    got ed int [unsigned] [usertype] ctl_len @@
drivers/scsi/esas2r/esas2r_flash.c:1310:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_init.c:697:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] device_state @@    got [unsigned] [usertype] device_state @@
drivers/scsi/esas2r/esas2r_init.c:706:35: sparse: incorrect type in argument 2 (different base types) @@    expected restricted pci_power_t [usertype] state @@    got urestricted pci_power_t [usertype] state @@
drivers/scsi/esas2r/esas2r_init.c:981:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1260:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] handle @@    got ed int [unsigned] [usertype] handle @@
drivers/scsi/esas2r/esas2r.h:1278:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] ppsense_buf @@    got g long [unsigned] [usertype] ppsense_buf @@
drivers/scsi/esas2r/esas2r_init.c:1253:41: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_init.c:1269:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1269:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1269:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1269:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1269:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1269:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1270:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1270:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1270:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1270:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1270:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1270:25: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r_init.c:1281:56: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ctl_len @@    got ed int [unsigned] [usertype] ctl_len @@
drivers/scsi/esas2r/esas2r_init.c:1283:56: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_init.c:1296:41: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_init.c:1298:41: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1260:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] handle @@    got ed int [unsigned] [usertype] handle @@
drivers/scsi/esas2r/esas2r.h:1278:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] ppsense_buf @@    got g long [unsigned] [usertype] ppsense_buf @@
drivers/scsi/esas2r/esas2r_init.c:285:15: sparse: memset with byte count of 559632
drivers/scsi/esas2r/esas2r_int.c:221:22: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_int.c:751:22: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_io.c:65:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] target_id @@    got  short [unsigned] [usertype] target_id @@
drivers/scsi/esas2r/esas2r_io.c:166:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_io.c:167:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_io.c:256:51: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_io.c:258:52: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_io.c:268:60: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_io.c:308:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_io.c:309:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_io.c:327:35: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_io.c:334:44: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_io.c:417:60: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ctl_len @@    got ed int [unsigned] [usertype] ctl_len @@
drivers/scsi/esas2r/esas2r_io.c:419:60: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_io.c:438:61: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_io.c:468:53: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ctl_len @@    got ed int [unsigned] [usertype] ctl_len @@
drivers/scsi/esas2r/esas2r_io.c:469:53: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_io.c:486:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ctl_len @@    got ed int [unsigned] [usertype] ctl_len @@
drivers/scsi/esas2r/esas2r_io.c:487:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_io.c:513:53: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_io.c:772:22: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_io.c:791:30: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_io.c:810:32: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_io.c:812:32: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_io.c:824:38: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_ioctl.c:321:23: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_ioctl.c:322:23: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_ioctl.c:333:25: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_ioctl.c:334:29: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_ioctl.c:355:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ctrl_code @@    got ed int [unsigned] [usertype] ctrl_code @@
drivers/scsi/esas2r/esas2r_ioctl.c:356:31: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] target_id @@    got  short [unsigned] [usertype] target_id @@
drivers/scsi/esas2r/esas2r_ioctl.c:357:31: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_ioctl.c:419:57: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] csmi_status @@    got ed int [unsigned] [usertype] csmi_status @@
drivers/scsi/esas2r/esas2r_ioctl.c:425:29: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_ioctl.c:569:39: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_ioctl.c:600:49: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] csmi_status @@    got ed int [unsigned] [usertype] csmi_status @@
drivers/scsi/esas2r/esas2r_ioctl.c:632:21: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_ioctl.c:642:22: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_ioctl.c:697:17: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_ioctl.c:1018:37: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_ioctl.c:1020:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_ioctl.c:1035:45: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_ioctl.c:1037:45: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_ioctl.c:1046:45: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_ioctl.c:1049:45: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_ioctl.c:960:39: sparse: memset with byte count of 524288
drivers/scsi/esas2r/esas2r_vda.c:282:33: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_vda.c:290:41: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_vda.c:295:33: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_vda.c:306:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] data_length @@    got ed int [unsigned] [usertype] data_length @@
drivers/scsi/esas2r/esas2r_vda.c:309:33: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_vda.c:314:38: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_vda.c:315:38: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_vda.c:333:25: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_vda.c:112:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:126:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] cmd_rsp_len @@    got ed int [unsigned] [usertype] cmd_rsp_len @@
drivers/scsi/esas2r/esas2r_vda.c:128:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:169:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:172:59: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] payld_length @@    got ed int [unsigned] [usertype] payld_length @@
drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_vda.c:187:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:200:40: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] dev_index @@    got  short [unsigned] [usertype] dev_index @@
drivers/scsi/esas2r/esas2r_vda.c:221:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_vda.c:362:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:363:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] flash_addr @@    got ed int [unsigned] [usertype] flash_addr @@
drivers/scsi/esas2r/esas2r_vda.c:385:24: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] dev_index @@    got  short [unsigned] [usertype] dev_index @@
drivers/scsi/esas2r/esas2r_vda.c:386:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:393:44: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:394:45: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_vda.c:401:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ctl_len @@    got ed int [unsigned] [usertype] ctl_len @@
drivers/scsi/esas2r/esas2r_vda.c:402:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_vda.c:425:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:430:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:431:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_vda.c:437:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ctl_len @@    got ed int [unsigned] [usertype] ctl_len @@
drivers/scsi/esas2r/esas2r_vda.c:438:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/scsi/esas2r/esas2r_vda.c:456:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:457:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] cmd_rsp_len @@    got ed int [unsigned] [usertype] cmd_rsp_len @@
drivers/scsi/esas2r/esas2r_vda.c:473:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_vda.c:492:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_main.c:909:45: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_main.c:911:45: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_main.c:915:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] length @@    got ed int [unsigned] [usertype] length @@
drivers/scsi/esas2r/esas2r_main.c:917:29: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r.h:1322:13: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1008:56: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1008:53: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_main.c:1014:53: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_main.c:1203:29: sparse: invalid assignment: |drivers/scsi/esas2r/esas2r_main.c:1449:31: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1457:25: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1470:31: sparse: cast to restricted __le64
drivers/scsi/esas2r/esas2r_main.c:1471:33: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1472:36: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1473:32: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1474:26: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1475:31: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1498:31: sparse: cast to restricted __le64
drivers/scsi/esas2r/esas2r_main.c:1499:33: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1500:33: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1501:31: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1504:41: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1517:32: sparse: cast to restricted __le64
drivers/scsi/esas2r/esas2r_main.c:1518:32: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1519:33: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1520:32: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1527:37: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1528:35: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1536:45: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1556:38: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1557:37: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1558:35: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1559:34: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1560:36: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1561:43: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1577:30: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1582:30: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1583:38: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1584:43: sparse: cast to restricted __le16
drivers/scsi/esas2r/esas2r_main.c:1589:35: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r_main.c:1591:35: sparse: cast to restricted __le32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1259:18: sparse: cast to restricted __be32
drivers/scsi/esas2r/esas2r.h:1260:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] handle @@    got ed int [unsigned] [usertype] handle @@
drivers/scsi/esas2r/esas2r.h:1278:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] ppsense_buf @@    got g long [unsigned] [usertype] ppsense_buf @@
drivers/scsi/esas2r/esas2r_main.c:1653:40: sparse: cast to restricted __le32
drivers/scsi/arcmsr/arcmsr_attr.c:127:38: sparse: incorrect type in assignment (different address spaces) @@    expected unsigned char [noderef] [usertype] <asn:2>*vaddr @@    got sn:2>*vaddr @@
drivers/scsi/arcmsr/arcmsr_attr.c:129:40: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *to @@    got unsigned char [noderef] [usertype] <avoid *to @@
drivers/scsi/arcmsr/arcmsr_attr.c:129:46: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const *from @@    got unsigned char [noderef] [usertype] <asn:2>void const *from @@
drivers/scsi/arcmsr/arcmsr_attr.c:137:50: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const *from @@    got unsigned char [noderef] [usertype] <asn:2>void const *from @@
drivers/scsi/arcmsr/arcmsr_attr.c:140:59: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const *from @@    got unsigned char [noderef] [usertype] <asn:2>void const *from @@
drivers/scsi/arcmsr/arcmsr_attr.c:142:50: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const *from @@    got unsigned char [noderef] [usertype] <asn:2>void const *from @@
drivers/scsi/arcmsr/arcmsr_attr.c:145:31: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got unsigned char [noderef] [usertyvoid const *<noident> @@
drivers/scsi/arcmsr/arcmsr_hba.c:2953:46: sparse: incorrect type in assignment (different address spaces) @@    expected unsigned char [noderef] [usertype] <asn:2>*vaddr @@    got sn:2>*vaddr @@
drivers/scsi/arcmsr/arcmsr_hba.c:2959:48: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *to @@    got unsigned char [noderef] [usertype] <avoid *to @@
drivers/scsi/arcmsr/arcmsr_hba.c:2988:39: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got unsigned char [noderef] [usertyvoid const *<noident> @@
drivers/scsi/arcmsr/arcmsr_hba.c:1367:26: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_C [noderef] <asn:2>*reg @@    got t_C [noderef] <asn:2>*reg @@
drivers/scsi/arcmsr/arcmsr_hba.c:1377:26: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_D [noderef] <asn:2>*reg @@    got t_D [noderef] <asn:2>*reg @@
drivers/scsi/arcmsr/arcmsr_hba.c:443:46: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_D [noderef] <asn:2>*reg @@    got t_D [noderef] <asn:2>*reg @@
drivers/scsi/arcmsr/arcmsr_hba.c:521:18: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_D [noderef] <asn:2>*reg @@    got t_D [noderef] <asn:2>*reg @@
drivers/scsi/arcmsr/arcmsr_hba.c:1253:46: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_D [noderef] <asn:2>*reg @@    got t_D [noderef] <asn:2>*reg @@
drivers/scsi/arcmsr/arcmsr_hba.c:1856:48: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_D *pmu @@    got struct MessageUnistruct MessageUnit_D *pmu @@
drivers/scsi/arcmsr/arcmsr_hba.c:1931:18: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_D [noderef] <asn:2>*reg @@    got t_D [noderef] <asn:2>*reg @@
drivers/scsi/arcmsr/arcmsr_hba.c:2087:26: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_D [noderef] <asn:2>*reg @@    got t_D [noderef] <asn:2>*reg @@
drivers/scsi/arcmsr/arcmsr_hba.c:2119:18: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_D [noderef] <asn:2>*pmu @@    got t_D [noderef] <asn:2>*pmu @@
drivers/scsi/arcmsr/arcmsr_hba.c:2096:1: sparse: symbol 'arcmsr_get_iop_wqbuffer' was not declared. Should it be static?
drivers/scsi/arcmsr/arcmsr_hba.c:2145:38: sparse: incorrect type in assignment (different address spaces) @@    expected unsigned char [noderef] [usertype] <asn:2>*vaddr @@    got sn:2>*vaddr @@
drivers/scsi/arcmsr/arcmsr_hba.c:2151:40: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *to @@    got unsigned char [noderef] [usertype] <avoid *to @@
drivers/scsi/arcmsr/arcmsr_hba.c:2160:34: sparse: incorrect type in assignment (different address spaces) @@    expected unsigned char [noderef] [usertype] <asn:2>*pQbuffer @@    got rtype] <asn:2>*pQbuffer @@
drivers/scsi/arcmsr/arcmsr_hba.c:2164:40: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *to @@    got unsigned char [noderef] [usertype] <avoid *to @@
drivers/scsi/arcmsr/arcmsr_hba.c:2173:40: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *to @@    got unsigned char [noderef] [usertype] <avoid *to @@
drivers/scsi/arcmsr/arcmsr_hba.c:2177:31: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got unsigned char [noderef] [usertyvoid const *<noident> @@
drivers/scsi/arcmsr/arcmsr_hba.c:2128:1: sparse: symbol 'arcmsr_iop2drv_data_wrote_handle' was not declared. Should it be static?
drivers/scsi/arcmsr/arcmsr_hba.c:2189:1: sparse: symbol 'arcmsr_iop2drv_data_read_handle' was not declared. Should it be static?
drivers/scsi/arcmsr/arcmsr_hba.c:2343:18: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_C [noderef] <asn:2>*reg @@    got t_C [noderef] <asn:2>*reg @@
drivers/scsi/arcmsr/arcmsr_hba.c:2372:18: sparse: incorrect type in initializer (different address spaces) @@    expected struct MessageUnit_D [noderef] <asn:2>*pmu @@    got t_D [noderef] <asn:2>*pmu @@
drivers/scsi/arcmsr/arcmsr_hba.c:2449:16: sparse: incorrect type in assignment (different address spaces) @@    expected struct MessageUnit_C [noderef] <asn:2>*phbcmu @@    got t_C [noderef] <asn:2>*phbcmu @@
drivers/scsi/arcmsr/arcmsr_hba.c:2486:13: sparse: incorrect type in assignment (different address spaces) @@    expected struct MessageUnit_D [noderef] <asn:2>*pmu @@    got t_D [noderef] <asn:2>*pmu @@
drivers/scsi/arcmsr/arcmsr_hba.c:2529:41: sparse: too many warnings
drivers/target/target_core_xcopy.c:1058:18: sparse: incorrect type in initializer (different base types) @@    expected int [signed] rc @@    got restricted sense_reason_int [signed] rc @@
drivers/target/target_core_xcopy.c:1071:20: sparse: incorrect type in assignment (different base types) @@    expected int [signed] rc @@    got restricted sint [signed] rc @@
drivers/target/target_core_xcopy.c:1081:16: sparse: incorrect type in return expression (different base types) @@    expected restricted sense_reason_t @@    got ense_reason_t @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
net/802/garp.c:586:9: sparse: cast removes address space of expression
net/802/mrp.c:845:9: sparse: cast removes address space of expression
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
fs/afs/inode.c:448:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct afs_permits *volatile <noident> @@    got  afs_permits *volatile <noident> @@
fs/afs/security.c:117:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct afs_permits *volatile <noident> @@    got  afs_permits *volatile <noident> @@
fs/afs/security.c:202:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct afs_permits *volatile <noident> @@    got struct astruct afs_permits *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
include/linux/posix_acl.h:137:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct posix_acl *volatile <noident> @@    got struct pstruct posix_acl *volatile <noident> @@
fs/proc/inode.c:50:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct ctl_table_header *volatile <noident> @@    got table_header *volatile <noident> @@
net/dns_resolver/dns_key.c:163:9: sparse: incorrect type in assignment (different address spaces) @@    expected void *volatile <noident> @@    got struct user_key_payload [novoid *volatile <noident> @@
net/netfilter/nfnetlink.c:257:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct sock *volatile <noident> @@    got struct sstruct sock *volatile <noident> @@
drivers/scsi/libfc/fc_libfc.c:299:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct fc4_prov *volatile <noident> @@    got uct fc4_prov *volatile <noident> @@
drivers/scsi/libfc/fc_libfc.c:301:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct fc4_prov *volatile <noident> @@    got uct fc4_prov *volatile <noident> @@
kernel/events/callchain.c:55:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct callchain_cpus_entries *volatile <noident> @@    got cpus_entries *volatile <noident> @@
kernel/events/callchain.c:85:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct callchain_cpus_entries *volatile <noident> @@    got struct cstruct callchain_cpus_entries *volatile <noident> @@
net/phonet/pn_dev.c:376:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct net_device *volatile <noident> @@    got struct nstruct net_device *volatile <noident> @@
net/sched/sch_generic.c:668:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct Qdisc *volatile <noident> @@    got struct Qstruct Qdisc *volatile <noident> @@
net/sched/sch_generic.c:725:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct Qdisc *volatile <noident> @@    got struct Qstruct Qdisc *volatile <noident> @@
net/sched/sch_generic.c:775:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct Qdisc *volatile <noident> @@    got struct Qstruct Qdisc *volatile <noident> @@
net/sched/sch_generic.c:883:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct Qdisc *volatile <noident> @@    got struct Qstruct Qdisc *volatile <noident> @@
net/netfilter/ipset/ip_set_hash_gen.h:572:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct htable *volatile <noident> @@    got struct hstruct htable *volatile <noident> @@
kernel/nsproxy.c:220:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct nsproxy *volatile <noident> @@    got struct nstruct nsproxy *volatile <noident> @@
kernel/notifier.c:30:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct notifier_block *volatile <noident> @@    got struct nstruct notifier_block *volatile <noident> @@
kernel/notifier.c:45:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct notifier_block *volatile <noident> @@    got struct nstruct notifier_block *volatile <noident> @@
kernel/notifier.c:54:25: sparse: incorrect type in assignment (different address spaces) @@    expected struct notifier_block *volatile <noident> @@    got struct nstruct notifier_block *volatile <noident> @@
kernel/fork.c:989:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct sighand_struct *volatile <noident> @@    got struct sstruct sighand_struct *volatile <noident> @@
fs/exec.c:1007:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct sighand_struct *volatile <noident> @@    got struct sstruct sighand_struct *volatile <noident> @@
fs/fcntl.c:634:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct fasync_struct *volatile <noident> @@    got struct fstruct fasync_struct *volatile <noident> @@
fs/file.c:323:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct file *volatile <noident> @@    got struct fstruct file *volatile <noident> @@
net/xfrm/xfrm_user.c:3012:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct sock *volatile <noident> @@    got struct sstruct sock *volatile <noident> @@
drivers/gpu/drm/radeon/radeon_cs.c:640:35: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned long [unsigned] [usertype] size @@    got ned] [usertype] size @@
drivers/gpu/drm/radeon/radeon_cs.c:640:66: sparse: incorrect type in argument 2 (different base types) @@    expected restricted gfp_t [usertype] flags @@    got t [usertype] flags @@
sound/soc/codecs/lm4857.c:197:34: sparse: incorrect type in argument 1 (different base types) @@    expected struct snd_soc_card *card @@    got struct sstruct snd_soc_card *card @@
fs/f2fs/namei.c:450:45: sparse: Expected ; at end of statement
fs/f2fs/namei.c:450:45: sparse: got :
drivers/target/target_core_spc.c:135:6: sparse: symbol 'spc_parse_naa_6h_vendor_specific' was not declared. Should it be static?
drivers/target/target_core_device.c:50:1: sparse: symbol 'g_device_mutex' was not declared. Should it be static?
drivers/target/target_core_device.c:51:1: sparse: symbol 'g_device_list' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
