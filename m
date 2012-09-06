From: Dan Magenheimer <dan.magenheimer@oracle.com>
Date: Thu, 06 Sep 2012 17:15:48 +0000
Subject: RE: [patch] staging: ramster: fix range checks in zcache_autocreate_pool()
Message-Id: <8d085295-c15d-441c-8463-58cfc7ffc139@default>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120906124020.GA28946@elgon.mountain>
In-Reply-To: <20120906124020.GA28946@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>, devel@driverdev.osuosl.org, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

> From: Dan Carpenter
> Sent: Thursday, September 06, 2012 6:40 AM
> To: Greg Kroah-Hartman
> Cc: Dan Magenheimer; Konrad Rzeszutek Wilk; devel@driverdev.osuosl.org; linux-mm@kvack.org; kernel-
> janitors@vger.kernel.org
> Subject: [patch] staging: ramster: fix range checks in zcache_autocreate_pool()
> 
> If "pool_id" is negative then it leads to a read before the start of the
> array.  If "cli_id" is out of bounds then it leads to a NULL dereference
> of "cli".  GCC would have warned about that bug except that we
> initialized the warning message away.
> 
> Also it's better to put the parameter names into the function
> declaration in the .h file.  It serves as a kind of documentation.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Dan Magenheimer <dan.magenheimer@oracle.com>
Self-flagellated-by: Dan Magenheimer <dan.magenheimer@oracle.com> 

> ---
> BTW, This file has a ton of GCC warnings.  This function returns -1
> on error which is a nonsense return code but the return value is not
> checked anyway.  *Grumble*.
> 
> diff --git a/drivers/staging/ramster/zcache.h b/drivers/staging/ramster/zcache.h
> index c59666e..81722b3 100644
> --- a/drivers/staging/ramster/zcache.h
> +++ b/drivers/staging/ramster/zcache.h
> @@ -42,7 +42,7 @@ extern void zcache_decompress_to_page(char *, unsigned int, struct page *);
>  #ifdef CONFIG_RAMSTER
>  extern void *zcache_pampd_create(char *, unsigned int, bool, int,
>  				struct tmem_handle *);
> -extern int zcache_autocreate_pool(int, int, bool);
> +int zcache_autocreate_pool(unsigned int cli_id, unsigned int pool_id, bool eph);
>  #endif
> 
>  #define MAX_POOLS_PER_CLIENT 16
> diff --git a/drivers/staging/ramster/zcache-main.c b/drivers/staging/ramster/zcache-main.c
> index 24b3d4a..86e19d6 100644
> --- a/drivers/staging/ramster/zcache-main.c
> +++ b/drivers/staging/ramster/zcache-main.c
> @@ -1338,10 +1338,10 @@ static int zcache_local_new_pool(uint32_t flags)
>  	return zcache_new_pool(LOCAL_CLIENT, flags);
>  }
> 
> -int zcache_autocreate_pool(int cli_id, int pool_id, bool eph)
> +int zcache_autocreate_pool(unsigned int cli_id, unsigned int pool_id, bool eph)
>  {
>  	struct tmem_pool *pool;
> -	struct zcache_client *cli = NULL;
> +	struct zcache_client *cli;
>  	uint32_t flags = eph ? 0 : TMEM_POOL_PERSIST;
>  	int ret = -1;
> 
> @@ -1350,8 +1350,10 @@ int zcache_autocreate_pool(int cli_id, int pool_id, bool eph)
>  		goto out;
>  	if (pool_id >= MAX_POOLS_PER_CLIENT)
>  		goto out;
> -	else if ((unsigned int)cli_id < MAX_CLIENTS)
> -		cli = &zcache_clients[cli_id];
> +	if (cli_id >= MAX_CLIENTS)
> +		goto out;
> +
> +	cli = &zcache_clients[cli_id];
>  	if ((eph && disable_cleancache) || (!eph && disable_frontswap)) {
>  		pr_err("zcache_autocreate_pool: pool type disabled\n");
>  		goto out;
