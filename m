From: Niklas Cassel <nks@flawful.org>
Date: Wed, 08 Jan 2020 09:45:45 +0000
Subject: Re: [PATCH -next] power: avs: qcom-cpr: remove duplicated include from qcom-cpr.c
Message-Id: <20200108094545.o5o4tpwt4eu5fpye@flawful.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108015849.54289-1-yuehaibing@huawei.com>
In-Reply-To: <20200108015849.54289-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Kevin Hilman <khilman@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Nishanth Menon <nm@ti.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 08, 2020 at 01:58:49AM +0000, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/power/avs/qcom-cpr.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/power/avs/qcom-cpr.c b/drivers/power/avs/qcom-cpr.c
> index 9247f53550b3..9b1d7d919ee9 100644
> --- a/drivers/power/avs/qcom-cpr.c
> +++ b/drivers/power/avs/qcom-cpr.c
> @@ -25,7 +25,6 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/clk.h>
>  #include <linux/nvmem-consumer.h>
> -#include <linux/bitops.h>
>  
>  /* Register Offsets for RB-CPR and Bit Definitions */
> 
> 
> 

Thank you for this fix.

Acked-by: Niklas Cassel <nks@flawful.org>
