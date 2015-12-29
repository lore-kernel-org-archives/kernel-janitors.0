From: Laurent Navet <laurent.navet@gmail.com>
Date: Tue, 29 Dec 2015 13:36:14 +0000
Subject: Re: [PATCH] resources: Remove unneeded initialization of local variable
Message-Id: <CAH7P7NjofbwyUDjy8bq0NNDr0x_h=xYy9Zm3WxcXK-GhRyJspg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451395493-22380-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1451395493-22380-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bojan Prtvar <prtvar.b@gmail.com>
Cc: toshi.kani@hp.com, dan.j.williams@intel.com, akpm@linux-foundation.org, jsitnicki@gmail.com, jiang.liu@linux.intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

why not directly ?

struct region_devres *dr = devres_alloc(devm_region_release,
sizeof(struct region_devres),..



2015-12-29 14:24 UTC+01:00, Bojan Prtvar <prtvar.b@gmail.com>:
> Few lines below dr is reinitialized by devres_alloc()
> so we don't need to init it by NULL in the beginning of
> __devm_request_region()
>
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
>  kernel/resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/resource.c b/kernel/resource.c
> index f150dbb..1e48ede 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -1356,7 +1356,7 @@ struct resource * __devm_request_region(struct device
> *dev,
>  				struct resource *parent, resource_size_t start,
>  				resource_size_t n, const char *name)
>  {
> -	struct region_devres *dr = NULL;
> +	struct region_devres *dr;
>  	struct resource *res;
>
>  	dr = devres_alloc(devm_region_release, sizeof(struct region_devres),
> --
> 2.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
« On ne résout pas un problème avec les modes de pensée qui l’ont engendré. »
« You cannot solve current problems with current thinking. Current
problems are the result of current thinking »
