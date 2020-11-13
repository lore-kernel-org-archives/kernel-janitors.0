From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2020 17:27:08 +0000
Subject: Re: [PATCH] clk: qcom: lpass-sc7180: Clean up on error in lpass_sc7180_init()
Message-Id: <CAD=FV=V1tvAw-myadWTA0K_RzJ7R9oYzVuc5-y74Ov06M0dk0w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113101419.GC168908@mwanda>
In-Reply-To: <20201113101419.GC168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

On Fri, Nov 13, 2020 at 2:14 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Clean up the first driver if the second driver can't be registered.
>
> Fixes: 4ee9fe3e292b ("clk: qcom: lpass-sc7180: Disentangle the two clock devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/clk/qcom/lpasscorecc-sc7180.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> index 1a3925badd7c..9081649f476f 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -491,7 +491,13 @@ static int __init lpass_sc7180_init(void)
>         if (ret)
>                 return ret;
>
> -       return platform_driver_register(&lpass_hm_sc7180_driver);
> +       ret = platform_driver_register(&lpass_hm_sc7180_driver);
> +       if (ret) {
> +               platform_driver_unregister(&lpass_core_cc_sc7180_driver);
> +               return ret;
> +       }
> +
> +       return 0;

Reviewed-by: Douglas Anderson <dianders@chromium.org>
