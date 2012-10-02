From: Boaz Harrosh <bharrosh@panasas.com>
Date: Tue, 02 Oct 2012 21:38:23 +0000
Subject: Re: [patch] ore: signedness bug in _sp2d_min_pg()
Message-Id: <506B5ECF.6050409@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002082845.GH12398@elgon.mountain>
In-Reply-To: <20121002082845.GH12398@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/02/2012 01:28 AM, Dan Carpenter wrote:
> This for loop doesn't work correctly when "p" is unsigned.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

My god, yes thanks.

It is a sure overrun crash. I wonder why it never hit till
today.

Thanks will apply ASAP
Boaz

> diff --git a/fs/exofs/ore_raid.c b/fs/exofs/ore_raid.c
> index 5f376d1..b963f38 100644
> --- a/fs/exofs/ore_raid.c
> +++ b/fs/exofs/ore_raid.c
> @@ -203,7 +203,7 @@ static unsigned _sp2d_min_pg(struct __stripe_pages_2d *sp2d)
>  
>  static unsigned _sp2d_max_pg(struct __stripe_pages_2d *sp2d)
>  {
> -	unsigned p;
> +	int p;
>  
>  	for (p = sp2d->pages_in_unit - 1; p >= 0; --p) {
>  		struct __1_page_stripe *_1ps = &sp2d->_1p_stripes[p];
> 


