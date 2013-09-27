From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 27 Sep 2013 16:35:40 +0000
Subject: build regressions 2013-09-27
Message-Id: <5245b3dc.Ac2BA+BUvVBTcDuM%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
/bin/sh: 1: alpha-linux-gcc-4.7: not found
include/linux/hugetlb.h:430:33: error: 'PMD_SIZE' undeclared (first use in this function)
include/linux/hugetlb.h:430:33: error: 'PMD_SIZE' undeclared (first use in this function)
/bin/sh: 1: frv-linux-gcc-4.7: not found
drivers/gpio/gpiolib.c:2108:6: error: expected ';', ',' or ')' before 'unsigned'
drivers/gpio/gpiolib.c:2194:3: error: implicit declaration of function 'of_find_gpio' [-Werror=implicit-function-declaration]
net/sunrpc/clnt.c:1722:32: error: 't' undeclared (first use in this function)
drivers/scsi/fcoe/fcoe_sysfs.c:561:3: error: 'bus_attr_ctrl_destroy' undeclared here (not in a function)
drivers/misc/mic/host/mic_x100.c:402:49: error: dereferencing pointer to incomplete type
drivers/misc/mic/host/mic_x100.c:403:38: error: dereferencing pointer to incomplete type
drivers/misc/mic/host/mic_debugfs.c:54:51: error: '__START_KERNEL_map' undeclared (first use in this function)
drivers/misc/mic/card/mic_x100.c:215:26: error: lvalue required as unary '&' operand
drivers/misc/mic/card/mic_x100.c:217:9: error: dereferencing pointer to incomplete type
drivers/misc/mic/card/mic_x100.c:217:25: error: dereferencing pointer to incomplete type
drivers/misc/mic/host/mic_main.c:320:3: error: too many arguments to function 'sysfs_get_dirent'
drivers/hid/i2c-hid/i2c-hid.c:880:2: error: implicit declaration of function 'acpi_evaluate_integer' [-Werror=implicit-function-declaration]
include/asm-generic/iomap.h:31:21: error: conflicting types for 'ioread32'
/bin/sh: 1: powerpc64-linux-gcc-4.7: not found
drivers/misc/mic/host/mic_device.h:159:2: error: implicit declaration of function 'ioread32' [-Werror=implicit-function-declaration]
drivers/misc/mic/host/mic_device.h:173:2: error: implicit declaration of function 'iowrite32' [-Werror=implicit-function-declaration]
drivers/misc/mic/card/mic_x100.c:215:9: error: implicit declaration of function 'cpu_data' [-Werror=implicit-function-declaration]
include/linux/hugetlb.h:431:16: error: implicit declaration of function 'pmd_lockptr' [-Werror=implicit-function-declaration]
include/linux/mm.h:1324:98: error: conflicting types for 'pmd_lockptr'
drivers/gpio/gpiolib.c:481:2: error: implicit declaration of function 'gpiod_lock_as_irq' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib.c:2090:12: error: static declaration of 'gpiod_lock_as_irq' follows non-static declaration
include/uapi/rdma/ib_user_verbs.h:92:2: error: expected ',' or '}' before 'IB_USER_VERBS_CMD_CREATE_MMU_NOTIFY_CHANNEL'
include/uapi/rdma/ib_user_verbs.h:92:2: error: expected ',' or '}' before 'IB_USER_VERBS_CMD_CREATE_MMU_NOTIFY_CHANNEL'
drivers/infiniband/core/uverbs_main.c:120:3: error: 'IB_USER_VERBS_CMD_CREATE_MMU_NOTIFY_CHANNEL' undeclared here (not in a function)
drivers/infiniband/core/uverbs_main.c:121:3: error: 'IB_USER_VERBS_CMD_REG_MMU_NOTIFY_MR' undeclared here (not in a function)
drivers/infiniband/core/uverbs_main.c:121:2: error: array index in initializer not of integer type
drivers/infiniband/core/uverbs_main.c:122:3: error: 'IB_USER_VERBS_CMD_DEREG_MMU_NOTIFY_MR' undeclared here (not in a function)
drivers/infiniband/core/uverbs_main.c:122:2: error: array index in initializer not of integer type
drivers/tty/serial/8250/8250_dw.c:327:3: error: too many arguments to function 'dw8250_probe_acpi'

[warnings]
drivers/gpio/gpiolib.c:2194:8: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/media/usb/cx231xx/cx231xx-cards.c:953:2: warning: statement with no effect [-Wunused-value]
drivers/media/usb/cx231xx/cx231xx-cards.c:1083:2: warning: statement with no effect [-Wunused-value]
drivers/media/usb/cx231xx/cx231xx-cards.c:1451:3: warning: statement with no effect [-Wunused-value]
include/linux/device.h:50:23: warning: 'bus_attr_ctlr_destroy' defined but not used [-Wunused-variable]
drivers/scsi/isci/init.c:393:2: warning: array subscript is above array bounds [-Warray-bounds]
lib/mpi/mpi-inline.h:116:2: warning: '______f' is static but declared in inline function 'mpihelp_sub' which is not static [enabled by default]
lib/mpi/mpi-inline.h:113:2: warning: '______f' is static but declared in inline function 'mpihelp_sub' which is not static [enabled by default]
lib/mpi/mpi-inline.h:99:2: warning: '______f' is static but declared in inline function 'mpihelp_sub_1' which is not static [enabled by default]
lib/mpi/mpi-inline.h:92:4: warning: '______f' is static but declared in inline function 'mpihelp_sub_1' which is not static [enabled by default]
lib/mpi/mpi-inline.h:88:2: warning: '______f' is static but declared in inline function 'mpihelp_sub_1' which is not static [enabled by default]
lib/mpi/mpi-inline.h:73:2: warning: '______f' is static but declared in inline function 'mpihelp_add' which is not static [enabled by default]
lib/mpi/mpi-inline.h:70:2: warning: '______f' is static but declared in inline function 'mpihelp_add' which is not static [enabled by default]
lib/mpi/mpi-inline.h:56:2: warning: '______f' is static but declared in inline function 'mpihelp_add_1' which is not static [enabled by default]
lib/mpi/mpi-inline.h:49:4: warning: '______f' is static but declared in inline function 'mpihelp_add_1' which is not static [enabled by default]
lib/mpi/mpi-inline.h:45:2: warning: '______f' is static but declared in inline function 'mpihelp_add_1' which is not static [enabled by default]
drivers/misc/mei/hbm.c:53:39: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'long unsigned int' [-Wformat=]
fs/ceph/file.c:696:18: warning: comparison of distinct pointer types lacks a cast [enabled by default]
include/asm-generic/iomap.h:37:13: warning: conflicting types for 'iowrite32' [enabled by default]
drivers/misc/mic/host/mic_intr.h:134:58: warning: 'struct pci_dev' declared inside parameter list [enabled by default]
drivers/misc/mic/host/mic_intr.h:134:58: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/misc/mic/host/mic_intr.h:135:58: warning: 'struct pci_dev' declared inside parameter list [enabled by default]
include/linux/hugetlb.h:431:16: warning: return makes pointer from integer without a cast [enabled by default]
include/linux/gpio.h:210:1: warning: no return statement in function returning non-void [-Wreturn-type]
mm/migrate.c:1171:4: warning: statement with no effect [-Wunused-value]

[sparse]
mm/hugetlb.c:3070:25: sparse: context imbalance in 'follow_hugetlb_page' - different lock contexts for basic block
drivers/pci/pci-sysfs.c:307:18: sparse: symbol 'pci_bus_attrs' was not declared. Should it be static?
drivers/infiniband/core/uverbs_main.c:121:10: sparse: bad constant expression type
drivers/infiniband/core/uverbs_main.c:122:10: sparse: bad constant expression type
drivers/misc/mic/host/mic_x100.c:402:19: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/misc/mic/host/mic_x100.c:403:19: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
drivers/misc/mic/host/mic_virtio.c:44:32: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const *src @@    got void [nodervoid const *src @@
drivers/misc/mic/host/mic_virtio.c:69:28: sparse: incorrect type in argument 1 (different address spaces) @@    expected void *to @@    got void [noderef] <avoid *to @@
drivers/misc/mic/host/mic_virtio.c:292:22: sparse: cast to restricted __le64
drivers/misc/mic/host/mic_virtio.c:298:25: sparse: cast to restricted __le64
drivers/misc/mic/host/mic_virtio.c:296:46: sparse: incorrect type in assignment (different address spaces) @@    expected struct vring_used *used @@    got voidstruct vring_used *used @@
drivers/misc/mic/host/mic_virtio.c:463:21: sparse: cast to restricted __le16
drivers/misc/mic/host/mic_virtio.c:548:23: sparse: cast to restricted __le16
drivers/misc/mic/host/mic_virtio.c:574:37: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got g long [unsigned] [usertype] address @@
drivers/misc/mic/host/mic_virtio.c:630:40: sparse: cast to restricted __le64
drivers/misc/mic/host/mic_virtio.c:678:40: sparse: cast to restricted __le64
drivers/misc/mic/card/mic_virtio.c:261:33: sparse: incorrect type in argument 6 (different address spaces) @@    expected void *pages @@    got void [noderef] <asn:2>*[assivoid *pages @@
drivers/misc/mic/card/mic_virtio.c:543:52: sparse: incorrect type in argument 2 (different address spaces) @@    expected void *data @@    got struct mic_device_desc [noderef] <asn:2>*[assivoid *data @@
drivers/misc/mic/host/mic_main.c:319:45: sparse: too many arguments for function sysfs_get_dirent
include/uapi/rdma/ib_user_verbs.h:92:9: sparse: Expected } at end of specifier
include/uapi/rdma/ib_user_verbs.h:92:9: sparse: got IB_USER_VERBS_CMD_CREATE_MMU_NOTIFY_CHANNEL
drivers/infiniband/core/uverbs_main.c:121:10: sparse: undefined identifier 'IB_USER_VERBS_CMD_REG_MMU_NOTIFY_MR'
drivers/infiniband/core/uverbs_main.c:122:10: sparse: undefined identifier 'IB_USER_VERBS_CMD_DEREG_MMU_NOTIFY_MR'
drivers/infiniband/core/uverbs_main.c:120:10: sparse: undefined identifier 'IB_USER_VERBS_CMD_CREATE_MMU_NOTIFY_CHANNEL'
drivers/gpio/gpiolib.c:2108:41: sparse: Expected ) in function declarator
drivers/gpio/gpiolib.c:2108:41: sparse: got unsigned
drivers/gpio/gpiolib.c:2111:1: sparse: Expected ; at the end of type declaration
drivers/gpio/gpiolib.c:2111:1: sparse: got }
drivers/gpio/gpiolib.c:2124:9: sparse: Expected ; at end of declaration
drivers/gpio/gpiolib.c:2124:9: sparse: got )
drivers/gpio/gpiolib.c:2167:33: sparse: got break
drivers/gpio/gpiolib.c:2173:16: sparse: got desc
drivers/gpio/gpiolib.c:2189:9: sparse: got (
drivers/gpio/gpiolib.c:481:15: sparse: undefined identifier 'gpiod_lock_as_irq'
net/sunrpc/clnt.c:1725:26: sparse: undefined identifier 't'

[coccinelle]
drivers/tty/serial/sccnxp.c:856:2-8: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
