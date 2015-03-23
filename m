From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Mon, 23 Mar 2015 01:46:04 +0000
Subject: Re: [patch 1/2] extcon: max77843: signedness bug in max77843_muic_set_debounce_time()
Message-Id: <550F705C.2070101@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150315104947.GD20691@mwanda>
In-Reply-To: <20150315104947.GD20691@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 03/15/2015 07:49 PM, Dan Carpenter wrote:
> "ret" holds negative error codes and zero so it should be signed.
> 
> Fixes: 27a28d32b4f2 ('extcon: max77843: Add max77843 MUIC driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
> index 598a017..a3f80ca 100644
> --- a/drivers/extcon/extcon-max77843.c
> +++ b/drivers/extcon/extcon-max77843.c
> @@ -682,7 +682,7 @@ static int max77843_muic_set_debounce_time(struct max77843_muic_info *info,
>  		enum max77843_muic_adc_debounce_time time)
>  {
>  	struct max77843 *max77843 = info->max77843;
> -	unsigned int ret;
> +	int ret;
>  
>  	switch (time) {
>  	case MAX77843_DEBOUNCE_TIME_5MS:
> 

Applied it on extcon-next branch.

Thanks,
Chanwoo Choi
