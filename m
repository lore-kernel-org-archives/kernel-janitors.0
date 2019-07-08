From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 08 Jul 2019 16:16:30 +0000
Subject: Re: [PATCH] coresight: etm4x: Two function calls less
Message-Id: <CANLsYkxxe58r10aodp+Cdi8MBbidk_UDgFEbuO3WVZCu8k9uNQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <172e04b2-65a5-4007-8464-cc7701e76e36@web.de>
In-Reply-To: <172e04b2-65a5-4007-8464-cc7701e76e36@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>

On Fri, 5 Jul 2019 at 11:40, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 19:33:26 +0200
>
> Avoid an extra function call in two function implementations
> by using a ternary operator instead of a conditional statement.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index a0365e23678e..219c10eb752c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -296,11 +296,8 @@ static ssize_t mode_store(struct device *dev,
>
>         spin_lock(&drvdata->spinlock);
>         config->mode = val & ETMv4_MODE_ALL;
> -
> -       if (config->mode & ETM_MODE_EXCLUDE)
> -               etm4_set_mode_exclude(drvdata, true);
> -       else
> -               etm4_set_mode_exclude(drvdata, false);
> +       etm4_set_mode_exclude(drvdata,
> +                             config->mode & ETM_MODE_EXCLUDE ? true : false);
>
>         if (drvdata->instrp0 = true) {
>                 /* start by clearing instruction P0 field */
> @@ -999,10 +996,8 @@ static ssize_t addr_range_store(struct device *dev,
>          * Program include or exclude control bits for vinst or vdata
>          * whenever we change addr comparators to ETM_ADDR_TYPE_RANGE
>          */
> -       if (config->mode & ETM_MODE_EXCLUDE)
> -               etm4_set_mode_exclude(drvdata, true);
> -       else
> -               etm4_set_mode_exclude(drvdata, false);
> +       etm4_set_mode_exclude(drvdata,
> +                             config->mode & ETM_MODE_EXCLUDE ? true : false);

Looks good to me - I will add this to my next branch when we have a new 5.3-rc1.

Thanks,
Mathieu

>
>         spin_unlock(&drvdata->spinlock);
>         return size;
> --
> 2.22.0
>
