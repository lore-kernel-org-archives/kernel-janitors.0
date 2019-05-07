From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 May 2019 08:27:44 +0000
Subject: Re: [PATCH][next] Input: qt1050: fix less than zero comparison on an unsigned int
Message-Id: <20190507082744.GK2269@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190507082135.21538-1-colin.king@canonical.com>
In-Reply-To: <20190507082135.21538-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 07, 2019 at 09:21:35AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the less than zero comparison of val is always false because
> val is an unsigned int. Fix this by making val a signed int.
> 
> Addresses-Coverity: ("Unsigned compared against zero")
> Fixes: a33ff45923c8 ("Input: qt1050 - add Microchip AT42QT1050 support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/input/keyboard/qt1050.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
> index 6b1603cb7515..4debddb13972 100644
> --- a/drivers/input/keyboard/qt1050.c
> +++ b/drivers/input/keyboard/qt1050.c
> @@ -222,7 +222,7 @@ static struct regmap_config qt1050_regmap_config = {
>  
>  static bool qt1050_identify(struct qt1050_priv *ts)
>  {
> -	unsigned int val;
> +	int val;

This code is checking the wrong thing anyway.  It should be:

	int ret;

	ret = regmap_read(&val);
	if (ret)
		return false;

regards,
dan carpenter
