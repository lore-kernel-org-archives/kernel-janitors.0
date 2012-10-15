From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 02:42:30 +0000
Subject: [glommer-memcg:kmemcg-slab 26/33] drivers/firmware/memmap.c:240:19: error: conflicting types for 'me
Message-Id: <20121015024230.GA16122@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Glauber,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git kmemcg-slab
head:   f7dc2a43ce771e73443c82eb25d95f72f8161b45
commit: d17ddfd35a7329643b2fb442ade58e2974a2a05c [26/33] sl[au]b: Allocate objects from memcg cache
config: ia64-allmodconfig # make ARCH=ia64 allmodconfig
branch date: 3 hours ago
commit date: 4 hours ago

All error/warnings:

drivers/firmware/memmap.c:240:19: error: conflicting types for 'memmap_init'
arch/ia64/include/asm/pgtable.h:565:17: note: previous declaration of 'memmap_init' was here

vim +240 drivers/firmware/memmap.c

69ac9cd6 Bernhard Walle            2008-06-27  232  /*
69ac9cd6 Bernhard Walle            2008-06-27  233   * Initialises stuff and adds the entries in the map_entries list to
69ac9cd6 Bernhard Walle            2008-06-27  234   * sysfs. Important is that firmware_map_add() and firmware_map_add_early()
31bad924 Bernhard Walle            2008-08-12  235   * must be called before late_initcall. That's just because that function
31bad924 Bernhard Walle            2008-08-12  236   * is called as late_initcall() function, which means that if you call
31bad924 Bernhard Walle            2008-08-12  237   * firmware_map_add() or firmware_map_add_early() afterwards, the entries
31bad924 Bernhard Walle            2008-08-12  238   * are not added to sysfs.
69ac9cd6 Bernhard Walle            2008-06-27  239   */
69ac9cd6 Bernhard Walle            2008-06-27 @240  static int __init memmap_init(void)
69ac9cd6 Bernhard Walle            2008-06-27  241  {
69ac9cd6 Bernhard Walle            2008-06-27  242  	struct firmware_map_entry *entry;
69ac9cd6 Bernhard Walle            2008-06-27  243  
d96ae530 akpm@linux-foundation.org 2010-03-05  244  	list_for_each_entry(entry, &map_entries, list)
d96ae530 akpm@linux-foundation.org 2010-03-05  245  		add_sysfs_fw_map_entry(entry);
69ac9cd6 Bernhard Walle            2008-06-27  246  
69ac9cd6 Bernhard Walle            2008-06-27  247  	return 0;
69ac9cd6 Bernhard Walle            2008-06-27  248  }

The code at line 240 was first introduced by commit:
69ac9cd sysfs: add /sys/firmware/memmap


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
