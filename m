From: walter harms <wharms@bfs.de>
Date: Fri, 22 Jul 2016 16:41:38 +0000
Subject: Re: [PATCH 2/4] GPU-DRM-Etnaviv: Delete unnecessary if statement in __etnaviv_gem_new()
Message-Id: <57924CC2.5030309@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.so
 urceforge.net> <00ca5af9-674a-73ce-b423-1ce41d426942@users.sourceforge.net> <d1d2c154-0097-9630-f9ed-9ee55de03a24@users.sourceforge.net>
In-Reply-To: <d1d2c154-0097-9630-f9ed-9ee55de03a24@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>



Am 22.07.2016 17:48, schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 22 Jul 2016 16:45:22 +0200
> 
> Move a return statement into a block for successful function execution.
> Omit a duplicate check for the local variable "ret" then at the end.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 8eee742..851a8ba 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -661,13 +661,9 @@ static struct drm_gem_object *__etnaviv_gem_new(struct drm_device *dev,
>  		 */
>  		mapping = obj->filp->f_mapping;
>  		mapping_set_gfp_mask(mapping, GFP_HIGHUSER);
> +		return obj;
>  	}
>  
> -	if (ret)
> -		goto fail;
> -
> -	return obj;
> -
>  fail:
>  	drm_gem_object_unreference_unlocked(obj);
>  	return ERR_PTR(ret);


From the program flow an readability it would be more nice the branch on error

 ret = drm_gem_object_init(dev, obj, size);
 if (ret)
	goto fail;


just m 2 cents

re,
 wh
