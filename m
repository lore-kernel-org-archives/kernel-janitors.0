From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Wed, 21 Sep 2011 15:33:34 +0000
Subject: Re: [patch] Staging: rtl8192e: off by one in rtl8192_get_channel_map()
Message-Id: <4E7A03CE.5070806@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110921071704.GI4999@elgon.mountain>
In-Reply-To: <20110921071704.GI4999@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 09/21/2011 02:17 AM, Dan Carpenter wrote:
> COUNTRY_CODE_MAX is not a valid country code.  We're off by one here.
> This gets passed to Dot11d_Channelmap() where it's used as an offset
> into the ChannelPlan[] array.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>

Dan, good catch.  Did this cause a problem, or did you find it while reading the 
code?

Larry


>
> diff --git a/drivers/staging/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl_core.c
> index 6530058..1beb04f 100644
> --- a/drivers/staging/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl_core.c
> @@ -1308,7 +1308,7 @@ static short rtl8192_get_channel_map(struct net_device *dev)
>   		return -1;
>   	}
>
> -	if (priv->ChannelPlan>  COUNTRY_CODE_MAX) {
> +	if (priv->ChannelPlan>= COUNTRY_CODE_MAX) {
>   		printk(KERN_INFO "rtl819x_init:Error channel plan! Set to "
>   		       "default.\n");
>   		priv->ChannelPlan = COUNTRY_CODE_FCC;
>

