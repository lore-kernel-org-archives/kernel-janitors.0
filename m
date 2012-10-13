From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 13 Oct 2012 00:04:32 +0000
Subject: [dynticks:nohz/printk 5/5] kernel/printk.c:1999:2: error: implicit declaration of function 'arch_irq
Message-Id: <20121013000432.GB27431@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Frederic,

FYI, kernel build failed on

tree:   git://github.com/fweisbec/linux-dynticks.git nohz/printk
head:   f72ce6fbecebcf9faeaa740754ac71474758c1f6
commit: f72ce6fbecebcf9faeaa740754ac71474758c1f6 [5/5] printk: Wake up klogd with irq_work on nohz CPU
config: sparc64-defconfig # make ARCH=sparc64 defconfig

All error/warnings:

kernel/printk.c: In function 'wake_up_klogd_nohz':
kernel/printk.c:1999:2: error: implicit declaration of function 'arch_irq_work_use_tick' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +1999 kernel/printk.c

f72ce6fb Frederic Weisbecker 2012-10-12  1993  {
f72ce6fb Frederic Weisbecker 2012-10-12  1994  	/*
f72ce6fb Frederic Weisbecker 2012-10-12  1995  	 * If irq work is not itself implemented using the tick
f72ce6fb Frederic Weisbecker 2012-10-12  1996  	 * it's a safe and fast way to wake up the reader.
f72ce6fb Frederic Weisbecker 2012-10-12  1997  	 */
f72ce6fb Frederic Weisbecker 2012-10-12  1998  #ifdef CONFIG_IRQ_WORK
f72ce6fb Frederic Weisbecker 2012-10-12 @1999  	if (!arch_irq_work_use_tick()) {
f72ce6fb Frederic Weisbecker 2012-10-12  2000  		static struct irq_work klogd_irq_work = {
f72ce6fb Frederic Weisbecker 2012-10-12  2001  			.func = wake_klogd_irq_work
f72ce6fb Frederic Weisbecker 2012-10-12  2002  		};

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
