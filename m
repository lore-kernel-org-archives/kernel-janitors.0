From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 11 Jul 2012 14:35:45 +0000
Subject: [memcg:since-3.4 98/99] mm/oom_kill.c:343:27: sparse: context imbalance in 'select_bad_process' - wr
Message-Id: <20120711143545.GA28535@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

There are new sparse warnings show up in

tree:   git://github.com/mstsxfx/memcg-devel.git since-3.4
head:   2a6e6a4f421b0e721a59ec5c3abe2df931a2ad32
commit: 7f5e01c90d7e49045455e70f42ea1496fd87deaf [98/99] mm, oom: reduce dependency on tasklist_lock

All sparse warnings:

  mm/oom_kill.c:140:20: sparse: context imbalance in 'find_lock_task_mm' - wrong count at exit
  mm/oom_kill.c:198:28: sparse: context imbalance in 'oom_badness' - unexpected unlock
+ mm/oom_kill.c:343:27: sparse: context imbalance in 'select_bad_process' - wrong count at exit
+ mm/oom_kill.c:400:9: sparse: context imbalance in 'dump_tasks' - different lock contexts for basic block
  mm/memcontrol.c:4257:21: sparse: incompatible types in comparison expression (different address spaces)
  mm/memcontrol.c:4259:21: sparse: incompatible types in comparison expression (different address spaces)
  mm/memcontrol.c:5377:31: sparse: incompatible types in comparison expression (different address spaces)

vim +343 mm/oom_kill.c
   340	 *
   341	 * (not docbooked, we don't want this one cluttering up the manual)
   342	 */
 > 343	static struct task_struct *select_bad_process(unsigned int *ppoints,
   344			unsigned long totalpages, const nodemask_t *nodemask,
   345			bool force_kill)
   346	{

This return is not handled by the patch:

   363                 case OOM_SCAN_ABORT:
   364                         return ERR_PTR(-1UL);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
