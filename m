From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 03 Mar 2013 19:56:30 +0000
Subject: build regressions 2013-03-03
Message-Id: <5133aaee.XZ1zibzeN+2gvt/y%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/pinctrl/core.c:297:9: error: implicit declaration of function 'gpio_to_chip' [-Werror=implicit-function-declaration]
drivers/pinctrl/core.c:304:45: error: dereferencing pointer to incomplete type
drivers/pinctrl/core.c:305:26: error: dereferencing pointer to incomplete type
drivers/pinctrl/core.c:305:39: error: dereferencing pointer to incomplete type
ERROR: "crc32_le" [lib/xz/xz_dec_test.ko] undefined!
ERROR: "crc32_le" [lib/xz/xz_dec.ko] undefined!
ERROR: "crc32_le" [drivers/net/usb/smsc95xx.ko] undefined!
ERROR: "crc32_le" [drivers/net/usb/smsc75xx.ko] undefined!
ERROR: "crc32_le" [drivers/net/usb/asix.ko] undefined!
ERROR: "crc32_le" [drivers/net/irda/stir4200.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/via/via-rhine.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/sis/sis900.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/sis/sis190.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/silan/sc92031.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/sfc/sfc.ko] undefined!

[warnings]
drivers/infiniband/ulp/isert/isert_core.c:357:2: warning: #warning FIXME: Unexpected unsolicited_data out [-Wcpp]
drivers/infiniband/ulp/isert/isert_core.c:372:2: warning: #warning FIXME: Non page-aligned unsolicited_data out [-Wcpp]
drivers/infiniband/ulp/isert/isert_core.c:1065:5: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
drivers/infiniband/ulp/isert/isert_core.c:1659:35: warning: format '%u' expects argument of type 'unsigned int', but argument 2 has type 'long unsigned int' [-Wformat]
drivers/infiniband/ulp/isert/isert_core.c:1661:39: warning: format '%u' expects argument of type 'unsigned int', but argument 2 has type 'long unsigned int' [-Wformat]
drivers/infiniband/ulp/isert/isert_core.c:1662:35: warning: format '%u' expects argument of type 'unsigned int', but argument 2 has type 'long unsigned int' [-Wformat]
drivers/infiniband/ulp/isert/isert_verbs.c:92:2: warning: #warning FIXME: max_sge hardcoded to 16 [-Wcpp]
arch/s390/kernel/compat_linux.c:297:2: warning: passing argument 5 of 'compat_sys_ipc' makes integer from pointer without a cast [enabled by default]
drivers/pinctrl/core.c:297:27: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/iio/adc/exynos_adc.c:110:9: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

[sparse]
fs/splice.c:1692:1: sparse: symbol 'compat_SyS_vmsplice' was not declared. Should it be static?
net/ceph/osd_client.c:334:17: sparse: incorrect type in argument 1 (different base types)
drivers/target/iscsi/iscsi_target_login.c:1103:2: sparse: FIXME: iscsi_login_init_conn failure OOPs............
drivers/target/iscsi/iscsi_target_login.c:641:2: sparse: FIXME: iscsit_start_nopin_timer disabled
fs/timerfd.c:387:1: sparse: symbol 'compat_SyS_timerfd_settime' was not declared. Should it be static?
fs/timerfd.c:404:1: sparse: symbol 'compat_SyS_timerfd_gettime' was not declared. Should it be static?

[smatch]
drivers/iio/adc/exynos_adc.c:146 exynos_read_raw() error: 'wait_for_completion_interruptible_timeout()' returns negative and 'timeout' is unsigned
drivers/iio/adc/exynos_adc.c:110 exynos_adc_get_version() error: potential NULL dereference 'match'.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
