From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 17:48:31 +0000
Subject: [glommer-memcg:slab-common/slabinfo 17/21] mm/slab.c:4415:9: error: conflicting types for 'slabinfo_
Message-Id: <20120927174831.GA5517@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Glauber,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git slab-common/slabinfo
head:   0521160acc51bc8385807752e69dd38d976aef22
commit: 514d13cfa0bed7c434b594d4f989df63c8ca6ba6 [17/21] move slabinfo processing to slab_common.c
config: blackfin-BF533-EZKIT_defconfig

All error/warnings:

In file included from mm/slab.c:90:0:
mm/slab.h:50:35: warning: 'struct seq_file' declared inside parameter list [enabled by default]
mm/slab.h:50:35: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
mm/slab.h:52:26: warning: 'struct seq_file' declared inside parameter list [enabled by default]
mm/slab.h:55:10: warning: 'struct file' declared inside parameter list [enabled by default]
mm/slab.c:4287:6: error: conflicting types for 'print_slabinfo_header'
In file included from mm/slab.c:90:0:
mm/slab.h:50:6: note: previous declaration of 'print_slabinfo_header' was here
mm/slab.c:4310:5: error: conflicting types for 'slabinfo_show'
In file included from mm/slab.c:90:0:
mm/slab.h:52:5: note: previous declaration of 'slabinfo_show' was here
mm/slab.c:4415:9: error: conflicting types for 'slabinfo_write'
In file included from mm/slab.c:90:0:
mm/slab.h:54:9: note: previous declaration of 'slabinfo_write' was here

vim +4415 mm/slab.c

^1da177e (Linus Torvalds 2005-04-16  4409)  * slabinfo_write - Tuning for the slab allocator
^1da177e (Linus Torvalds 2005-04-16  4410)  * @file: unused
^1da177e (Linus Torvalds 2005-04-16  4411)  * @buffer: user buffer
^1da177e (Linus Torvalds 2005-04-16  4412)  * @count: data length
^1da177e (Linus Torvalds 2005-04-16  4413)  * @ppos: unused
^1da177e (Linus Torvalds 2005-04-16  4414)  */
514d13cf (Glauber Costa  2012-09-26 @4415) ssize_t slabinfo_write(struct file *file, const char __user *buffer,
b28a02de (Pekka Enberg   2006-01-08  4416) 		       size_t count, loff_t *ppos)
^1da177e (Linus Torvalds 2005-04-16  4417) {
b28a02de (Pekka Enberg   2006-01-08  4418) 	char kbuf[MAX_SLABINFO_WRITE + 1], *tmp;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
