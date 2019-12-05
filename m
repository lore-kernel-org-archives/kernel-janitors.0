From: walter harms <wharms@bfs.de>
Date: Thu, 05 Dec 2019 08:37:55 +0000
Subject: Re: [PATCH] pwm: sun4i: Narrow scope of local variable
Message-Id: <5DE8C1E3.4080204@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191002101624.gljyf7g4nia2rcbx@pengutronix.de>
 <20191205072404.6858-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20191205072404.6858-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, kernel@pengutronix.de, Colin King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org



Am 05.12.2019 08:24, schrieb Uwe Kleine-König:
> The variable pval is only used in a single block in the function
> sun4i_pwm_calculate(). So declare it in a more local scope to simplify
> the function for humans and compilers.
> 
> While the diffstat for this patch is negative for this patch I still
> thing the advantage of having a narrower scope is beneficial.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> for the patch that became
> 
> 	1b98ad3b3be9 ("pwm: sun4i: Drop redundant assignment to variable pval")
> 
> (and which yielded the situation that pval is only used in this single
> block) I suggested to do this change. This was ignored however by both
> Colin and Thierry without comment. So I suggest the change here
> separately.
> 
> Best regards
> Uwe
> 
>  drivers/pwm/pwm-sun4i.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index 581d23287333..8919e6ab7577 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -149,7 +149,7 @@ static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,
>  			       u32 *dty, u32 *prd, unsigned int *prsclr)
>  {
>  	u64 clk_rate, div = 0;
> -	unsigned int pval, prescaler = 0;
> +	unsigned int prescaler = 0;
>  
>  	clk_rate = clk_get_rate(sun4i_pwm->clk);
>  
> @@ -170,6 +170,8 @@ static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,
>  	if (prescaler = 0) {
>  		/* Go up from the first divider */
>  		for (prescaler = 0; prescaler < PWM_PRESCAL_MASK; prescaler++) {
> +			unsigned int pval;
> +
>  			if (!prescaler_table[prescaler])
>  				continue;
>  			pval = prescaler_table[prescaler];


nit picking:
Doing the assignment first would remove the only use
of prescaler_table[prescaler].

unsigned int pval = prescaler_table[prescaler];
if ( ! pval )
  continue;

if you feel adventures you could also replace the for() for a while()
since we know that prescaler = 0.

while ( prescaler < PWM_PRESCAL_MASK )
{
unsigned int pval = prescaler_table[prescaler++];
....


jm2c,

 wh
