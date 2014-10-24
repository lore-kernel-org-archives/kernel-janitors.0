From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Date: Fri, 24 Oct 2014 09:04:28 +0000
Subject: Re: [patch] regulator: max77802: precedence error in max77802_set_suspend_mode()
Message-Id: <71442C69-B48C-46B8-93A1-068AC26E01C2@collabora.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141024081646.GB11140@mwanda>
In-Reply-To: <20141024081646.GB11140@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hello Dan,

> On 24/10/2014, at 10:16, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> The "!" operation has higher precedence that the comparison.
> 
> Fixes: 2e0eaa1aa008 ('regulator: max77802: Add set suspend mode for BUCKs and simplify code')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
> index 5839c45..57e37fd 100644
> --- a/drivers/regulator/max77802.c
> +++ b/drivers/regulator/max77802.c
> @@ -179,7 +179,7 @@ static int max77802_set_suspend_mode(struct regulator_dev *rdev,
>     * If the regulator has been disabled for suspend
>     * then is invalid to try setting a suspend mode.
>     */
> -    if (!max77802->opmode[id] = MAX77802_OFF_PWRREQ) {
> +    if (max77802->opmode[id] != MAX77802_OFF_PWRREQ) {
>        dev_warn(&rdev->dev, "%s: is disabled, mode: 0x%x not set\n",
>             rdev->desc->name, mode);
>        return 0;

Thanks for the patch, there is indeed a typo error but $subject is not the correct fix.

The problem is that the "!" operator should not be in the expression so it has be removed and only compare if opmode is equal to MAX72802_OFF_PWRREQ.

With that change feel free to add my Reviewed-by.

Best regards,
Javier