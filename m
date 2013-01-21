From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 21 Jan 2013 16:16:12 +0000
Subject: build regressions 2013-01-21
Message-Id: <50fd69cc.5TowIJ3UsC/ai+y1%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/module_signing.c:161:36: error: 'system_trusted_keyring' undeclared (first use in this function)
drivers/gpio/gpioblock-of.c:22:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'gpioblock_of_probe'
drivers/gpio/gpioblock-of.c:78:49: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__devinitdata'
drivers/gpio/gpioblock-of.c:89:21: error: 'gpioblock_of_match' undeclared here (not in a function)
drivers/gpio/gpioblock-of.c:92:11: error: 'gpioblock_of_probe' undeclared here (not in a function)
include/linux/virtio_ring.h:27:3: error: implicit declaration of function 'ia64_mf' [-Werror=implicit-function-declaration]
include/linux/virtio_ring.h:35:3: error: expected string literal before 'stringify_in_c'
include/linux/virtio_ring.h:36:2: error: 'else' without a previous 'if'

[warnings]
mm/page_alloc.c:4464: warning: 'sanitize_zone_movable_limit' defined but not used
WARNING: drivers/gpio/built-in.o(.data+0x40): Section mismatch in reference from the variable gpioblock_of_driver to the function .init.text:gpioblock_of_probe()
WARNING: drivers/gpio/built-in.o(.data+0x68): Section mismatch in reference from the variable gpioblock_of_driver to the variable .init.data:gpioblock_of_match
kernel/time/timer_list.c:133:39: warning: array subscript is below array bounds [-Warray-bounds]
WARNING: drivers/built-in.o(.text+0x5658a0): Section mismatch in reference from the function release_firmware_map_entry() to the function .meminit.text:firmware_map_find_entry_in_list()
WARNING: vmlinux.o(.text+0x774768): Section mismatch in reference from the function release_firmware_map_entry() to the function .meminit.text:vmemmap_populate_print_last()
kernel/sched/stats.c:31:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/vhost/vringh.c:488:3: warning: format '%zu' expects argument of type 'size_t', but argument 2 has type 'unsigned int' [-Wformat]
WARNING: vmlinux.o(.text+0x1d6b78): Section mismatch in reference from the function release_firmware_map_entry() to the function .meminit.text:pgdat_page_cgroup_init()
mm/page_alloc.c:5117:3: warning: array subscript is above array bounds [-Warray-bounds]

[sparse]
include/net/addrconf.h:327:36: sparse: restricted __be32 degrades to integer
drivers/gpio/gpio-palmas.c:46:15: sparse: undefined identifier 'palmas_read'
drivers/gpio/gpio-palmas.c:62:23: sparse: undefined identifier 'palmas_write'
drivers/gpio/gpio-palmas.c:83:15: sparse: undefined identifier 'palmas_update_bits'
drivers/gpio/gpio-palmas.c:108:16: sparse: undefined identifier 'palmas_irq_get_virq'
kernel/sched/stats.c:31:17: sparse: mixing declarations and code

[smatch]
kernel/module.c:3266 load_module() error: double lock 'mutex:&module_mutex'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
