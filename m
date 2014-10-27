From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Date: Mon, 27 Oct 2014 13:21:36 +0000
Subject: Re: [patch v2] regulator: max77802: fix a test in max77802_set_suspend_mode()
Message-Id: <544E46E0.90608@collabora.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141027104506.GA22704@mwanda>
In-Reply-To: <20141027104506.GA22704@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Dan,

On 10/27/2014 11:45 AM, Dan Carpenter wrote:
> The original test triggers a static checker warning.  Javier Martinez
> Canillas says that the "!" is a typo and should be removed.
> 
> Fixes: 2e0eaa1aa008 ('regulator: max77802: Add set suspend mode for BUCKs and simplify code')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2:  The first version of this patch was buggy.  Thanks Javier for
> your review.
> 
> diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
> index 5839c45..7718c8a 100644
> --- a/drivers/regulator/max77802.c
> +++ b/drivers/regulator/max77802.c
> @@ -179,7 +179,7 @@ static int max77802_set_suspend_mode(struct regulator_dev *rdev,
>  	 * If the regulator has been disabled for suspend
>  	 * then is invalid to try setting a suspend mode.
>  	 */
> -	if (!max77802->opmode[id] = MAX77802_OFF_PWRREQ) {
> +	if (max77802->opmode[id] = MAX77802_OFF_PWRREQ) {
>  		dev_warn(&rdev->dev, "%s: is disabled, mode: 0x%x not set\n",
>  			 rdev->desc->name, mode);
>  		return 0;
> 

The typo was not found during testing because the expression always evaluated
to 0 which was expected since a regulator marked to be disabled for suspend
shouldn't have a suspend mode to be set.

But when trying to trigger that specific case the test was indeed failing and
the regulator mode was changed even when the regulator was marked as disabled.

This patch solves the issue by making max77802_set_suspend_mode() to return
early if the regulator was marked as disabled

Thanks a lot for finding this bug.

Acked-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
