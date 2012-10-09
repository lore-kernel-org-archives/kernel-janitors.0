From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 09 Oct 2012 01:53:15 +0000
Subject: [dynticks:cputime/cleanups 1/3] include/linux/kvm_host.h:692:2: error: implicit declaration of funct
Message-Id: <20121009015315.GA6112@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Frederic,

FYI, kernel build failed on

tree:   git://github.com/fweisbec/linux-dynticks.git cputime/cleanups
head:   e9a4d5c1f47ed3df66e61ef2e681db1ab01a0d7a
commit: a9da39a10a81d67dd1c34e103d83334a3449cc9f [1/3] kvm: Directly account vtime to system on guest switch
config: powerpc-allyesconfig

All error/warnings:

In file included from arch/powerpc/kernel/asm-offsets.c:53:0:
include/linux/kvm_host.h: In function 'kvm_guest_enter':
include/linux/kvm_host.h:692:2: error: implicit declaration of function 'vtime_account_system' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +692 include/linux/kvm_host.h

d172fcd3 drivers/kvm/kvm.h        Laurent Vivier      2007-10-15  686  {
8fa22068 include/linux/kvm_host.h Gleb Natapov        2011-05-04  687  	BUG_ON(preemptible());
a9da39a1 include/linux/kvm_host.h Frederic Weisbecker 2012-10-05  688  	/*
a9da39a1 include/linux/kvm_host.h Frederic Weisbecker 2012-10-05  689  	 * This is running in ioctl context so we can avoid
a9da39a1 include/linux/kvm_host.h Frederic Weisbecker 2012-10-05  690  	 * the call to vtime_account() with its unnecessary idle check.
a9da39a1 include/linux/kvm_host.h Frederic Weisbecker 2012-10-05  691  	 */
a9da39a1 include/linux/kvm_host.h Frederic Weisbecker 2012-10-05 @692  	vtime_account_system(current);
d172fcd3 drivers/kvm/kvm.h        Laurent Vivier      2007-10-15  693  	current->flags |= PF_VCPU;
8fa22068 include/linux/kvm_host.h Gleb Natapov        2011-05-04  694  	/* KVM does not hold any references to rcu protected data when it
8fa22068 include/linux/kvm_host.h Gleb Natapov        2011-05-04  695  	 * switches CPU into a guest mode. In fact switching to a guest mode

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
