From: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date: Thu, 17 Sep 2020 18:17:27 +0000
Subject: Re: [PATCH -next] soc: ti: pruss: Fix return value check
Message-Id: <CAMxfBF5n-eCyMR2=yz8P=J=f3smDpw_3N3yZLqH9uQmZCXQy8g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200915075732.100804-1-weiyongjun1@huawei.com>
In-Reply-To: <20200915075732.100804-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org

Hi

On Tue, 15 Sep 2020 at 09:58, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function of_device_get_match_data() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>
> Fixes: ba59c9b43c86 ("soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/soc/ti/pruss.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
> index cc0b4ad7a3d3..582f48051c30 100644
> --- a/drivers/soc/ti/pruss.c
> +++ b/drivers/soc/ti/pruss.c
> @@ -126,7 +126,7 @@ static int pruss_clk_init(struct pruss *pruss, struct device_node *cfg_node)
>         int ret = 0;
>
>         data = of_device_get_match_data(dev);
> -       if (IS_ERR(data))
> +       if (!data)
>                 return -ENODEV;
>
>         clks_np = of_get_child_by_name(cfg_node, "clocks");
> @@ -175,7 +175,7 @@ static int pruss_probe(struct platform_device *pdev)
>         const char *mem_names[PRUSS_MEM_MAX] = { "dram0", "dram1", "shrdram2" };
>
>         data = of_device_get_match_data(&pdev->dev);
> -       if (IS_ERR(data)) {
> +       if (!data) {
>                 dev_err(dev, "missing private data\n");
>                 return -ENODEV;
>         }

First of all thank you for reporting this issue. Indeed the IS_ERR is
wrongly used and is leftover from a bit different former internal
implementation. Nevertheless with your fix the driver will not be
functional anymore for all devices without match data (e.g.
"ti,am3356-pruss") which is not what we want.

The proper fix would be removing the mentioned error checks, since the
"data" in both cases is checked later, before usage:
if (data && data->...).

Please let me know if you want to improve this patch by yourself or
want me to push a proper fix with your e.g. "Reported-by:" tag. For me
both solutions are ok.

Thank you,
Grzegorz
