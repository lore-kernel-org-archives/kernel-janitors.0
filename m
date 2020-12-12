From: Jens Axboe <axboe@kernel.dk>
Date: Sat, 12 Dec 2020 18:19:12 +0000
Subject: Re: [PATCH v3] block: drop dead assignments in loop_init()
Message-Id: <c064e9b2-f366-a70e-2016-333be8f03334@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212051302.26008-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201212051302.26008-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org
Cc: Hannes Reinecke <hare@suse.de>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org

On 12/11/20 10:13 PM, Lukas Bulwahn wrote:
> Commit 8410d38c2552 ("loop: use __register_blkdev to allocate devices on
> demand") simplified loop_init(); so computing the range of the block region
> is not required anymore and can be dropped.
> 
> Drop dead assignments in loop_init().
> 
> As compilers will detect these unneeded assignments and optimize this,
> the resulting object code is identical before and after this change.
> 
> No functional change. No change in object code.

Applied, thanks.

-- 
Jens Axboe
