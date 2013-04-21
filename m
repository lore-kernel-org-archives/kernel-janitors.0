From: Dimitri Sivanich <sivanich@sgi.com>
Date: Sun, 21 Apr 2013 17:33:34 +0000
Subject: Re: [patch v2] gru: info leak in gru_get_config_info()
Message-Id: <20130421173334.GA9023@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130421131902.GT3658@sgi.com>
 <20130421170107.GA16118@elgon.mountain>
In-Reply-To: <20130421170107.GA16118@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Robin Holt <holt@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, walter harms <wharms@bfs.de>

Acked-by: Dimitri Sivanich <sivanich@sgi.com>

On Sun, Apr 21, 2013 at 08:01:07PM +0300, Dan Carpenter wrote:
> The "info.fill" array isn't initialized so it can leak uninitialized
> stack information to user space.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: style changes
> 
> diff --git a/drivers/misc/sgi-gru/grufile.c b/drivers/misc/sgi-gru/grufile.c
> index 44d273c..0535d1e 100644
> --- a/drivers/misc/sgi-gru/grufile.c
> +++ b/drivers/misc/sgi-gru/grufile.c
> @@ -172,6 +172,7 @@ static long gru_get_config_info(unsigned long arg)
>  		nodesperblade = 2;
>  	else
>  		nodesperblade = 1;
> +	memset(&info, 0, sizeof(info));
>  	info.cpus = num_online_cpus();
>  	info.nodes = num_online_nodes();
>  	info.blades = info.nodes / nodesperblade;
