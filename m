From: walter harms <wharms@bfs.de>
Date: Thu, 12 Jul 2012 16:19:29 +0000
Subject: Re: [patch] Extcon: Arizona: unlock on an error in arizona_micdet()
Message-Id: <4FFEF911.5010001@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063602.GG11812@elgon.mountain>
In-Reply-To: <20120711063602.GG11812@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 11.07.2012 08:36, schrieb Dan Carpenter:
> Smatch complains about this.  I don't have a way to test this, but it
> does look like we should unlock on error here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index b068bc9..4782884 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -154,6 +154,7 @@ static irqreturn_t arizona_micdet(int irq, void *data)
>  	ret = regmap_read(arizona->regmap, ARIZONA_MIC_DETECT_3, &val);
>  	if (ret != 0) {
>  		dev_err(arizona->dev, "Failed to read MICDET: %d\n", ret);
> +		mutex_unlock(&info->lock);
>  		return IRQ_NONE;
>  	}
>  
> --
nitpicking:
normally you unlock before dev_err() and is the msg ok ?
IMHO  "Failed to read ARIZONA_MIC_DETECT_3:%d\n" seems more obvious,
(I really do not know that device)

re,
 wh
