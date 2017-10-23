From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Mon, 23 Oct 2017 00:57:22 +0000
Subject: Re: [PATCH 1/2] extcon: max14577: Use common error handling code in max14577_muic_set_path()
Message-Id: <59ED3E72.7010401@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5cdefd84-066d-5379-43c8-76f5d3b8f7c4@users.sourceforge.net>
In-Reply-To: <5cdefd84-066d-5379-43c8-76f5d3b8f7c4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi,

As you commented, this patch might remove the redundant error message.
But, it makes the code more complicated in side of readability.
If max1577_muic_set_path() have to handle the additional core and exception handling
int the future, this patch might make it more difficult. So, I prefer existing code.

Thanks for your effort.

Regards,
Chanwoo Choi

On 2017년 10월 23일 02:51, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Oct 2017 19:33:58 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/extcon/extcon-max14577.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-max14577.c b/drivers/extcon/extcon-max14577.c
> index f6414b7fa5bc..3d4bf5d23236 100644
> --- a/drivers/extcon/extcon-max14577.c
> +++ b/drivers/extcon/extcon-max14577.c
> @@ -211,10 +211,8 @@ static int max14577_muic_set_path(struct max14577_muic_info *info,
>  	ret = max14577_update_reg(info->max14577->regmap,
>  				MAX14577_MUIC_REG_CONTROL1,
>  				CLEAR_IDBEN_MICEN_MASK, CTRL1_SW_OPEN);
> -	if (ret < 0) {
> -		dev_err(info->dev, "failed to update MUIC register\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto report_failure;
>  
>  	if (attached)
>  		ctrl1 = val;
> @@ -224,10 +222,8 @@ static int max14577_muic_set_path(struct max14577_muic_info *info,
>  	ret = max14577_update_reg(info->max14577->regmap,
>  				MAX14577_MUIC_REG_CONTROL1,
>  				CLEAR_IDBEN_MICEN_MASK, ctrl1);
> -	if (ret < 0) {
> -		dev_err(info->dev, "failed to update MUIC register\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto report_failure;
>  
>  	if (attached)
>  		ctrl2 |= CTRL2_CPEN_MASK;	/* LowPwr=0, CPEn=1 */
> @@ -237,16 +233,18 @@ static int max14577_muic_set_path(struct max14577_muic_info *info,
>  	ret = max14577_update_reg(info->max14577->regmap,
>  			MAX14577_REG_CONTROL2,
>  			CTRL2_LOWPWR_MASK | CTRL2_CPEN_MASK, ctrl2);
> -	if (ret < 0) {
> -		dev_err(info->dev, "failed to update MUIC register\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto report_failure;
>  
>  	dev_dbg(info->dev,
>  		"CONTROL1 : 0x%02x, CONTROL2 : 0x%02x, state : %s\n",
>  		ctrl1, ctrl2, attached ? "attached" : "detached");
>  
>  	return 0;
> +
> +report_failure:
> +	dev_err(info->dev, "failed to update MUIC register\n");
> +	return ret;
>  }
>  
>  /*
> 

