From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Sep 2020 14:17:54 +0000
Subject: Re: [PATCH] PM / devfreq: tegra30: disable clock on error in probe
Message-Id: <20200914141754.GB18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200908072627epcas1p41f2c8c2730d42bd8935a40b0ab8122f7@epcas1p4.samsung.com>
 <20200908072557.GC294938@mwanda>
 <2ceb045a-ebac-58d7-0250-4ea39d711ce8@samsung.com>
 <44560522-f04e-ade5-2e02-9df56a6f79ba@gmail.com>
In-Reply-To: <44560522-f04e-ade5-2e02-9df56a6f79ba@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 14, 2020 at 04:56:26PM +0300, Dmitry Osipenko wrote:
> 14.09.2020 10:09, Chanwoo Choi пишет:
> > Hi,
> > 
> > On 9/8/20 4:25 PM, Dan Carpenter wrote:
> >> This error path needs to call clk_disable_unprepare().
> >>
> >> Fixes: 7296443b900e ("PM / devfreq: tegra30: Handle possible round-rate error")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> ---
> >> ---
> >>  drivers/devfreq/tegra30-devfreq.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> >> index e94a27804c20..dedd39de7367 100644
> >> --- a/drivers/devfreq/tegra30-devfreq.c
> >> +++ b/drivers/devfreq/tegra30-devfreq.c
> >> @@ -836,7 +836,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
> >>  	rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
> >>  	if (rate < 0) {
> >>  		dev_err(&pdev->dev, "Failed to round clock rate: %ld\n", rate);
> >> -		return rate;
> >> +		err = rate;
> >> +		goto disable_clk;
> >>  	}
> >>  
> >>  	tegra->max_freq = rate / KHZ;
> >> @@ -897,6 +898,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
> >>  	dev_pm_opp_remove_all_dynamic(&pdev->dev);
> >>  
> >>  	reset_control_reset(tegra->reset);
> >> +disable_clk:
> >>  	clk_disable_unprepare(tegra->clock);
> > 
> > Is it doesn't need to reset with reset_contrl_reset()?
> 
> Hello, Chanwoo!
> 
> It's reset just before the clk_round_rate() invocation, hence there
> shouldn't be a need to reset it second time.

Ah...  I was looking the wrong code.  Plus I don't really know this code
very well.

If clk_prepare_enable() fails, then I would have assumed we need to call
reset_control_deassert().  I would have assumed the
reset_control_assert() and _deassert() functions were paired.  So what
I'm suggesting is something like the following:  (I'll resend this if
it's correct).

[PATCH] PM / devfreq: tegra30: Add missing reset_control_deassert()

If clk_prepare_enable() fails then probe needs to call the
reset_control_deassert() function.

Fixes: 6234f38016ad ("PM / devfreq: tegra: add devfreq driver for Tegra Activity Monitor")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/devfreq/tegra30-devfreq.c | 1 +
 1 file changed, 1 insertions(+), 0 deletion(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index e94a27804c20..ce217aba7b9d 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -828,6 +828,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"Failed to prepare and enable ACTMON clock\n");
+		reset_control_deassert(tegra->reset);
 		return err;
 	}
 
