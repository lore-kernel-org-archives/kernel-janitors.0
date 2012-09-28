From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 02:46:03 +0000
Subject: [tip:x86/acpi 1/6] include/linux/acpi.h:434:28: error: unknown type name 'acpi_physical_address'
Message-Id: <20120928024603.GG9155@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Thomas,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/acpi
head:   4901b402c957d4ebaff123ffc34fafe3cef99542
commit: 9e0a90cdff5b89599d73695b4d9971d1075c0b14 [1/6] X86 ACPI: Introduce x86 arch specific arch_reserve_mem_area() for e820 handling
config: i386-allnoconfig

All error/warnings:

In file included from init/main.c:25:0:
include/linux/acpi.h:434:28: error: unknown type name 'acpi_physical_address'

vim +434 include/linux/acpi.h

9e0a90cd (Thomas Renninger 2012-09-26  433) #if CONFIG_X86
9e0a90cd (Thomas Renninger 2012-09-26 @434) void arch_reserve_mem_area(acpi_physical_address addr, size_t size);
9e0a90cd (Thomas Renninger 2012-09-26  435) #else
9e0a90cd (Thomas Renninger 2012-09-26  436) static inline void arch_reserve_mem_area(acpi_physical_address addr,
9e0a90cd (Thomas Renninger 2012-09-26  437) 					  size_t size)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
