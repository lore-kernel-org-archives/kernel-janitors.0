From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 14 Jul 2013 23:06:41 +0000
Subject: build regressions 2013-07-14
Message-Id: <51e32f01.0AIZt9MZ6PpV9okD%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/char/sonypi.c:881:3: error: implicit declaration of function 'acpi_bus_generate_proc_event' [-Werror=implicit-function-declaration]
arch/x86/platform/ce4100/ce4100.c:165:2: error: 'reboot_type' undeclared (first use in this function)
arch/x86/platform/ce4100/ce4100.c:165:16: error: 'BOOT_KBD' undeclared (first use in this function)
ERROR: "led_classdev_register" [drivers/net/wireless/brcm80211/brcmsmac/brcmsmac.ko] undefined!
ERROR: "led_classdev_unregister" [drivers/net/wireless/brcm80211/brcmsmac/brcmsmac.ko] undefined!
drivers/pci/hotplug/acpiphp_ibm.c:273:3: error: implicit declaration of function 'acpi_bus_generate_proc_event' [-Werror=implicit-function-declaration]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
