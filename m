From: Sinclair Yeh <syeh@vmware.com>
Date: Fri, 22 Jul 2016 15:33:36 +0000
Subject: Re: [PATCH] drm/vmwgfx: Delete an unnecessary check before the function call "vfree"
Message-Id: <20160722153335.GB4008@promb-2n-dhcp144.eng.vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <546CCB7E.3050109@users.sourceforge.net>
 <559A35C9.8050201@users.sourceforge.net>
 <8060f2e9-5070-3c10-d55c-dc058e4ca20d@users.sourceforge.net>
In-Reply-To: <8060f2e9-5070-3c10-d55c-dc058e4ca20d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Junwang Zhao <zhjwpku@gmail.com>, Thomas Hellstrom <thellstrom@vmware.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Looks good.  Thanks!

Reviewed-by: Sinclair Yeh <syeh@vmware.com>

On Fri, Jul 22, 2016 at 01:45:40PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 22 Jul 2016 13:31:00 +0200
> 
> The vfree() function performs also input parameter validation.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 1a1a87c..dc5beff 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3625,9 +3625,7 @@ static int vmw_resize_cmd_bounce(struct vmw_sw_context *sw_context,
>  				   (sw_context->cmd_bounce_size >> 1));
>  	}
>  
> -	if (sw_context->cmd_bounce != NULL)
> -		vfree(sw_context->cmd_bounce);
> -
> +	vfree(sw_context->cmd_bounce);
>  	sw_context->cmd_bounce = vmalloc(sw_context->cmd_bounce_size);
>  
>  	if (sw_context->cmd_bounce = NULL) {
> -- 
> 2.9.2
> 
