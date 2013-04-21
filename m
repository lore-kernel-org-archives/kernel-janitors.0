From: walter harms <wharms@bfs.de>
Date: Sun, 21 Apr 2013 11:56:57 +0000
Subject: Re: [patch] gru: info leak in gru_get_config_info()
Message-Id: <5173D409.8010405@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130421111031.GE6171@elgon.mountain>
In-Reply-To: <20130421111031.GE6171@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dimitri Sivanich <sivanich@sgi.com>, Robin Holt <holt@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 21.04.2013 13:10, schrieb Dan Carpenter:
> The "info.fill" array isn't initialized so it can leak uninitialized
> stack information to user space.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/misc/sgi-gru/grufile.c b/drivers/misc/sgi-gru/grufile.c
> index 44d273c..ed5fc43 100644
> --- a/drivers/misc/sgi-gru/grufile.c
> +++ b/drivers/misc/sgi-gru/grufile.c
> @@ -176,6 +176,7 @@ static long gru_get_config_info(unsigned long arg)
>  	info.nodes = num_online_nodes();
>  	info.blades = info.nodes / nodesperblade;
>  	info.chiplets = GRU_CHIPLETS_PER_BLADE * info.blades;
> +	memset(&info.fill, 0, sizeof(info.fill));
>  

the other way around (clear first all bytes) looks more easy
in case someone will add more elements to the struct.

memset(&info, 0, sizeof(info));
info.nodes = num_online_nodes();
info.blades = info.nodes / nodesperblade;
....

re,
 wh


>  	if (copy_to_user((void __user *)arg, &info, sizeof(info)))
>  		return -EFAULT;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
