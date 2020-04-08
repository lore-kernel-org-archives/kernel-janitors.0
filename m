From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Wed, 08 Apr 2020 18:51:40 +0000
Subject: Re: [PATCH -next] pinctrl: qcom: Remove duplicated include from pinctrl-msm.c
Message-Id: <20200408185140.GN663905@yoga>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200408070504.134847-1-yuehaibing@huawei.com>
In-Reply-To: <20200408070504.134847-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Andy Gross <agross@kernel.org>, Ajay Kishore <akisho@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed 08 Apr 00:05 PDT 2020, YueHaibing wrote:

> Remove duplicated include.
> 

Missed that in my review, thanks.

Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 9a398a211d30..898fc041e197 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -23,7 +23,6 @@
>  #include <linux/pm.h>
>  #include <linux/log2.h>
>  #include <linux/qcom_scm.h>
> -#include <linux/io.h>
>  
>  #include <linux/soc/qcom/irq.h>
> 
> 
> 
