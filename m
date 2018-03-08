From: Brad Love <brad@nextdimension.cc>
Date: Thu, 08 Mar 2018 14:11:24 +0000
Subject: Re: [PATCH] media: em28xx-cards: fix em28xx_duplicate_dev()
Message-Id: <269c6f7b-323f-97e0-8c34-bd25c3dbabfc@nextdimension.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180308093100.GA16525@mwanda>
In-Reply-To: <20180308093100.GA16525@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Brad Love <brad@nextdimension.cc>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,


On 2018-03-08 03:31, Dan Carpenter wrote:
> There is a double sizeof() typo here so we don't duplicate the struct
> properly.
>
> Fixes: be7fd3c3a8c5 ("media: em28xx: Hauppauge DualHD second tuner functionality")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index 6e8247849c4f..6e0e67d23876 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -3515,7 +3515,7 @@ static int em28xx_duplicate_dev(struct em28xx *dev)
>  		dev->dev_next = NULL;
>  		return -ENOMEM;
>  	}
> -	memcpy(sec_dev, dev, sizeof(sizeof(*sec_dev)));
> +	memcpy(sec_dev, dev, sizeof(*sec_dev));
>  	/* Check to see next free device and mark as used */
>  	do {
>  		nr = find_first_zero_bit(em28xx_devused, EM28XX_MAXBOARDS);


Ouch, good catch. Strangely everything still worked in 64bit builds, and
I've had no reports of wonky behaviour elsewhere.

Cheers,

Brad


