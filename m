From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 15 Jun 2020 15:57:38 +0000
Subject: Re: [PATCH v2] drm/etnaviv: fix ref count leak via pm_runtime_get_sync
Message-Id: <77698453-95ba-5e99-bba5-2ca4a4918026@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, linux+etnaviv@armlinux.org.uk
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen McCamant <mccamant@cs.umn.edu>, Andy Shevchenko <andy.shevchenko@gmail.com>, Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>

…
> In case of failure, decrement the ref count before returning.

Can it be nicer to use the term “reference count” here?

Will the tag “Fixes” become helpful for the commit message?


…
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
…
> @@ -1326,6 +1331,7 @@  struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
>  	ret = event_alloc(gpu, nr_events, event);
>  	if (ret) {
>  		DRM_ERROR("no free events\n");
> +		pm_runtime_put_noidle(gpu->dev);
>  		return NULL;
>  	}

I suggest to move a bit of exception handling code to the end of
this function implementation so that it can be better reused after
the addition of a jump target like “put_runtime”.

Regards,
Markus
