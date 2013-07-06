From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 06 Jul 2013 22:57:13 +0000
Subject: build regressions 2013-07-06
Message-Id: <51d8a0c9.ERHodBLjRbYLNNIA%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/gpu/drm/drm_bufs.c:219: error: implicit declaration of function 'ioremap_wc'
drivers/video/uvesafb.c:1563: error: implicit declaration of function 'ioremap_wc'
ERROR: "rndis_msg_parser" undefined!
ERROR: "rndis_signal_disconnect" undefined!
ERROR: "rndis_get_next_response" undefined!
ERROR: "rndis_signal_connect" undefined!
ERROR: "rndis_set_param_vendor" undefined!
ERROR: "rndis_register" undefined!
ERROR: "rndis_uninit" undefined!
ERROR: "rndis_deregister" undefined!
ERROR: "rndis_rm_hdr" undefined!
ERROR: "rndis_free_response" undefined!
ERROR: "rndis_add_hdr" undefined!
ERROR: "rndis_set_host_mac" undefined!
ERROR: "rndis_set_param_medium" undefined!
ERROR: "rndis_set_param_dev" undefined!
ERROR: "ehci_init_driver" undefined!
ERROR: "ehci_init_driver" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
ERROR: "usb_gadget_map_request" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
ERROR: "usb_del_gadget_udc" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
ERROR: "usb_gadget_unmap_request" [drivers/usb/chipidea/ci_hdrc.ko] undefined!
ERROR: "usb_add_gadget_udc" [drivers/usb/chipidea/ci_hdrc.ko] undefined!

[warnings]
arch/arm/kernel/smp.c:436:2: warning: (near initialization for 'ipi_types[1].handler') [enabled by default]
drivers/gpu/drm/drm_bufs.c:220: warning: assignment makes pointer from integer without a cast
drivers/video/uvesafb.c:1563: warning: assignment makes pointer from integer without a cast
kernel/hrtimer.c:785:27: warning: unused variable 'cpu_base' [-Wunused-variable]

[sparse]
drivers/gpu/drm/radeon/sumo_dpm.c:1836:5: sparse: symbol 'sumo_dpm_force_performance_level' was not declared. Should it be static?
drivers/gpu/drm/radeon/trinity_dpm.c:1161:5: sparse: symbol 'trinity_dpm_force_performance_level' was not declared. Should it be static?
drivers/gpu/drm/radeon/ni_dpm.c:1040:5: sparse: symbol 'ni_dpm_force_performance_level' was not declared. Should it be static?
drivers/gpu/drm/radeon/si_dpm.c:3234:5: sparse: symbol 'si_dpm_force_performance_level' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
