From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Sep 2017 08:49:11 +0000
Subject: Re: [PATCH 5/6] [media] go7007: Use common error handling code in go7007_snd_init()
Message-Id: <20170919084911.zknru7vuhafljuxb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b36ece3f-0f31-9bb6-14ae-c4abf7cd23ee@users.sourceforge.net>
 <05efac78-3a14-803c-5b4a-68670728628b@users.sourceforge.net>
In-Reply-To: <05efac78-3a14-803c-5b4a-68670728628b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Sep 18, 2017 at 03:58:37PM +0200, SF Markus Elfring wrote:
> diff --git a/drivers/media/usb/go7007/snd-go7007.c b/drivers/media/usb/go7007/snd-go7007.c
> index 68e421bf38e1..7ae4d03ed3f7 100644
> --- a/drivers/media/usb/go7007/snd-go7007.c
> +++ b/drivers/media/usb/go7007/snd-go7007.c
> @@ -243,22 +243,18 @@ int go7007_snd_init(struct go7007 *go)
>  	gosnd->capturing = 0;
>  	ret = snd_card_new(go->dev, index[dev], id[dev], THIS_MODULE, 0,
>  			   &gosnd->card);
> -	if (ret < 0) {
> -		kfree(gosnd);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto free_snd;
> +
>  	ret = snd_device_new(gosnd->card, SNDRV_DEV_LOWLEVEL, go,
>  			&go7007_snd_device_ops);
> -	if (ret < 0) {
> -		kfree(gosnd);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto free_snd;
> +


I think the original code is buggy.  It should probably call
snd_card_free() if snd_device_new() fails.

regards,
dan carpenter

