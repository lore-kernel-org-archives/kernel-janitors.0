From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 26 Feb 2019 17:41:33 +0000
Subject: Re: [PATCH -next] clk: ingenic: Remove set but not used variable 'enable'
Message-Id: <155120289328.260864.8270283395055934395@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190226015732.183552-1-yuehaibing@huawei.com>
In-Reply-To: <20190226015732.183552-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Paul Cercueil <paul@crapouillou.net>, YueHaibing <yuehaibing@huawei.com>
Cc: linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting YueHaibing (2019-02-25 17:57:32)
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/clk/ingenic/cgu.c: In function 'ingenic_pll_recalc_rate':
> drivers/clk/ingenic/cgu.c:86:15: warning:
>  variable 'enable' set but not used [-Wunused-but-set-variable]
> 
> It's not used after commit ab27eb4bc365 ("clk: ingenic: Add code to
> enable/disable PLLs")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next
