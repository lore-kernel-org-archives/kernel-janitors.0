From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 12 Oct 2012 16:55:22 +0000
Subject: [glommer-memcg:kmemcg-slab 30/33] mm/slab_common.c:250:6: error: conflicting types for 'print_slabin
Message-Id: <20121012165522.GA20312@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Glauber,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git kmemcg-slab
head:   f7dc2a43ce771e73443c82eb25d95f72f8161b45
commit: 0f901d86f02ebf93cd584f9f09b4b6f4add9caa8 [30/33] Aggregate memcg cache values in slabinfo
config: cris-allyesconfig # make ARCH=cris 

All error/warnings:

In file included from kernel/fork.c:14:0:
include/linux/slab.h:224:45: warning: 'struct seq_file' declared inside parameter list [enabled by default]
include/linux/slab.h:224:45: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/slab.h:225:35: warning: 'struct seq_file' declared inside parameter list [enabled by default]
--
In file included from mm/slab_common.c:6:0:
include/linux/slab.h:224:45: warning: 'struct seq_file' declared inside parameter list [enabled by default]
include/linux/slab.h:224:45: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/slab.h:225:35: warning: 'struct seq_file' declared inside parameter list [enabled by default]
mm/slab_common.c:250:6: error: conflicting types for 'print_slabinfo_header'
include/linux/slab.h:225:6: note: previous declaration of 'print_slabinfo_header' was here
mm/slab_common.c:320:5: error: conflicting types for 'cache_show'
include/linux/slab.h:224:5: note: previous declaration of 'cache_show' was here
--
In file included from mm/bootmem.c:13:0:
include/linux/slab.h:224:45: warning: 'struct seq_file' declared inside parameter list [enabled by default]
include/linux/slab.h:224:45: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/slab.h:225:35: warning: 'struct seq_file' declared inside parameter list [enabled by default]
mm/bootmem.c: In function 'mark_bootmem':
mm/bootmem.c:361:1: warning: control reaches end of non-void function [-Wreturn-type]

vim +250 mm/slab_common.c

97d06609 Christoph Lameter 2012-07-06  244  int slab_is_available(void)
97d06609 Christoph Lameter 2012-07-06  245  {
97d06609 Christoph Lameter 2012-07-06  246  	return slab_state >= UP;
97d06609 Christoph Lameter 2012-07-06  247  }
4d93335e Glauber Costa     2012-09-26  248  
4d93335e Glauber Costa     2012-09-26  249  #ifdef CONFIG_SLABINFO
0f901d86 Glauber Costa     2012-10-01 @250  void print_slabinfo_header(struct seq_file *m)
5c939166 Glauber Costa     2012-09-26  251  {
5c939166 Glauber Costa     2012-09-26  252  	/*
5c939166 Glauber Costa     2012-09-26  253  	 * Output format version, so at least we can change it

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
