From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 02:46:51 +0000
Subject: [tip:x86/acpi 2/6] arch/x86/kernel/setup.c:944:2: error: implicit declaration of function 'acpi_init
Message-Id: <20120928024651.GH9155@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Thomas,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/acpi
head:   4901b402c957d4ebaff123ffc34fafe3cef99542
commit: 9b17afd44dadf5065c46bc8e4df55b938d92c529 [2/6] ACPI: Store valid ACPI tables passed via early initrd in reserved memblock areas
config: i386-allnoconfig

All error/warnings:

In file included from init/main.c:25:0:
include/linux/acpi.h:442:28: error: unknown type name 'acpi_physical_address'
--
In file included from arch/x86/kernel/setup.c:29:0:
include/linux/acpi.h:442:28: error: unknown type name 'acpi_physical_address'
arch/x86/kernel/setup.c: In function 'setup_arch':
arch/x86/kernel/setup.c:944:2: error: implicit declaration of function 'acpi_initrd_override' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +944 arch/x86/kernel/setup.c

e7b37895  (Yinghai Lu       2008-06-25  938) #endif
162a7e75  (Mike Travis      2011-05-24  939) 	/* Allocate bigger log buffer */
162a7e75  (Mike Travis      2011-05-24  940) 	setup_log_buf(1);
e7b37895  (Yinghai Lu       2008-06-25  941) 
2ec65f8b  (Yinghai Lu       2008-06-23  942) 	reserve_initrd();
2ec65f8b  (Yinghai Lu       2008-06-23  943) 
9b17afd4  (Thomas Renninger 2012-09-26 @944) 	acpi_initrd_override((void *)initrd_start, initrd_end - initrd_start);
9b17afd4  (Thomas Renninger 2012-09-26  945) 
44280733  (Yinghai Lu       2009-11-22  946) 	reserve_crashkernel();
44280733  (Yinghai Lu       2009-11-22  947) 

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
