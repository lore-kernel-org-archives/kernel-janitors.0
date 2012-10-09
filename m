From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 09 Oct 2012 15:20:27 +0000
Subject: [rcu:dev.2012.10.08a 17/21] arch/um/drivers/mconsole_kern.c:708:2: error: implicit declaration of fu
Message-Id: <20121009152027.GC11390@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Frederic,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2012.10.08a
head:   39083e8d47ddbc78412249d01c1ed63d7fd14c50
commit: 13ec2e2650c8f82380178ad0b1b29a5d5c3ea557 [17/21] rcu: Remove rcu_switch()
config: um-defconfig

All error/warnings:

arch/um/drivers/mconsole_kern.c: In function 'stack_proc':
arch/um/drivers/mconsole_kern.c:708:2: error: implicit declaration of function 'rcu_switch' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +708 arch/um/drivers/mconsole_kern.c

4111b025 Jeff Dike           2006-01-06  702  
6f517d3f Jeff Dike           2006-01-06  703  static void stack_proc(void *arg)
6f517d3f Jeff Dike           2006-01-06  704  {
6f517d3f Jeff Dike           2006-01-06  705  	struct task_struct *from = current, *to = arg;
6f517d3f Jeff Dike           2006-01-06  706  
6f517d3f Jeff Dike           2006-01-06  707  	to->thread.saved_task = from;
04e7e951 Frederic Weisbecker 2012-07-16 @708  	rcu_switch(from, to);
6f517d3f Jeff Dike           2006-01-06  709  	switch_to(from, to, from);
6f517d3f Jeff Dike           2006-01-06  710  }
6f517d3f Jeff Dike           2006-01-06  711  

The code at line 708 was first introduced by commit:
04e7e95 rcu: Switch task's syscall hooks on context switch


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
