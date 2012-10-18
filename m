From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Thu, 18 Oct 2012 03:10:06 +0000
Subject: [shaggy:loop_v3 16/22] drivers/block/loop.c:217:6: sparse: symbol 'lo_rw_aio_complete' was not decla
Message-Id: <20121018031006.GK21995@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121017154411.GA21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121017154411.GA21995@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Zach,

FYI, there are new sparse warnings show up in

tree:   git://github.com/kleikamp/linux-shaggy loop_v3
head:   d6e600319940e6015af553f1515cee9d53a3ced9
commit: c6aadd9b8fd4039534075531b06c8dc263f27c9d [16/22] loop: use aio to perform io on the underlying file

+ drivers/block/loop.c:217:6: sparse: symbol 'lo_rw_aio_complete' was not declared. Should it be static?
  drivers/block/loop.c:270:38: sparse: incorrect type in argument 2 (different address spaces)
  drivers/block/loop.c:270:38:    expected char const [noderef] <asn:1>*<noident>
  drivers/block/loop.c:270:38:    got unsigned char [usertype] *buf

vim +217 drivers/block/loop.c

73285082 Ken Chen         2007-05-08  201  	set_capacity(lo->lo_disk, x);
7035b5df Dmitry Monakhov  2011-11-16  202  	return 0;
^1da177e Linus Torvalds   2005-04-16  203  }
^1da177e Linus Torvalds   2005-04-16  204  
^1da177e Linus Torvalds   2005-04-16  205  static inline int
^1da177e Linus Torvalds   2005-04-16  206  lo_do_transfer(struct loop_device *lo, int cmd,
^1da177e Linus Torvalds   2005-04-16  207  	       struct page *rpage, unsigned roffs,
^1da177e Linus Torvalds   2005-04-16  208  	       struct page *lpage, unsigned loffs,
^1da177e Linus Torvalds   2005-04-16  209  	       int size, sector_t rblock)
^1da177e Linus Torvalds   2005-04-16  210  {
^1da177e Linus Torvalds   2005-04-16  211  	if (unlikely(!lo->transfer))
^1da177e Linus Torvalds   2005-04-16  212  		return 0;
^1da177e Linus Torvalds   2005-04-16  213  
^1da177e Linus Torvalds   2005-04-16  214  	return lo->transfer(lo, cmd, rpage, roffs, lpage, loffs, size, rblock);
^1da177e Linus Torvalds   2005-04-16  215  }
^1da177e Linus Torvalds   2005-04-16  216  
c6aadd9b From: Zach Brown 2012-10-15 @217  void lo_rw_aio_complete(u64 data, long res)
c6aadd9b From: Zach Brown 2012-10-15  218  {
c6aadd9b From: Zach Brown 2012-10-15  219  	struct bio *bio = (struct bio *)(uintptr_t)data;
c6aadd9b From: Zach Brown 2012-10-15  220  
c6aadd9b From: Zach Brown 2012-10-15  221  	if (res > 0)
c6aadd9b From: Zach Brown 2012-10-15  222  		res = 0;
c6aadd9b From: Zach Brown 2012-10-15  223  	else if (res < 0)
c6aadd9b From: Zach Brown 2012-10-15  224  		res = -EIO;
c6aadd9b From: Zach Brown 2012-10-15  225  

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
