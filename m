From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Tue, 15 Sep 2020 01:48:46 +0000
Subject: Re: [PATCH] PM / devfreq: tegra30: disable clock on error in probe
Message-Id: <e45c8ffc-ea24-1178-7bfa-62ca6bedbb3b@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200908072627epcas1p41f2c8c2730d42bd8935a40b0ab8122f7@epcas1p4.samsung.com>
        <20200908072557.GC294938@mwanda>
        <2ceb045a-ebac-58d7-0250-4ea39d711ce8@samsung.com>
        <44560522-f04e-ade5-2e02-9df56a6f79ba@gmail.com>
In-Reply-To: <44560522-f04e-ade5-2e02-9df56a6f79ba@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dmitry Osipenko <digetx@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dmitry,

On 9/14/20 10:56 PM, Dmitry Osipenko wrote:
> 14.09.2020 10:09, Chanwoo Choi пишет:
>> Hi,
>>
>> On 9/8/20 4:25 PM, Dan Carpenter wrote:
>>> This error path needs to call clk_disable_unprepare().
>>>
>>> Fixes: 7296443b900e ("PM / devfreq: tegra30: Handle possible round-rate error")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>> ---
>>>  drivers/devfreq/tegra30-devfreq.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>>> index e94a27804c20..dedd39de7367 100644
>>> --- a/drivers/devfreq/tegra30-devfreq.c
>>> +++ b/drivers/devfreq/tegra30-devfreq.c
>>> @@ -836,7 +836,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>>  	rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
>>>  	if (rate < 0) {
>>>  		dev_err(&pdev->dev, "Failed to round clock rate: %ld\n", rate);
>>> -		return rate;
>>> +		err = rate;
>>> +		goto disable_clk;
>>>  	}
>>>  
>>>  	tegra->max_freq = rate / KHZ;
>>> @@ -897,6 +898,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>>  	dev_pm_opp_remove_all_dynamic(&pdev->dev);
>>>  
>>>  	reset_control_reset(tegra->reset);
>>> +disable_clk:
>>>  	clk_disable_unprepare(tegra->clock);
>>
>> Is it doesn't need to reset with reset_contrl_reset()?
> 
> Hello, Chanwoo!
> 
> It's reset just before the clk_round_rate() invocation, hence there
> shouldn't be a need to reset it second time.

Do you mean that reset is deasserted automatically
when invoke clk_round_rate() on tegra?

If tree, I think that 'reset_control_reset(tegra->reset)' invocation
is not needed on 'remove_opp:' goto. Because already reset deassertion
is invoked by clk_round_rate(), it seems that doesn't need to invoke
anymore during exception case.

Actually, it is not clear in my case.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
