From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 14:12:00 +0000
Subject: arch/x86/include/asm/mc146818rtc.h:44:2: error: implicit declaration of function 'this_cpu_read'
Message-Id: <20121002141200.GA14146@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Arnd,

FYI, kernel build failed on

commit: 72e2c3166db31bbb25654be3985ea662fa141d8e  warnings in include/linux/mc146818rtc.h
config: i386-allmodconfig

All error/warnings:

arch/x86/include/asm/mc146818rtc.h:44:17: sparse: undefined identifier 'this_cpu_read'
arch/x86/include/asm/mc146818rtc.h:44:17: sparse: not a function <noident>
In file included from include/linux/mc146818rtc.h:15:0,
                 from arch/x86/kernel/rtc.c:5:
arch/x86/include/asm/mc146818rtc.h: In function 'lock_cmos':
arch/x86/include/asm/mc146818rtc.h:44:2: error: implicit declaration of function 'this_cpu_read' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from include/linux/mc146818rtc.h:15:0,
                 from drivers/char/mwave/smapi.c:50:
arch/x86/include/asm/mc146818rtc.h: In function 'lock_cmos':
arch/x86/include/asm/mc146818rtc.h:44:2: error: implicit declaration of function 'this_cpu_read' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

sparse static analyze warnings:

? arch/x86/include/asm/mc146818rtc.h:44:17: sparse: undefined identifier 'this_cpu_read'
? arch/x86/include/asm/mc146818rtc.h:44:17: sparse: not a function <noident>

vim +44 arch/x86/include/asm/mc146818rtc.h

6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  41) static inline void lock_cmos(unsigned char reg)
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  42) {
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  43) 	unsigned long new;
933a4415 include/asm-x86/mc146818rtc.h (Joe Perches     2008-03-23 @44) 	new = ((smp_processor_id() + 1) << 8) | reg;
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  45) 	for (;;) {
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  46) 		if (cmos_lock) {
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  47) 			cpu_relax();
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  48) 			continue;
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  49) 		}
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  50) 		if (__cmpxchg(&cmos_lock, 0, new, sizeof(cmos_lock)) = 0)
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  51) 			return;
6ce60b07 include/asm-x86/mc146818rtc.h (Thomas Gleixner 2008-01-30  52) 	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
