From: Daniel Mack <daniel@zonque.org>
Date: Sat, 12 Aug 2017 07:30:29 +0000
Subject: Re: [PATCH] ALSA: usb: caiaq: audio: Delete two error messages for a failed memory allocation in all
Message-Id: <2a7e484c-260f-b3d5-ea24-7fa22004e705@zonque.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cb2a553-e247-f432-48ef-1a7438416366@users.sourceforge.net>
In-Reply-To: <8cb2a553-e247-f432-48ef-1a7438416366@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, alsa-devel@alsa-project.org, Daniel Mack <zonque@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 08/11/2017 08:00 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 11 Aug 2017 19:39:06 +0200
> 
> Omit extra messages for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Daniel Mack <daniel@zonque.org>



> ---
>  sound/usb/caiaq/audio.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
> index 8f66ba730d69..1f306155e76a 100644
> --- a/sound/usb/caiaq/audio.c
> +++ b/sound/usb/caiaq/audio.c
> @@ -731,7 +731,6 @@ static struct urb **alloc_urbs(struct snd_usb_caiaqdev *cdev, int dir, int *ret)
>  
>  	urbs = kmalloc(N_URBS * sizeof(*urbs), GFP_KERNEL);
>  	if (!urbs) {
> -		dev_err(dev, "unable to kmalloc() urbs, OOM!?\n");
>  		*ret = -ENOMEM;
>  		return NULL;
>  	}
> @@ -746,7 +745,6 @@ static struct urb **alloc_urbs(struct snd_usb_caiaqdev *cdev, int dir, int *ret)
>  		urbs[i]->transfer_buffer >  			kmalloc(FRAMES_PER_URB * BYTES_PER_FRAME, GFP_KERNEL);
>  		if (!urbs[i]->transfer_buffer) {
> -			dev_err(dev, "unable to kmalloc() transfer buffer, OOM!?\n");
>  			*ret = -ENOMEM;
>  			return urbs;
>  		}
> 

