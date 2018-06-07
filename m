From: Mikulas Patocka <mpatocka@redhat.com>
Date: Thu, 07 Jun 2018 19:19:39 +0000
Subject: Re: [PATCH] dm: writecache: fix autocommit_time option
Message-Id: <alpine.LRH.2.02.1806071518360.17754@file01.intranet.prod.int.rdu2.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180607082838.xbrgbboil4kay7zw@kili.mountain>
In-Reply-To: <20180607082838.xbrgbboil4kay7zw@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dm-devel@redhat.com, kernel-janitors@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>



On Thu, 7 Jun 2018, Dan Carpenter wrote:

> The option is in terms of msecs so we should be using msecs_to_jiffies()
> to convert it instead of the other way around.
> 
> Fixes: 1be8d9c3da01 ("dm: add writecache target")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

OK.

Reviewed-by: Mikulas Patocka <mpatocka@redhat.com>

> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index f2ae02f22c43..c755e8bc6bdd 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -1995,7 +1995,7 @@ static int writecache_ctr(struct dm_target *ti, unsigned argc, char **argv)
>  				goto invalid_optional;
>  			if (autocommit_msecs > 3600000)
>  				goto invalid_optional;
> -			wc->autocommit_jiffies = jiffies_to_msecs(autocommit_msecs);
> +			wc->autocommit_jiffies = msecs_to_jiffies(autocommit_msecs);
>  			wc->autocommit_time_set = true;
>  		} else if (!strcasecmp(string, "fua")) {
>  			if (WC_MODE_PMEM(wc)) {
> 
