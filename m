From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Tue, 19 May 2015 18:49:28 +0000
Subject: Re: [patch] target: testing for NULL instead of IS_ERR
Message-Id: <1432061368.19713.4.camel@haakon3.risingtidesystems.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150519120502.GC12107@mwanda>
In-Reply-To: <20150519120502.GC12107@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2015-05-19 at 15:05 +0300, Dan Carpenter wrote:
> core_tpg_alloc_lun() returns ERR_PTRs, it never returns NULL.
> 
> Fixes: b865ae297e42 ('target: Convert se_portal_group->tpg_lun_list[] to RCU hlist')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/target/target_core_fabric_configfs.c b/drivers/target/target_core_fabric_configfs.c
> index a0e2946..9be8030 100644
> --- a/drivers/target/target_core_fabric_configfs.c
> +++ b/drivers/target/target_core_fabric_configfs.c
> @@ -898,8 +898,8 @@ static struct config_group *target_fabric_make_lun(
>  		return ERR_PTR(-EINVAL);
>  
>  	lun = core_tpg_alloc_lun(se_tpg, unpacked_lun);
> -	if (!lun)
> -		return ERR_PTR(-ENOMEM);
> +	if (IS_ERR(lun))
> +		return ERR_CAST(lun);
>  
>  	lun_cg = &lun->lun_group;
>  	lun_cg->default_groups = kmalloc(sizeof(struct config_group *) * 2,
> --

Applied to for-next, and will squash into the original commit soon.

Thanks Dan!

--nab

