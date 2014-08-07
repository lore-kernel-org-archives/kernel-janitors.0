From: Jeff Moyer <jmoyer@redhat.com>
Date: Thu, 07 Aug 2014 21:41:54 +0000
Subject: Re: [PATCH 2/4] gdrom: fix error return code
Message-Id: <x49wqak9dul.fsf@segfault.boston.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407445067-4044-1-git-send-email-Julia.Lawall@lip6.fr>
	<1407445067-4044-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407445067-4044-2-git-send-email-Julia.Lawall@lip6.fr> (Julia
	Lawall's message of "Thu, 7 Aug 2014 22:57:44 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

> diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
> index 584bc31..46ecd95 100644
> --- a/drivers/cdrom/gdrom.c
> +++ b/drivers/cdrom/gdrom.c
> @@ -807,16 +807,20 @@ static int probe_gdrom(struct platform_device *devptr)
>  	if (err)
>  		goto probe_fail_cmdirq_register;
>  	gd.gdrom_rq = blk_init_queue(gdrom_request, &gdrom_lock);
> -	if (!gd.gdrom_rq)
> +	if (!gd.gdrom_rq) {
> +		err = -ENOMEM;
>  		goto probe_fail_requestq;
> +	}
>  
>  	err = probe_gdrom_setupqueue();
>  	if (err)
>  		goto probe_fail_toc;
>  
>  	gd.toc = kzalloc(sizeof(struct gdromtoc), GFP_KERNEL);
> -	if (!gd.toc)
> +	if (!gd.toc) {
> +		err = -ENOMEM;
>  		goto probe_fail_toc;
> +	}

Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
