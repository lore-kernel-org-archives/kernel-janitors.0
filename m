From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 01:24:37 +0000
Subject: [aa:autonuma 27/52] include/linux/autonuma_sched.h:55:20: error: redefinition of 'autonuma_possible'
Message-Id: <20120928012437.GI5522@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andrea,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git autonuma
head:   f6f2b7fed5357522b2736616cd0312243dc1f82e
commit: f73a50412bef19912b96e9f33ff3841542100fd6 [27/52] autonuma: CPU follows memory algorithm
config: x86_64-allmodconfig

All error/warnings:

In file included from kernel/sched/core.c:75:0:
include/linux/autonuma_sched.h:55:20: error: redefinition of 'autonuma_possible'
In file included from include/linux/autonuma_sched.h:4:0,
                 from kernel/sched/core.c:75:
include/linux/autonuma_flags.h:113:20: note: previous definition of 'autonuma_possible' was here

vim +55 include/linux/autonuma_sched.h

f73a5041 (Andrea Arcangeli 2012-03-23  53) static inline void sched_autonuma_balance(void) {}
f73a5041 (Andrea Arcangeli 2012-03-23  54) 
f73a5041 (Andrea Arcangeli 2012-03-23 @55) static inline bool autonuma_possible(void)
f73a5041 (Andrea Arcangeli 2012-03-23  56) {
f73a5041 (Andrea Arcangeli 2012-03-23  57) 	return false;
f73a5041 (Andrea Arcangeli 2012-03-23  58) }

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
