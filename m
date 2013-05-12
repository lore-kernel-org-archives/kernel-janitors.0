From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 12 May 2013 00:50:49 +0000
Subject: build regressions 2013-05-11
Message-Id: <518ee769.RZcTAaG2HowU8Jts%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
hw_breakpoint.c:(.text+0x2df50): undefined reference to `__aeabi_uldivmod'
kernel/wait.c:314:6: error: request for member 'counter' in something not a structure or union
kernel/wait.c:332:7: error: request for member 'counter' in something not a structure or union
kernel/wait.c:334:19: error: request for member 'counter' in something not a structure or union
core.c:(.text+0x2d038): undefined reference to `__update_task_entity_contrib'
arch/x86/pci/xen.c:302:30: error: 'PCI_MSIX_TABLE_BIR' undeclared (first use in this function)
arch/x86/pci/xen.c:298:13: error: 'struct pci_dev' has no member named 'msix_cap'
hdpvr-core.c:(.text+0xf495d): undefined reference to `i2c_del_adapter'
hdpvr-core.c:(.text+0xf5126): undefined reference to `i2c_del_adapter'
hdpvr-video.c:(.text+0xf5ccf): undefined reference to `i2c_del_adapter'
(.text+0xf70c4): undefined reference to `i2c_new_device'
(.text+0xf7143): undefined reference to `i2c_new_device'
(.text+0xf7207): undefined reference to `i2c_add_adapter'
hdpvr-core.c:(.text+0x11f4a9): undefined reference to `v4l2_device_disconnect'
(.text+0x11f518): undefined reference to `video_device_release'
hdpvr-core.c:(.text+0x11f594): undefined reference to `v4l2_device_register'
hdpvr-video.c:(.text+0x12084f): undefined reference to `v4l2_device_unregister'
(.text+0x1217fd): undefined reference to `video_device_alloc'
hdpvr-video.c:(.text+0x121c41): undefined reference to `v4l2_ctrl_activate'
(.text+0x122ccd): undefined reference to `v4l2_ctrl_new_std_menu'
(.text+0x122cf6): undefined reference to `v4l2_ctrl_new_std_menu'
(.text+0x122d1b): undefined reference to `v4l2_ctrl_new_std_menu'
(.text+0x122d3d): undefined reference to `v4l2_ctrl_new_std_menu'
(.text+0x122def): undefined reference to `v4l2_ctrl_cluster'
hdpvr-video.c:(.text+0x121b25): undefined reference to `v4l2_fh_init'
hdpvr-video.c:(.text+0x121b2d): undefined reference to `v4l2_fh_add'
hdpvr-video.c:(.text+0x121f95): undefined reference to `v4l_match_dv_timings'
(.text+0x30dfb): undefined reference to `integrity_audit_msg'
(.text+0x31db4): undefined reference to `integrity_audit_msg'
(.text+0x31f38): undefined reference to `integrity_audit_msg'
(.text+0x320d1): undefined reference to `integrity_audit_msg'
(.text+0x321da): undefined reference to `integrity_audit_msg'

[warnings]
kernel/wait.c:314:6: warning: dereferencing 'void *' pointer [enabled by default]
kernel/wait.c:332:7: warning: dereferencing 'void *' pointer [enabled by default]
kernel/wait.c:334:19: warning: dereferencing 'void *' pointer [enabled by default]
drivers/staging/iio/meter/ade7758.h:178:50: warning: 'struct iio_ring_buffer' declared inside parameter list [enabled by default]
drivers/staging/iio/meter/ade7758.h:178:50: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/mtd/map.h:414:2: warning: 'r' is used uninitialized in this function [-Wuninitialized]
include/linux/mtd/cfi.h:489:3: warning: 'r' may be used uninitialized in this function [-Wuninitialized]

[sparse]
arch/x86/pci/xen.c:302:32: sparse: cast from unknown type
kernel/trace/trace_kprobe.c:226:17: sparse: incorrect type in assignment (different address spaces)
kernel/trace/trace_kprobe.c:303:17: sparse: incorrect type in assignment (different address spaces)
arch/x86/pci/xen.c:298:34: sparse: no member 'msix_cap' in struct pci_dev
arch/x86/pci/xen.c:301:51: sparse: undefined identifier 'PCI_MSIX_TABLE_BIR'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
