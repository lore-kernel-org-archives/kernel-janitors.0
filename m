From: Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 18 Oct 2011 06:20:48 +0000
Subject: Re: [patch] drm/nouveau: testing the wrong variable
Message-Id: <1318918848.2567.0.camel@nisroch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111018060751.GB27732@elgon.mountain>
In-Reply-To: <20111018060751.GB27732@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Martin Peres <martin.peres@ensi-bourges.fr>, Roy Spliet <r.spliet@student.tudelft.nl>

On Tue, 2011-10-18 at 09:07 +0300, Dan Carpenter wrote:
> memtimings is a valid pointer here, the intent was to test for
> kcalloc() failure.
I've queued it, thanks!

Ben.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
> index 9f178aa..33d03fb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_perf.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
> @@ -239,7 +239,7 @@ nouveau_perf_init(struct drm_device *dev)
>  	if(version = 0x15) {
>  		memtimings->timing >  				kcalloc(entries, sizeof(*memtimings->timing), GFP_KERNEL);
> -		if(!memtimings) {
> +		if (!memtimings->timing) {
>  			NV_WARN(dev,"Could not allocate memtiming table\n");
>  			return;
>  		}


