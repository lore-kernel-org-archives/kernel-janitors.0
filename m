From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 26 Sep 2012 07:59:53 +0000
Subject: Re: [block:for-3.7/core 20/21] fs/block_dev.c:1644:5: sparse: symbol 'blkdev_mmap' was not declared.
Message-Id: <5062B5F9.70100@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926074236.GB26028@localhost>
In-Reply-To: <20120926074236.GB26028@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2012-09-26 09:42, Fengguang Wu wrote:
> Hi Jens,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.dk/linux-block.git for-3.7/core
> head:   62ac665ff9fc07497ca524bd20d6a96893d11071
> commit: b87570f5d349661814b262dd5fc40787700f80d6 [20/21] Fix a crash when block device is read and block size is changed at the same time
> 
> + fs/block_dev.c:1644:5: sparse: symbol 'blkdev_mmap' was not declared. Should it be static?
> 
> Please consider folding the attached diff :-)

Thanks Wu, you are (as usual) exceptionally fast :-)

Patch applied.

-- 
Jens Axboe

