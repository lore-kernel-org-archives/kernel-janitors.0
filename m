From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Fri, 24 Feb 2017 12:37:30 +0000
Subject: Re: [PATCH] staging: bcm2835: Fix a memory leak in error handling path
Message-Id: <6585ca42-71f4-1517-c6fc-b9ed2f23c687@i2se.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219103412.10092-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170219103412.10092-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi Christophe,

Am 19.02.2017 um 11:34 schrieb Christophe JAILLET:
> If 'kzalloc()' fails, we should release resources allocated so far, just as
> done in all other cases in this function.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure that the error handling path is correct.
> Is 'gdev[0]' freed? Should it be?

sorry, didn't checked your patch yet. Currently there are 3 bcm2835 
drivers in staging (vchiq, camera, audio). So please resend with a more 
distinct subject.

Thanks
Stefan

> ---
>   drivers/staging/media/platform/bcm2835/bcm2835-camera.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/platform/bcm2835/bcm2835-camera.c b/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
> index ca15a698e018..9651b9bc3439 100644
> --- a/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
> +++ b/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
> @@ -1914,8 +1914,10 @@ static int __init bm2835_mmal_init(void)
>   
>   	for (camera = 0; camera < num_cameras; camera++) {
>   		dev = kzalloc(sizeof(struct bm2835_mmal_dev), GFP_KERNEL);
> -		if (!dev)
> -			return -ENOMEM;
> +		if (!dev) {
> +			ret = -ENOMEM;
> +			goto free_dev;
> +		}
>   
>   		dev->camera_num = camera;
>   		dev->max_width = resolutions[camera][0];

