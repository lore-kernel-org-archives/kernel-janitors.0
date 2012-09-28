From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 16:34:43 +0000
Subject: (.init.text+0xe48): undefined reference to `populate_rootfs_wait'
Message-Id: <20120928163443.GB5171@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andy,

FYI, kernel build failed on

commit: ae50fa983346d0a83d12320409a6ecf6a780a7de  UBUNTU: SAUCE: ensure root is ready before running usermodehelpers in it
config: alpha-defconfig

All error/warnings:

init/built-in.o: In function `kernel_init':
(.init.text+0xe48): undefined reference to `populate_rootfs_wait'
init/built-in.o: In function `kernel_init':
(.init.text+0xe4c): undefined reference to `populate_rootfs_wait'
kernel/built-in.o: In function `call_usermodehelper_fns':
(.text+0x1d720): undefined reference to `populate_rootfs_wait'
kernel/built-in.o: In function `call_usermodehelper_fns':
(.text+0x1d76c): undefined reference to `populate_rootfs_wait'
drivers/built-in.o: In function `atkbd_interrupt':
(.text+0xdc478): relocation truncated to fit: GPREL16 against `.sbss'
drivers/built-in.o: In function `psmouse_queue_work':
(.text+0xde72c): relocation truncated to fit: GPREL16 against `.sbss'
drivers/built-in.o: In function `psmouse_disconnect':
(.text+0xdfe00): relocation truncated to fit: GPREL16 against `.sbss'
drivers/built-in.o: In function `psmouse_connect':
(.text+0xe0434): relocation truncated to fit: GPREL16 against `.sbss'
drivers/built-in.o: In function `__synaptics_init':
(.text+0xe3364): relocation truncated to fit: GPREL16 against `.sbss'
drivers/built-in.o: In function `__synaptics_init':
(.text+0xe3368): relocation truncated to fit: GPREL16 against `.sbss'
drivers/built-in.o: In function `__synaptics_init':
(.text+0xe3598): relocation truncated to fit: GPREL16 against `.sbss'
drivers/built-in.o: In function `__synaptics_init':
(.text+0xe359c): relocation truncated to fit: GPREL16 against `.sbss'
drivers/built-in.o: In function `hwmon_device_register':
(.text+0xe98f4): relocation truncated to fit: GPREL16 against `.sbss'
drivers/built-in.o: In function `hid_get_report':
(.text+0xe9ef0): relocation truncated to fit: GPREL16 against symbol `hid_debug' defined in .sbss section in drivers/built-in.o
drivers/built-in.o: In function `hid_report_raw_event':
(.text+0xeb850): additional relocation overflows omitted from the output

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
