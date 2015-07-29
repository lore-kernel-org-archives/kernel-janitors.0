From: Stephen Boyd <sboyd@codeaurora.org>
Date: Wed, 29 Jul 2015 18:25:30 +0000
Subject: Re: [patch] clk: versatile: off by one in clk_sp810_timerclken_of_get()
Message-Id: <20150729182530.GC3159@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150729101705.GB12100@mwanda>
In-Reply-To: <20150729101705.GB12100@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/29, Dan Carpenter wrote:
> The ">" should be ">=" or we end up reading beyond the end of the array.
> 
> Fixes: 6e973d2c4385 ('clk: vexpress: Add separate SP810 driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
> index 64b0129..7fbe4d4 100644
> --- a/drivers/clk/versatile/clk-sp810.c

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
