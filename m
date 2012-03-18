From: walter harms <wharms@bfs.de>
Date: Sun, 18 Mar 2012 14:43:02 +0000
Subject: Re: [PATCH] [media] staging: use mutex_lock() in s2250_probe().
Message-Id: <4F65F476.70002@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1332005817-10762-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1332005817-10762-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: mchehab@infradead.org, oliver@neukum.org, gregkh@linuxfoundation.org, khoroshilov@ispras.ru, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 17.03.2012 18:36, schrieb santosh nayak:
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Use uninterruptable sleep lock  'mutex_lock()'  in place of
> mutex_lock_interruptible() because there is no userspace
> for s2250_probe().
> 
> Return -ENOMEM   if kzalloc() fails to allocate and initialize.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
> ---
>  drivers/staging/media/go7007/s2250-board.c |   43 +++++++++++++++------------
>  1 files changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/media/go7007/s2250-board.c b/drivers/staging/media/go7007/s2250-board.c
> index 014d384..1406a37 100644
> --- a/drivers/staging/media/go7007/s2250-board.c
> +++ b/drivers/staging/media/go7007/s2250-board.c
> @@ -637,27 +637,32 @@ static int s2250_probe(struct i2c_client *client,
>  	state->audio_input = 0;
>  	write_reg(client, 0x08, 0x02); /* Line In */
>  
> -	if (mutex_lock_interruptible(&usb->i2c_lock) = 0) {
> -		data = kzalloc(16, GFP_KERNEL);
> -		if (data != NULL) {
> -			int rc;
> -			rc = go7007_usb_vendor_request(go, 0x41, 0, 0,
> -						       data, 16, 1);
> -			if (rc > 0) {
> -				u8 mask;
> -				data[0] = 0;
> -				mask = 1<<5;
> -				data[0] &= ~mask;
> -				data[1] |= mask;
> -				go7007_usb_vendor_request(go, 0x40, 0,
> -							  (data[1]<<8)
> -							  + data[1],
> -							  data, 16, 0);
> -			}
> -			kfree(data);
> -		}
> +	mutex_lock(&usb->i2c_lock);
> +	data = kzalloc(16, GFP_KERNEL);
> +	if (data = NULL) {
> +		i2c_unregister_device(audio);
> +		kfree(state);
>  		mutex_unlock(&usb->i2c_lock);
> +		return -ENOMEM;
> +	} else {
> +		int rc;
> +		rc = go7007_usb_vendor_request(go, 0x41, 0, 0,
> +					       data, 16, 1);
> +		if (rc > 0) {
> +			u8 mask;
> +			data[0] = 0;
> +			mask = 1<<5;
> +			data[0] &= ~mask;
> +			data[1] |= mask;
> +			go7007_usb_vendor_request(go, 0x40, 0,
> +						  (data[1]<<8)
> +						  + data[1],
> +						  data, 16, 0);
> +		}
> +		kfree(data);
>  	}
> +	mutex_unlock(&usb->i2c_lock);
> +
>  
>  	v4l2_info(sd, "initialized successfully\n");
>  	return 0;

hi,
You can drop the else
1. there is no 3. way
2. you can save 1 indent level

just one question: the (data[1]<<8)+ data[1] is intended ? always data[1] ?
(i have no clue, it is the original code, it just feels .. strange )

re,
 wh
