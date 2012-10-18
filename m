From: Dave Kleikamp <dave.kleikamp@oracle.com>
Date: Thu, 18 Oct 2012 19:32:14 +0000
Subject: Re: [shaggy:loop_v3 16/22] drivers/block/loop.c:239:2: error: implicit declaration of function 'aio_
Message-Id: <5080593E.4060707@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121017154411.GA21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121017154411.GA21995@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/17/2012 10:19 PM, Yuanhan Liu wrote:
> Hi Zach,
> 
> FYI, kernel build failed on
> 
> tree:   git://github.com/kleikamp/linux-shaggy loop_v3
> head:   b8ee8b4bb91520b2c4a1f567977a737e9e71c449
> commit: 9a9b1c625a5b11d9b90c0ee664eacde0aea6afeb [16/22] loop: use aio to perform io on the underlying file
> config: x86_64-randconfig-x269 (attached as .config)
> 
> All error/warnings:
> 
> drivers/block/loop.c: In function 'lo_rw_aio':
> drivers/block/loop.c:239:2: error: implicit declaration of function 'aio_kernel_alloc' [-Werror=implicit-function-declaration]
> drivers/block/loop.c:239:7: warning: assignment makes pointer from integer without a cast [enabled by default]
> drivers/block/loop.c:251:2: error: implicit declaration of function 'aio_kernel_init_iter' [-Werror=implicit-function-declaration]
> drivers/block/loop.c:252:2: error: implicit declaration of function 'aio_kernel_init_callback' [-Werror=implicit-function-declaration]
> drivers/block/loop.c:254:2: error: implicit declaration of function 'aio_kernel_submit' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

I didn't even realize CONFIG_AIO existed and could be undefined. It's
easy enough to put ifdef's around the new code.

Thanks,
Shaggy

> vim +239 drivers/block/loop.c
> 
> 9a9b1c62 From: Zach Brown 2012-10-15  233  	unsigned short op;
> 9a9b1c62 From: Zach Brown 2012-10-15  234  	struct iov_iter iter;
> 9a9b1c62 From: Zach Brown 2012-10-15  235  	struct bio_vec *bvec;
> 9a9b1c62 From: Zach Brown 2012-10-15  236  	size_t nr_segs;
> 9a9b1c62 From: Zach Brown 2012-10-15  237  	loff_t pos = ((loff_t) bio->bi_sector << 9) + lo->lo_offset;
> 9a9b1c62 From: Zach Brown 2012-10-15  238  
> 9a9b1c62 From: Zach Brown 2012-10-15 @239  	iocb = aio_kernel_alloc(GFP_NOIO);
> 9a9b1c62 From: Zach Brown 2012-10-15  240  	if (!iocb)
> 9a9b1c62 From: Zach Brown 2012-10-15  241  		return -ENOMEM;
> 9a9b1c62 From: Zach Brown 2012-10-15  242  
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
> 
