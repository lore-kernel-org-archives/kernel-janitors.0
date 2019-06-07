From: Stephen Boyd <sboyd@kernel.org>
Date: Fri, 07 Jun 2019 19:03:30 +0000
Subject: Re: [PATCH][next] clk: bcm2835: fix memork leak on unfree'd pll struct
Message-Id: <20190607190331.8B06020868@mail.kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190607104533.14700-1-colin.king@canonical.com>
In-Reply-To: <20190607104533.14700-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2019-06-07 03:45:33)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pll struct is being allocated but not kfree'd on an error return
> path when devm_clk_hw_register fails.  Fix this with a kfree on pll
> if an error occurs.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: b19f009d4510 ("clk: bcm2835: Migrate to clk_hw based registration and OF APIs")

I suspect this problem was there before this commit, but OK.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 770bb01f523e..90584deaf416 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1310,8 +1310,10 @@ static struct clk_hw *bcm2835_register_pll(struct bcm2835_cprman *cprman,
>         pll->hw.init = &init;
>  
>         ret = devm_clk_hw_register(cprman->dev, &pll->hw);
> -       if (ret)
> +       if (ret) {
> +               kfree(pll);
>                 return NULL;
> +       }
>         return &pll->hw;
>  }

Aren't there more leaks in this driver? 
