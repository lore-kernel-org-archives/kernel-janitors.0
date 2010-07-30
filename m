From: Nishanth Menon <nm@ti.com>
Date: Fri, 30 Jul 2010 12:38:17 +0000
Subject: Re: [PATCH 7/9] staging: tidspbridge: fix memory leak
Message-Id: <4C52C7B9.7000209@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280488163-20939-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280488163-20939-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, "Sapiens, Rene" <rene.sapiens@ti.com>, Felipe Contreras <felipe.contreras@gmail.com>, "Ramirez Luna, Omar" <omar.ramirez@ti.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>

Kulikov Vasiliy had written, on 07/30/2010 06:09 AM, the following:
> dbll_create() leaks pzl_target if target_obj is NULL. Call kzalloc()
> only if memory is used.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/staging/tidspbridge/pmgr/dbll.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/tidspbridge/pmgr/dbll.c b/drivers/staging/tidspbridge/pmgr/dbll.c
> index 3636aa3..86840ce 100644
> --- a/drivers/staging/tidspbridge/pmgr/dbll.c
> +++ b/drivers/staging/tidspbridge/pmgr/dbll.c
> @@ -247,9 +247,9 @@ int dbll_create(struct dbll_tar_obj **target_obj,
>  	DBC_REQUIRE(pattrs != NULL);
>  	DBC_REQUIRE(target_obj != NULL);
>  
> -	/* Allocate DBL target object */
> -	pzl_target = kzalloc(sizeof(struct dbll_tar_obj), GFP_KERNEL);
>  	if (target_obj != NULL) {
> +		/* Allocate DBL target object */
> +		pzl_target = kzalloc(sizeof(struct dbll_tar_obj), GFP_KERNEL);
>  		if (pzl_target = NULL) {
>  			*target_obj = NULL;
>  			status = -ENOMEM;
I would suggest to add a else branch for if (target_obj != NULL) adding 
a status =-ENOMEM if error.

Overall, I guess we need to kick out the DBC_REQUIRE usage.. it is 
misleading as it is active only when DEBUG macro is enabled!

-- 
Regards,
Nishanth Menon
