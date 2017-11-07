From: Phil Reid <preid@electromag.com.au>
Date: Tue, 07 Nov 2017 15:18:49 +0000
Subject: Re: [PATCH] power: supply: sbs-message: double left shift bug in sbsm_select()
Message-Id: <6bf6a1bf-9f45-7ca3-214c-cbe554dad433@electromag.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171107124322.mm3fqkrggw3zidrx@mwanda>
In-Reply-To: <20171107124322.mm3fqkrggw3zidrx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Sebastian Reichel <sre@kernel.org>, Karl-Heinz Schneider <karl-heinz@schneider-inet.de>
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/11/2017 20:43, Dan Carpenter wrote:
> The original code does this: "1 << (1 << 11)" which is undefined in C.
> 
> Fixes: dbc4deda03fe ("power: Adds support for Smart Battery System Manager")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>>From static analysis.  Not tested.
> 
> diff --git a/drivers/power/supply/sbs-manager.c b/drivers/power/supply/sbs-manager.c
> index ccb4217b9638..cb6e8f66c7a2 100644
> --- a/drivers/power/supply/sbs-manager.c
> +++ b/drivers/power/supply/sbs-manager.c
> @@ -183,7 +183,7 @@ static int sbsm_select(struct i2c_mux_core *muxc, u32 chan)
>   		return ret;
>   
>   	/* chan goes from 1 ... 4 */
> -	reg = 1 << BIT(SBSM_SMB_BAT_OFFSET + chan);
> +	reg = BIT(SBSM_SMB_BAT_OFFSET + chan);
>   	ret = sbsm_write_word(data->client, SBSM_CMD_BATSYSSTATE, reg);
>   	if (ret)
>   		dev_err(dev, "Failed to select channel %i\n", chan);
> 
> 
Oops. That's my fault.

Reviewed-by: Phil Reid <preid@electromag.com.au>

-- 
Regards
Phil Reid
