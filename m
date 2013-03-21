From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 21 Mar 2013 17:42:40 +0000
Subject: build regressions 2013-03-21
Message-Id: <514b4690.PrVQDnVc0RV/lEXs%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/of.h:382:75: error: expected declaration specifiers or '...' before ')' token
ERROR: "arizona_rate_text" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
ERROR: "arizona_rate_val" [sound/soc/codecs/snd-soc-wm-adsp.ko] undefined!
drivers/mfd/wm5102-tables.c:1172:7: error: 'ARIZONA_SPK_CTRL_2' undeclared (first use in this function)
drivers/mfd/wm5102-tables.c:1173:7: error: 'ARIZONA_SPK_CTRL_3' undeclared (first use in this function)

[warnings]
drivers/target/target_core_rd.c:258: warning: 'rd_get_sg_table' defined but not used
drivers/infiniband/ulp/isert/isert_verbs.c:168:2: warning: #warning FIXME: Failure cases for device cqs + tasklets [-Wcpp]
drivers/infiniband/ulp/isert/isert_verbs.c:377:2: warning: #warning FIXME for failure after isert_device_find_by_ib_dev() [-Wcpp]
drivers/infiniband/ulp/isert/isert_verbs.c:389:1: warning: label 'out_rsp_dma_map' defined but not used [-Wunused-label]
drivers/mfd/cros_ec_spi.c:123:5: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'int' [-Wformat]
drivers/mfd/cros_ec_spi.c:157:3: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'int' [-Wformat]
drivers/mfd/cros_ec_spi.c:181:2: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'int' [-Wformat]
drivers/dma/of-dma.c:111:15: warning: 'nbcells' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/target/iscsi/iscsi_target.c:2693:1: warning: 'iscsit_send_datain' uses dynamic stack allocation [enabled by default]
drivers/target/iscsi/iscsi_target_util.c:171:21: warning: unused variable 'se_sess' [-Wunused-variable]
fs/btrfs/tree-log.c:1208:20: warning: 'dst_di' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/btrfs/qgroup.c:1082:16: warning: 'ref_root' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
net/nfc/llcp/sock.c:334:33: sparse: restricted __be16 degrades to integer
net/nfc/llcp/sock.c:334:42: sparse: restricted __be16 degrades to integer
kernel/workqueue.c:2040:32: sparse: context imbalance in 'manage_workers' - unexpected unlock
drivers/media/usb/em28xx/em28xx-cards.c:1999:20: sparse: symbol 'em28xx_bcount' was not declared. Should it be static?
drivers/media/usb/cx231xx/cx231xx-avcore.c:2224:15: sparse: cast to restricted __le32
drivers/media/usb/cx231xx/cx231xx-avcore.c:2445:15: sparse: cast to restricted __le32
drivers/media/usb/cx231xx/cx231xx-avcore.c:2473:15: sparse: cast to restricted __le32
drivers/media/usb/cx231xx/cx231xx-avcore.c:2498:15: sparse: cast to restricted __le32
drivers/media/usb/cx231xx/cx231xx-core.c:1491:15: sparse: cast to restricted __le32
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:675:23: sparse: cast to restricted __le32
drivers/media/usb/cx231xx/cx231xx-avcore.c:2645:18: sparse: incorrect type in assignment (different base types)
drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c:24:5: sparse: symbol 'dvb_usb_v2_generic_io' was not declared. Should it be static?
include/linux/of.h:382:75: sparse: no identifier for function argument
include/linux/of.h:382:75: sparse: no identifier for function argument
include/linux/of.h:382:75: sparse: no identifier for function argument
include/linux/of.h:382:75: sparse: no identifier for function argument
include/linux/of.h:382:75: sparse: no identifier for function argument
include/linux/of.h:382:75: sparse: no identifier for function argument
include/linux/of.h:382:75: sparse: no identifier for function argument
include/linux/of.h:382:75: sparse: no identifier for function argument
include/linux/of.h:382:75: sparse: no identifier for function argument
drivers/infiniband/ulp/isert/isert_verbs.c:168:2: sparse: FIXME: Failure cases for device cqs + tasklets
drivers/infiniband/ulp/isert/isert_verbs.c:377:2: sparse: FIXME for failure after isert_device_find_by_ib_dev()
drivers/input/keyboard/cros_ec_keyb.c:200:31: sparse: bad constant expression
drivers/input/keyboard/cros_ec_keyb.c:212:32: sparse: bad constant expression
drivers/input/keyboard/cros_ec_keyb.c:213:32: sparse: bad constant expression
drivers/input/keyboard/cros_ec_keyb.c:226:46: sparse: cannot size expression
drivers/input/keyboard/cros_ec_keyb.c:228:55: sparse: cannot size expression
sound/soc/codecs/arizona.c:205:35: sparse: undefined identifier 'arizona'
drivers/gpu/drm/i915/i915_drv.c:271:9: sparse: Initializer entry defined twice
drivers/infiniband/ulp/isert/isert_core.c:40:21: sparse: symbol 'isert_global' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
