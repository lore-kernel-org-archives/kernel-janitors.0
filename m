From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 05 Dec 2018 17:24:16 +0000
Subject: Re: [PATCH -next] coresight: stm: remove set but not used variable 'res_size'
Message-Id: <CANLsYkzyVCrV8UG7Fim0an2Rto2a4WTd6fSZLr8tt=gLZACesA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543653585-108277-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543653585-108277-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: Alexandre TORGUE <alexandre.torgue@st.com>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Sat, 1 Dec 2018 at 01:31, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/hwtracing/coresight/coresight-stm.c: In function 'stm_probe':
> drivers/hwtracing/coresight/coresight-stm.c:796:9: warning:
>  variable 'res_size' set but not used [-Wunused-but-set-variable]
>
> It never used since introduction in commit
> 237483aa5cf4 ("coresight: stm: adding driver for CoreSight STM component")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied - thanks,
Mathieu

> ---
>  drivers/hwtracing/coresight/coresight-stm.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index ef339ff..f07825d 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -793,7 +793,7 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>         struct stm_drvdata *drvdata;
>         struct resource *res = &adev->res;
>         struct resource ch_res;
> -       size_t res_size, bitmap_size;
> +       size_t bitmap_size;
>         struct coresight_desc desc = { 0 };
>         struct device_node *np = adev->dev.of_node;
>
> @@ -833,15 +833,11 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>
>         drvdata->write_bytes = stm_fundamental_data_size(drvdata);
>
> -       if (boot_nr_channel) {
> +       if (boot_nr_channel)
>                 drvdata->numsp = boot_nr_channel;
> -               res_size = min((resource_size_t)(boot_nr_channel *
> -                                 BYTES_PER_CHANNEL), resource_size(res));
> -       } else {
> +       else
>                 drvdata->numsp = stm_num_stimulus_port(drvdata);
> -               res_size = min((resource_size_t)(drvdata->numsp *
> -                                BYTES_PER_CHANNEL), resource_size(res));
> -       }
> +
>         bitmap_size = BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
>
>         guaranteed = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
>
>
>
