From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 13 Jul 2012 05:07:28 +0000
Subject: [time:fortglx/3.6/time 12/14] kernel/time/timekeeping.c:374:7: warning: unused variable 'arch_offset
Message-Id: <20120713050728.GA15846@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi John,

There are new compile warnings show up in

tree:   git://git.linaro.org/people/jstultz/linux.git fortglx/3.6/time
head:   a752ef2bd4724278f5bba89707f3dc7506657d27
commit: 895abac0b725ee38b746dfd548fcb30375819747 [12/14] time: Move arch_gettimeoffset() usage into timekeeping_get_ns()

All warnings:

kernel/time/timekeeping.c: In function 'getnstime_raw_and_real':
kernel/time/timekeeping.c:374:7: warning: unused variable 'arch_offset' [-Wunused-variable]

vim +374 kernel/time/timekeeping.c
   371		WARN_ON_ONCE(timekeeping_suspended);
   372	
   373		do {
 > 374			u32 arch_offset;
   375	
   376			seq = read_seqbegin(&timekeeper.lock);
   377	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
