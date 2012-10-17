From: Dave Kleikamp <dave.kleikamp@oracle.com>
Date: Wed, 17 Oct 2012 16:29:35 +0000
Subject: Re: [shaggy:loop_v3 16/22] drivers/block/loop.c:219:20: warning: cast to pointer from integer of dif
Message-Id: <507EDCEF.3000307@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121017154411.GA21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121017154411.GA21995@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/17/2012 10:44 AM, Yuanhan Liu wrote:
> Hi Zack,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://github.com/kleikamp/linux-shaggy loop_v3
> head:   b8ee8b4bb91520b2c4a1f567977a737e9e71c449
> commit: 9a9b1c625a5b11d9b90c0ee664eacde0aea6afeb [16/22] loop: use aio to perform io on the underlying file
> config: i386-randconfig-m011 (attached as .config)

That was quick. I just pushed that out to github and hadn't announced it
anywhere. I didn't realize that a new branch on my tree would be
automatically tested, but I'm glad this got caught!

It looks like I need to compile for a 32-bit platform before sending
this out to a larger audience.

Thanks!!
Shaggy

> All warnings:
> 
> drivers/block/loop.c: In function 'lo_rw_aio_complete':
> drivers/block/loop.c:219:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
> drivers/block/loop.c: In function 'lo_rw_aio':
> drivers/block/loop.c:252:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> vim +219 drivers/block/loop.c
> 
> ^1da177e Linus Torvalds   2005-04-16  203  }
> ^1da177e Linus Torvalds   2005-04-16  204  
> ^1da177e Linus Torvalds   2005-04-16  205  static inline int
> ^1da177e Linus Torvalds   2005-04-16  206  lo_do_transfer(struct loop_device *lo, int cmd,
> ^1da177e Linus Torvalds   2005-04-16  207  	       struct page *rpage, unsigned roffs,
> ^1da177e Linus Torvalds   2005-04-16  208  	       struct page *lpage, unsigned loffs,
> ^1da177e Linus Torvalds   2005-04-16  209  	       int size, sector_t rblock)
> ^1da177e Linus Torvalds   2005-04-16  210  {
> ^1da177e Linus Torvalds   2005-04-16  211  	if (unlikely(!lo->transfer))
> ^1da177e Linus Torvalds   2005-04-16  212  		return 0;
> ^1da177e Linus Torvalds   2005-04-16  213  
> ^1da177e Linus Torvalds   2005-04-16  214  	return lo->transfer(lo, cmd, rpage, roffs, lpage, loffs, size, rblock);
> ^1da177e Linus Torvalds   2005-04-16  215  }
> ^1da177e Linus Torvalds   2005-04-16  216  
> 9a9b1c62 From: Zach Brown 2012-10-15  217  void lo_rw_aio_complete(u64 data, long res)
> 9a9b1c62 From: Zach Brown 2012-10-15  218  {
> 9a9b1c62 From: Zach Brown 2012-10-15 @219  	struct bio *bio = (struct bio *)data;
> 9a9b1c62 From: Zach Brown 2012-10-15  220  
> 9a9b1c62 From: Zach Brown 2012-10-15  221  	if (res > 0)
> 9a9b1c62 From: Zach Brown 2012-10-15  222  		res = 0;
> 9a9b1c62 From: Zach Brown 2012-10-15  223  	else if (res < 0)
> 9a9b1c62 From: Zach Brown 2012-10-15  224  		res = -EIO;
> 9a9b1c62 From: Zach Brown 2012-10-15  225  
> 9a9b1c62 From: Zach Brown 2012-10-15  226  	bio_endio(bio, res);
> 9a9b1c62 From: Zach Brown 2012-10-15  227  }
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
> 
