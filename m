From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 09 Jan 2019 18:35:41 +0000
Subject: Re: [PATCH] clk: tegra: dfll: Fix a potential Oop in remove()
Message-Id: <154705894157.15366.18371281346979788597@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218082241.GA440@kadam>
In-Reply-To: <20181218082241.GA440@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2018-12-18 00:22:41)
> If tegra_dfll_unregister() fails then "soc" is an error pointer.  We
> should just return instead of dereferencing it.
> 
> Fixes: 1752c9ee23fb ("clk: tegra: dfll: Fix drvdata overwriting issue")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-fixes
