From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 23 Aug 2010 21:39:01 +0000
Subject: Re: [patch] pda_power: remove unneeded assignment
Message-Id: <20100823213901.GJ17833@buzzloop.caiaq.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100823212103.GA7340@bicker>
In-Reply-To: <20100823212103.GA7340@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Anton Vorontsov <cbouatmailru@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 23, 2010 at 11:21:03PM +0200, Dan Carpenter wrote:
> We never use the "ret" value from this assignment, and also
> PTR_ERR(NULL) is zero.  I looked at it and this driver is designed to
> accept a NULL value for "ac_draw".  So there isn't a bug in the original
> code and we can just remove this confusing assignment.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Looks reasonable.

Acked-by: Daniel Mack <daniel@caiaq.de>

> diff --git a/drivers/power/pda_power.c b/drivers/power/pda_power.c
> index 69f8aa3..63a6a4d 100644
> --- a/drivers/power/pda_power.c
> +++ b/drivers/power/pda_power.c
> @@ -279,7 +279,6 @@ static int pda_power_probe(struct platform_device *pdev)
>  	if (IS_ERR(ac_draw)) {
>  		dev_dbg(dev, "couldn't get ac_draw regulator\n");
>  		ac_draw = NULL;
> -		ret = PTR_ERR(ac_draw);
>  	}
>  
>  	if (pdata->is_ac_online) {
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
