From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 03 Dec 2018 17:55:16 +0000
Subject: Re: [PATCH] clk: mvebu: Off by one bugs in cp110_of_clk_get()
Message-Id: <154385971618.88331.15503515631878065127@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203145055.4fvrmy3c4zyocgsx@kili.mountain>
In-Reply-To: <20181203145055.4fvrmy3c4zyocgsx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Michael Turquette <mturquette@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2018-12-03 06:50:55)
> These > comparisons should be >= to prevent reading beyond the end of
> of the clk_data->hws[] buffer.
> 
> The clk_data->hws[] array is allocated in cp110_syscon_common_probe()
> when we do:
>         cp110_clk_data = devm_kzalloc(dev, sizeof(*cp110_clk_data) +
>                                       sizeof(struct clk_hw *) * CP110_CLK_NUM,
>                                       GFP_KERNEL);
> As you can see, it has CP110_CLK_NUM elements which is equivalent to
> CP110_MAX_CORE_CLOCKS + CP110_MAX_GATABLE_CLOCKS.
> 
> Fixes: d3da3eaef7f4 ("clk: mvebu: new driver for Armada CP110 system controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-fixes
