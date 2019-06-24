From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 24 Jun 2019 06:37:18 +0000
Subject: Re: [PATCH] staging: bcm2835-camera: Avoid apotential sleep while holding a spin_lock
Message-Id: <20190624063718.GD31913@osadl.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190624053351.5217-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190624053351.5217-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: stefan.wahren@i2se.com, devel@driverdev.osuosl.org, f.fainelli@gmail.com, sbranden@broadcom.com, tuomas.tynkkynen@iki.fi, rjui@broadcom.com, hofrat@osadl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, tobias.buettner@fau.de, eric@anholt.net, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, gregkh@linuxfoundation.org, inf.braun@fau.de, linux-arm-kernel@lists.infradead.org

On Mon, Jun 24, 2019 at 07:33:51AM +0200, Christophe JAILLET wrote:
> Do not allocate memory with GFP_KERNEL when holding a spin_lock, it may
> sleep. Use GFP_NOWAIT instead.
>

checking for this in the rest of the kernel with a cocci spatch
<snip>
virtual report

@nonatomic@
position p;
identifier var;
@@

  spin_lock(...)
  ... when != spin_unlock(...)
* var = idr_alloc@p(...,GFP_KERNEL);
  ... when != spin_unlock(...)
  spin_unlock(...);
<snip>
this seems to be the only instance of this specific problem.

> Fixes: 950fd867c635 ("staging: bcm2835-camera: Replace open-coded idr with a struct idr.")

The GFP_KERNEL actually was there befor this patch so not sure if this Fixes
ref is correct - I think the GFP_KERNEL was introduced in:
4e6bafdfb9f3 ("staging: bcm2835_camera: Use a mapping table for context field of mmal_msg_header")

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Nicholas Mc Guire <hofrat@osadl.org>

> ---
>  drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
> index 16af735af5c3..438d548c6e24 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
> @@ -186,7 +186,7 @@ get_msg_context(struct vchiq_mmal_instance *instance)
>  	 */
>  	spin_lock(&instance->context_map_lock);
>  	handle = idr_alloc(&instance->context_map, msg_context,
> -			   0, 0, GFP_KERNEL);
> +			   0, 0, GFP_NOWAIT);
>  	spin_unlock(&instance->context_map_lock);
>  
>  	if (handle < 0) {
> -- 
> 2.20.1
> 
