From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 24 Dec 2019 08:10:38 +0000
Subject: Re: [PATCH -next] clk: bm1800: Remove set but not used variable 'fref'
Message-Id: <20191224081039.6C9D220643@mail.kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191129033534.188257-1-yuehaibing@huawei.com>
In-Reply-To: <20191129033534.188257-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Michael Turquette <mturquette@baylibre.com>, YueHaibing <yuehaibing@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Quoting YueHaibing (2019-11-28 19:35:34)
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/clk/clk-bm1880.c: In function 'bm1880_pll_rate_calc':
> drivers/clk/clk-bm1880.c:477:13: warning:
>  variable 'fref' set but not used [-Wunused-but-set-variable]
> 
> It is never used, so remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next
