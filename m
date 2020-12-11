From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 11 Dec 2020 19:29:19 +0000
Subject: Re: [PATCH v2] block: drop dead assignments in loop_init()
Message-Id: <511d884a-ed95-5e9f-0fea-b859355a6c7f@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201211184604.27646-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201211184604.27646-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org
Cc: Hannes Reinecke <hare@suse.de>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org

On 12/11/20 11:46 AM, Lukas Bulwahn wrote:
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
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> v1 -> v2:
>   - replaced if block with ternary operator after Julia's style comment
> 
> Christoph, please ack.
> 
> Jens, please pick this minor non-urgent clean-up patch on your
> block -next tree on top of Christoph's commit above.
> 
>  drivers/block/loop.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index d2ce1ddc192d..10c7c154c114 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -2304,7 +2304,6 @@ MODULE_ALIAS("devname:loop-control");
>  static int __init loop_init(void)
>  {
>  	int i, nr;
> -	unsigned long range;
>  	struct loop_device *lo;
>  	int err;
>  
> @@ -2341,13 +2340,7 @@ static int __init loop_init(void)
>  	 * /dev/loop-control interface, or be instantiated by accessing
>  	 * a 'dead' device node.
>  	 */
> -	if (max_loop) {
> -		nr = max_loop;
> -		range = max_loop << part_shift;
> -	} else {
> -		nr = CONFIG_BLK_DEV_LOOP_MIN_COUNT;
> -		range = 1UL << MINORBITS;
> -	}
> +	nr = max_loop ? max_loop : CONFIG_BLK_DEV_LOOP_MIN_COUNT;

I greatly prefer an if/else to ternary, it's a lot easier to read imho.

-- 
Jens Axboe
