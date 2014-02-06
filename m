From: Nithin Nayak Sujir <nsujir@broadcom.com>
Date: Thu, 06 Feb 2014 00:10:23 +0000
Subject: Re: [patch] tg3: cleanup an error path in tg3_phy_reset_5703_4_5()
Message-Id: <52F2D2EF.2010508@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140205132920.GE800@elgon.mountain>
In-Reply-To: <20140205132920.GE800@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Chan <mchan@broadcom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 02/05/2014 05:29 AM, Dan Carpenter wrote:
> In the original code, if tg3_readphy() fails then it does an unnecessary
> check to verify "err" is still zero and then returns -EBUSY.
>
> My static checker complains about the unnecessary "if (!err)" check and
> anyway it is better to propagate the -EBUSY error code from
> tg3_readphy() instead of hard coding it here.  And really the original
> code is confusing to look at.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index e2ca03e23dc1..c466e12b601e 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -2609,13 +2609,14 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
>
>   	tg3_writephy(tp, MII_CTRL1000, phy9_orig);
>
> -	if (!tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32)) {
> -		reg32 &= ~0x3000;
> -		tg3_writephy(tp, MII_TG3_EXT_CTRL, reg32);
> -	} else if (!err)
> -		err = -EBUSY;
> +	err = tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32);
> +	if (err)
> +		return err;
>
> -	return err;
> +	reg32 &= ~0x3000;
> +	tg3_writephy(tp, MII_TG3_EXT_CTRL, reg32);
> +
> +	return 0;
>   }
>
>   static void tg3_carrier_off(struct tg3 *tp)
>

Acked-by: Nithin Nayak Sujir <nsujir@broadcom.com>
