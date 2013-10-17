From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 17 Oct 2013 18:39:33 +0000
Subject: build regressions 2013-10-17
Message-Id: <52602ee5.6/0TXQhJg9jBXLBt%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/module.c:646:2: error: implicit declaration of function 'raw_cpu_write' [-Werror=implicit-function-declaration]
drivers/powercap/intel_rapl.c:34:31: fatal error: asm/cpu_device_id.h: No such file or directory
drivers/staging/iio/adc/lpc32xx_adc.c:163:27: error: 'NR_IRQS' undeclared (first use in this function)
drivers/staging/iio/adc/spear_adc.c:336:27: error: 'NR_IRQS' undeclared (first use in this function)
drivers/base/power/main.c:429:2: error: implicit declaration of function 'get_current' [-Werror=implicit-function-declaration]
drivers/usb/storage/uas.c:661:2: error: call to '__compiletime_assert_661' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct uas_cmd_info) > sizeof(struct scsi_pointer)
drivers/misc/mic/host/mic_main.c:41:2: error: #error "Testing integration with 0day framework"

[warnings]
Warning(drivers/base/power/main.c:410): No description found for parameter 'data'
Warning(include/linux/wait.h:290): No description found for parameter 'cmd1'
Warning(include/linux/wait.h:290): No description found for parameter 'cmd2'
Warning(include/linux/usb.h:75): No description found for parameter 'streams'
kernel/power/hibernate.c:977:2: warning: passing argument 1 of 'name_to_dev_t' discards 'const' qualifier from pointer target type [enabled by default]
net/tipc/server.c:133:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/tipc/server.c:147:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/tipc/server.c:432:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/tipc/server.c:505:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/tipc/server.c:522:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:1001:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:1981:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:2049:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:2140:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:2175:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:2182:3: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:2668:3: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:2739:3: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:4626:3: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:4900:3: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:4948:9: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:5427:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:5439:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:5440:6: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:5576:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:5798:4: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:5823:4: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_core.c:5833:4: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
net/bluetooth/l2cap_sock.c:820:2: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
arch/parisc/mm/fault.c:147:2: warning: right shift count >= width of type [enabled by default]
drivers/base/power/main.c:429:10: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/hv/channel_mgmt.c:203:24: warning: unused variable 'primary_channel' [-Wunused-variable]
drivers/base/power/main.c:641:22: warning: unused variable 'wd' [-Wunused-variable]
drivers/base/power/main.c:1128:22: warning: unused variable 'wd' [-Wunused-variable]

[sparse]
net/bluetooth/l2cap_sock.c:80:23: sparse: restricted __le16 degrades to integer
net/bluetooth/l2cap_sock.c:173:23: sparse: restricted __le16 degrades to integer
drivers/scsi/esas2r/esas2r_init.c:1238:35: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] sgl_page_size @@    got ed int [unsigned] [usertype] sgl_page_size @@
drivers/scsi/esas2r/esas2r_init.c:1239:32: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] epoch_time @@    got ed int [unsigned] [usertype] epoch_time @@
drivers/scsi/be2iscsi/be_main.c:157:1: sparse: symbol 'dev_attr_beiscsi_active_session_count' was not declared. Should it be static?
drivers/scsi/be2iscsi/be_main.c:159:1: sparse: symbol 'dev_attr_beiscsi_free_session_count' was not declared. Should it be static?
drivers/scsi/be2iscsi/be_main.c:157:1: sparse: symbol 'dev_attr_beiscsi_phys_port' was not declared. Should it be static?
drivers/scsi/be2iscsi/be_main.c:5023:17: sparse: cast to restricted __be32
drivers/scsi/be2iscsi/be_main.c:5023:17: sparse: cast to restricted __be32
drivers/scsi/be2iscsi/be_main.c:5023:17: sparse: cast to restricted __be32
drivers/scsi/be2iscsi/be_main.c:5023:17: sparse: cast to restricted __be32
drivers/scsi/be2iscsi/be_main.c:5023:17: sparse: cast to restricted __be32
drivers/scsi/be2iscsi/be_main.c:5023:17: sparse: cast to restricted __be32
drivers/scsi/pm8001/pm8001_hwi.c:4704:35: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [addressable] [assigned] [usertype] ds_ads_m @@    got e] ds_ads_m @@
drivers/scsi/pm8001/pm80xx_hwi.c:3669:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] start_addr @@    got g long [unsigned] [usertype] start_addr @@
drivers/scsi/pm8001/pm80xx_hwi.c:3671:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] end_addr_low @@    got ed int [unsigned] [usertype] end_addr_low @@
drivers/scsi/pm8001/pm80xx_hwi.c:3672:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] end_addr_high @@    got ed int [unsigned] [usertype] end_addr_high @@
drivers/scsi/pm8001/pm80xx_hwi.c:3728:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] start_addr @@    got g long [unsigned] [usertype] start_addr @@
drivers/scsi/pm8001/pm80xx_hwi.c:3730:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] end_addr_low @@    got ed int [unsigned] [usertype] end_addr_low @@
drivers/scsi/pm8001/pm80xx_hwi.c:3731:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] end_addr_high @@    got ed int [unsigned] [usertype] end_addr_high @@
drivers/scsi/pm8001/pm80xx_hwi.c:3846:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] start_addr @@    got g long [unsigned] [usertype] start_addr @@
drivers/scsi/pm8001/pm80xx_hwi.c:3848:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] end_addr_low @@    got ed int [unsigned] [usertype] end_addr_low @@
drivers/scsi/pm8001/pm80xx_hwi.c:3849:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] end_addr_high @@    got ed int [unsigned] [usertype] end_addr_high @@
drivers/scsi/pm8001/pm80xx_hwi.c:3912:36: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] start_addr @@    got g long [unsigned] [usertype] start_addr @@
drivers/scsi/pm8001/pm80xx_hwi.c:3914:38: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] end_addr_low @@    got ed int [unsigned] [usertype] end_addr_low @@
drivers/scsi/pm8001/pm80xx_hwi.c:3915:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] end_addr_high @@    got ed int [unsigned] [usertype] end_addr_high @@
drivers/scsi/pm8001/pm8001_init.c:674:6: sparse: symbol 'pm8001_get_phy_settings_info' was not declared. Should it be static?
drivers/scsi/pm8001/pm80xx_hwi.c:4317:27: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 [addressable] [assigned] [usertype] ppc_phyid @@    got  [usertype] ppc_phyid @@
drivers/scsi/pm8001/pm80xx_hwi.c:4322:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] <noident> @@    got restrunsigned int [unsigned] <noident> @@
drivers/scsi/pm8001/pm80xx_hwi.c:4302:6: sparse: symbol 'mpi_set_phy_profile_req' was not declared. Should it be static?
drivers/scsi/pm8001/pm80xx_hwi.c:81:39: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/scsi/pm8001/pm80xx_hwi.c:69:6: sparse: symbol 'pm80xx_pci_mem_copy' was not declared. Should it be static?
drivers/powercap/intel_rapl.c:512:5: sparse: symbol 'get_time_window' was not declared. Should it be static?
drivers/powercap/intel_rapl.c:538:12: sparse: symbol 'get_constraint_name' was not declared. Should it be static?
drivers/powercap/intel_rapl.c:581:37: sparse: symbol 'constraint_ops' was not declared. Should it be static?
kernel/power/hibernate.c:977:29: sparse: incorrect type in argument 1 (different modifiers) @@    expected char *name @@    got char cchar *name @@
drivers/misc/mic/host/mic_main.c:41:2: sparse: "Testing integration with 0day framework"
drivers/virtio/virtio_balloon.c:288:9: sparse: restricted __le32 degrades to integer
drivers/virtio/virtio_balloon.c:288:9: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned char [unsigned] [usertype] val @@    got igned] [usertype] val @@
drivers/virtio/virtio_balloon.c:288:9: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got igned] [usertype] val @@
drivers/virtio/virtio_balloon.c:288:9: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got igned] [usertype] val @@
drivers/virtio/virtio_balloon.c:288:9: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long long [unsigned] [usertype] val @@    got igned] [usertype] val @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got 32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got icted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got ricted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got cted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got restricted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got 32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got icted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got ricted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got cted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got restricted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got 32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got icted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got ricted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got cted __le32 <noident> @@
drivers/virtio/virtio_balloon.c:278:9: sparse: incorrect type in assignment (different base types) @@    expected restricted __le32 <noident> @@    got restricted __le32 <noident> @@
arch/x86/include/asm/paravirt.h:571:24: sparse: context imbalance in 'mincore_huge_pmd' - unexpected unlock
drivers/usb/host/xhci-ring.c:1154:29: sparse: incorrect type in assignment (different base types) @@    expected restricted __le64 [usertype] deq @@    got __le64 [usertype] deq @@
drivers/usb/host/xhci-ring.c:1156:29: sparse: incorrect type in assignment (different base types) @@    expected restricted __le64 [usertype] deq @@    got __le64 [usertype] deq @@
drivers/usb/host/xhci-ring.c:1161:65: sparse: restricted __le64 degrades to integer
kernel/module.c:646:9: sparse: undefined identifier 'raw_cpu_write'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
