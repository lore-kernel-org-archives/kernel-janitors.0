From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Wed, 11 Jul 2012 23:55:51 +0000
Subject: Re: [patch] Extcon: Arizona: unlock on an error in arizona_micdet()
Message-Id: <4FFE1287.90403@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063602.GG11812@elgon.mountain>
In-Reply-To: <20120711063602.GG11812@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 07/11/2012 03:36 PM, Dan Carpenter wrote:

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

This patch is right.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
