From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Feb 2019 10:17:31 +0000
Subject: Re: [PATCH -next] clk: tegra: dfll: Make symbol 'tegra210_cpu_cvb_tables' static
Message-Id: <CAK8P3a1DdyG5EHN-H_OeJWzh9-kJau6TZ54d1Cdco87ANgTa4A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218070609.167535-1-weiyongjun1@huawei.com> <20190218083858.GA19363@ulmo>
In-Reply-To: <20190218083858.GA19363@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: arm-soc <arm@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, "\\ Peter De Schrijver" <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Feb 18, 2019 at 9:39 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Feb 18, 2019 at 07:06:09AM +0000, Wei Yongjun wrote:
> > Fixes the following sparse warning:
> >
> > drivers/clk/tegra/clk-tegra124-dfll-fcpu.c:244:18: warning:
> >  symbol 'tegra210_cpu_cvb_tables' was not declared. Should it be static?
> >
> > Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> ARM SoC maintainers,
>
> This fixes a sparse warning introduced in the tegra-for-5.1-clk pull
> request that you pulled last week. Do you want me to send you another
> pull request (perhaps give it a few more days in case other fixes are
> going to show up) or would you rather apply this directly?
>
> In the latter case, here's a link to patchwork:
>
>         http://patchwork.ozlabs.org/patch/1043804/
>
> and this is:
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to arm/drivers, thanks!

>
> In the meantime, I'll go and improve my build scripts to run sparse as
> well. I used to do that but then removed it again because it was so
> noisy that it was impossible to filter out the Tegra-specific bits. I
> wonder if I could do something like have the build scripts build the
> branch base first, without sparse checking, and then fast-forward to the
> branch head and build again with sparse checking enabled. That way I
> should only be seeing the sparse results for code that was modified in
> the branch.

I should also restart my regular testing to find regressions, I'm
currently not doing any regular builds but rely on the bots.

      Arnd
