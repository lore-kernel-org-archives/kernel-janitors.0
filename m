From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 23 Jan 2013 16:11:14 +0000
Subject: build regressions 2013-01-23
Message-Id: <51000ba2.c6/CcThWOE3zVaGP%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/acpi/power.c:437:3: error: implicit declaration of function 'sysfs_remove_link_from_group' [-Werror=implicit-function-declaration]
drivers/acpi/power.c:461:3: error: implicit declaration of function 'sysfs_add_link_to_group' [-Werror=implicit-function-declaration]
include/linux/dmaengine.h:996:1: error: expected ';' before '}' token
lib/devres.c:116:3: error: implicit declaration of function 'ERR_PTR'
lib/devres.c:163:2: error: implicit declaration of function 'IS_ERR'
(.text+0x15012f): undefined reference to `led_classdev_register'
(.text+0x1501ae): undefined reference to `led_classdev_unregister'
ERROR: "guest_enter" undefined!
ERROR: "guest_exit" undefined!
drivers/media/pci/cx23885/cx23885-input.c:309:20: error: 'RC_TYPE_ALL' undeclared (first use in this function)
net/netfilter/nf_conntrack_standalone.c:566:2: error: 'nf_ct_netfilter_header' undeclared (first use in this function)
net/netfilter/nf_conntrack_standalone.c:567:41: error: 'nf_ct_netfilter_table' undeclared (first use in this function)

[warnings]
arch/ia64/hp/common/aml_nfw.c:209:3: warning: initialization from incompatible pointer type [enabled by default]
arch/ia64/hp/common/aml_nfw.c:209:3: warning: (near initialization for 'acpi_aml_nfw_driver.ops.remove') [enabled by default]
lib/devres.c:116:3: warning: return makes pointer from integer without a cast
lib/devres.c:135:12: warning: assignment makes pointer from integer without a cast
drivers/leds/leds-lp5521.c:318:4: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat]
drivers/leds/leds-lp5523.c:361:4: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat]
drivers/vhost/vringh.c:205:3: warning: passing argument 2 of 'check_range' from incompatible pointer type [enabled by default]
net/core/netpoll.c:1049:6: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/tty/tty_enum.c:24:1: sparse: symbol 'tty_bus_lock' was not declared. Should it be static?
drivers/tty/tty_enum.c:351:12: sparse: symbol 'tty_bus_init' was not declared. Should it be static?
lib/devres.c:116:31: sparse: incorrect type in return expression (different address spaces)
lib/devres.c:135:26: sparse: incorrect type in assignment (different address spaces)
lib/devres.c:163:20: sparse: incorrect type in argument 1 (different address spaces)
net/can/gw.c:370:13: sparse: restricted __wsum degrades to integer
net/can/gw.c:402:24: sparse: incorrect type in assignment (different base types)
drivers/media/dvb-frontends/m88dc2800.c:1627:18: sparse: constant 4294967296 is so big it is long long
drivers/media/dvb-frontends/m88dc2800.c:1306:4: sparse: symbol 'M88DC2000GetLock' was not declared. Should it be static?
drivers/media/pci/cx23885/cx23885-f300.c:233:1: sparse: no newline at end of file
drivers/media/pci/cx88/cx88.h:144:40: sparse: duplicate const
drivers/media/dvb-frontends/m88dc2800.c:2123:23: sparse: no newline at end of file
drivers/input/rmi4/rmi_bus.c:19:10: sparse: unable to open 'rmi_bus.h'
drivers/input/rmi4/rmi_driver.c:31:10: sparse: unable to open 'rmi_bus.h'
drivers/input/rmi4/rmi_f01.c:160:40: sparse: using member 'data' in incomplete struct rmi_function
drivers/input/rmi4/rmi_f01.c:190:42: sparse: using member 'dev' in incomplete struct rmi_function
drivers/input/rmi4/rmi_f01.c:258:18: sparse: undefined identifier 'rmi_write_block'
drivers/input/rmi4/rmi_f01.c:282:16: sparse: using member 'debugfs_root' in incomplete struct rmi_function
drivers/input/rmi4/rmi_f01.c:286:17: sparse: undefined identifier 'RMI_RW_ATTR'
drivers/input/rmi4/rmi_f01.c:317:35: sparse: undefined identifier 'to_rmi_function'
drivers/input/rmi4/rmi_f01.c:614:28: sparse: using member 'fd' in incomplete struct rmi_function
drivers/input/rmi4/rmi_f01.c:766:8: sparse: undefined identifier 'RMI_RO_ATTR'
drivers/input/rmi4/rmi_f01.c:877:40: sparse: using member 'rmi_dev' in incomplete struct rmi_function
drivers/input/rmi4/rmi_f01.c:878:71: sparse: using member 'dev' in incomplete struct rmi_device
drivers/input/rmi4/rmi_f01.c:880:50: sparse: undefined identifier 'to_rmi_platform_data'
drivers/input/rmi4/rmi_f01.c:885:17: sparse: undefined identifier 'rmi_read_block'
drivers/input/rmi4/rmi_f11.c:829:35: sparse: undefined identifier 'to_rmi_function'
drivers/input/rmi4/rmi_f11.c:847:25: sparse: undefined identifier 'rmi_write_block'
drivers/input/rmi4/rmi_f11.c:860:8: sparse: undefined identifier 'RMI_WO_ATTR'
drivers/input/rmi4/rmi_f11.c:878:16: sparse: using member 'debugfs_root' in incomplete struct rmi_function
drivers/input/rmi4/rmi_f11.c:884:29: sparse: using member 'dev' in incomplete struct rmi_function
drivers/input/rmi4/rmi_f11.c:890:44: sparse: undefined identifier 'RMI_RW_ATTR'
drivers/input/rmi4/rmi_f11.c:977:34: sparse: using member 'data' in incomplete struct rmi_function
drivers/input/rmi4/rmi_f11.c:1267:40: sparse: using member 'rmi_dev' in incomplete struct rmi_function
drivers/input/rmi4/rmi_f11.c:1272:17: sparse: undefined identifier 'rmi_read_block'
drivers/input/rmi4/rmi_f11.c:1610:22: sparse: undefined identifier 'rmi_read'
drivers/input/rmi4/rmi_i2c.c:61:21: sparse: using member 'debugfs_root' in incomplete struct rmi_device
drivers/input/rmi4/rmi_i2c.c:64:66: sparse: undefined identifier 'RMI_RW_ATTR'
drivers/input/rmi4/rmi_i2c.c:67:34: sparse: using member 'dev' in incomplete struct rmi_device
drivers/input/rmi4/rmi_i2c.c:118:37: sparse: using member 'dev' in incomplete struct rmi_phys_device
drivers/input/rmi4/rmi_i2c.c:119:41: sparse: using member 'data' in incomplete struct rmi_phys_device
drivers/input/rmi4/rmi_i2c.c:126:13: sparse: using member 'info' in incomplete struct rmi_phys_device
drivers/input/rmi4/rmi_i2c.c:315:17: sparse: using member 'write_block' in incomplete struct rmi_phys_device
drivers/input/rmi4/rmi_i2c.c:316:17: sparse: using member 'read_block' in incomplete struct rmi_phys_device
drivers/input/rmi4/rmi_i2c.c:330:18: sparse: undefined identifier 'rmi_register_phys_device'
drivers/input/rmi4/rmi_i2c.c:338:40: sparse: using member 'rmi_dev' in incomplete struct rmi_phys_device
drivers/input/rmi4/rmi_i2c.c:360:9: sparse: undefined identifier 'rmi_unregister_phys_device'
drivers/media/pci/cx23885/cx23885-input.c:309:34: sparse: undefined identifier 'RC_TYPE_ALL'

[smatch]
sound/pci/hda/patch_analog.c:4987 patch_ad1882() error: potentially derefencing uninitialized 'spec'.
drivers/media/dvb-frontends/mb86a20s.c:706 mb86a20s_attach() error: potential null dereference 'state'.  (kzalloc returns null)
drivers/media/dvb-frontends/mb86a20s.c:706 mb86a20s_attach() error: we previously assumed 'state' could be null (see line 705)
drivers/media/dvb-frontends/m88ds3103.c:240 m88ds3103_load_firmware() error: potentially derefencing uninitialized 'fw'.
drivers/media/usb/dvb-usb/dw2102.c:951 bstusb_set_voltage() error: doing dma on the stack (obuf)
drivers/media/usb/dvb-usb/dw2102.c:951 bstusb_set_voltage() error: doing dma on the stack (ibuf)
drivers/media/usb/dvb-usb/dw2102.c:966 bstusb_restart() error: doing dma on the stack (obuf)
drivers/media/usb/dvb-usb/dw2102.c:966 bstusb_restart() error: doing dma on the stack (ibuf)
drivers/media/usb/dvb-usb/dw2102.c:1408 US6830_frontend_attach() error: doing dma on the stack (obuf)
drivers/media/usb/dvb-usb/dw2102.c:1408 US6830_frontend_attach() error: doing dma on the stack (ibuf)
drivers/media/usb/dvb-usb/dw2102.c:1449 US6832_frontend_attach() error: doing dma on the stack (obuf)
drivers/media/usb/dvb-usb/dw2102.c:1449 US6832_frontend_attach() error: doing dma on the stack (ibuf)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
