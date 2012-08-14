From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 14 Aug 2012 20:38:47 +0000
Subject: [tip:auto-latest 23/37] kernel/smpboot.c:164:36: sparse: incorrect type in initializer (different ad
Message-Id: <20120814203847.GC20732@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Thomas,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git auto-latest
head:   e42942691c8262b7fe2a7b88577623082b988217
commit: f97f8f06a49febbc3cb3635172efbe64ddc79700 [23/37] smpboot: Provide infrastructure for percpu hotplug threads

All sparse warnings:

  kernel/smpboot.c:23:8: sparse: symbol 'idle_threads' was not declared. Should it be static?
+ kernel/smpboot.c:164:36: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:164:36:    expected void const [noderef] <asn:3>*__vpp_verify
  kernel/smpboot.c:164:36:    got struct task_struct [noderef] <asn:3>**<noident>
  kernel/smpboot.c:164:35: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:164:35:    expected struct task_struct *tsk
  kernel/smpboot.c:164:35:    got struct task_struct [noderef] <asn:3>*<noident>
  kernel/smpboot.c:184:10: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:184:10:    expected void const [noderef] <asn:3>*__vpp_verify
  kernel/smpboot.c:184:10:    got struct task_struct [noderef] <asn:3>**<noident>
+ kernel/smpboot.c:184:38: sparse: incorrect type in assignment (different address spaces)
  kernel/smpboot.c:184:38:    expected struct task_struct [noderef] <asn:3>*<noident>
  kernel/smpboot.c:184:38:    got struct task_struct *[assigned] tsk
  kernel/smpboot.c:205:36: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:205:36:    expected void const [noderef] <asn:3>*__vpp_verify
  kernel/smpboot.c:205:36:    got struct task_struct [noderef] <asn:3>**<noident>
  kernel/smpboot.c:205:35: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:205:35:    expected struct task_struct *tsk
  kernel/smpboot.c:205:35:    got struct task_struct [noderef] <asn:3>*<noident>
  kernel/smpboot.c:222:36: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:222:36:    expected void const [noderef] <asn:3>*__vpp_verify
  kernel/smpboot.c:222:36:    got struct task_struct [noderef] <asn:3>**<noident>
  kernel/smpboot.c:222:35: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:222:35:    expected struct task_struct *tsk
  kernel/smpboot.c:222:35:    got struct task_struct [noderef] <asn:3>*<noident>
  kernel/smpboot.c:244:44: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:244:44:    expected void const [noderef] <asn:3>*__vpp_verify
  kernel/smpboot.c:244:44:    got struct task_struct [noderef] <asn:3>**<noident>
  kernel/smpboot.c:244:43: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:244:43:    expected struct task_struct *tsk
  kernel/smpboot.c:244:43:    got struct task_struct [noderef] <asn:3>*<noident>
  kernel/smpboot.c:249:26: sparse: incorrect type in initializer (different address spaces)
  kernel/smpboot.c:249:26:    expected void const [noderef] <asn:3>*__vpp_verify
  kernel/smpboot.c:249:26:    got struct task_struct [noderef] <asn:3>**<noident>

vim +164 kernel/smpboot.c
   161	static int
   162	__smpboot_create_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
   163	{
 > 164		struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
   165		struct smpboot_thread_data *td;
   166	
   167		if (tsk)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
