From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Mon, 23 Oct 2017 01:05:34 +0000
Subject: Re: [PATCH 2/2] extcon: max14577: Delete an unnecessary variable initialisation in max14577_muic_set
Message-Id: <59ED405E.1030404@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <431ea2b6-5b03-3752-a9c1-a39b1a7e4921@users.sourceforge.net>
In-Reply-To: <431ea2b6-5b03-3752-a9c1-a39b1a7e4921@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 2017년 10월 23일 02:52, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Oct 2017 19:39:12 +0200
> 
> The variable "ret" is immediately reassigned by a following statement.
> Thus omit the explicit initialisation at the beginning.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/extcon/extcon-max14577.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/extcon/extcon-max14577.c b/drivers/extcon/extcon-max14577.c
> index 3d4bf5d23236..a2b60742a228 100644
> --- a/drivers/extcon/extcon-max14577.c
> +++ b/drivers/extcon/extcon-max14577.c
> @@ -204,8 +204,8 @@ static int max14577_muic_set_debounce_time(struct max14577_muic_info *info,
>  static int max14577_muic_set_path(struct max14577_muic_info *info,
>  		u8 val, bool attached)
>  {
> -	int ret = 0;
>  	u8 ctrl1, ctrl2 = 0;
> +	int ret;
>  
>  	/* Set open state to path before changing hw path */
>  	ret = max14577_update_reg(info->max14577->regmap,
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
