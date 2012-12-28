From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Dec 2012 07:34:19 +0000
Subject: build regressions 2012-12-27
Message-Id: <50dd4b7b.moUhlUS+44PUMzkb%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[warnings]
drivers/platform/x86/asus-wmi.c:2006:1: warning: 'alias' attribute ignored [-Wattributes]
drivers/platform/x86/acer-wmi.c:1221:14: warning: 'devices' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U 980>.<U 8e8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/platform/x86/msi-laptop.c:502:78: sparse: dubious: !x | y
drivers/platform/x86/chromeos_laptop.c:34:12: sparse: symbol 'i2c_adapter_names' was not declared. Should it be static?
drivers/platform/x86/asus-wmi.c:1421:1: sparse: mixing declarations and code

[smatch]
drivers/platform/x86/asus-laptop.c:1558 asus_acpi_notify() warn: was || intended here instead of &&?

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
