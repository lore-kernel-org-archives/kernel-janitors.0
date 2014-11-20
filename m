From: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 20 Nov 2014 04:17:50 +0000
Subject: Re: [PATCH 1/1] DRM-UDL: Deletion of an unnecessary check before the function call "vunmap"
Message-Id: <149cb6ba1c8.2771.879d79c6f3490faa837fa11cb97f42bf@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <546CC755.4010804@users.sourceforge.net>
In-Reply-To: <546CC755.4010804@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On November 19, 2014 5:42:26 PM SF Markus Elfring 
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Nov 2014 17:33:32 +0100
>
> The vunmap() function performes also input parameter validation. Thus the test
> around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/udl/udl_gem.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_gem.c
> index 8044f5f..2979625 100644
> --- a/drivers/gpu/drm/udl/udl_gem.c
> +++ b/drivers/gpu/drm/udl/udl_gem.c
> @@ -164,8 +164,7 @@ void udl_gem_vunmap(struct udl_gem_object *obj)
>  		return;
>  	}
>
> -	if (obj->vmapping)
> -		vunmap(obj->vmapping);
> +	vunmap(obj->vmapping);
>
>  	udl_gem_put_pages(obj);
>  }

Reviewed-by: Thierry Reding <thierry.reding@gmail.com>


