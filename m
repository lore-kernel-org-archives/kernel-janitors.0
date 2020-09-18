From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Fri, 18 Sep 2020 09:23:26 +0000
Subject: Re: [PATCH] PM / devfreq: tegra30: disable clock on error in probe
Message-Id: <64f4b682-00b7-60f2-902f-e50a40a04a55@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200908072627epcas1p41f2c8c2730d42bd8935a40b0ab8122f7@epcas1p4.samsung.com>
        <20200908072557.GC294938@mwanda>
        <2ceb045a-ebac-58d7-0250-4ea39d711ce8@samsung.com>
        <44560522-f04e-ade5-2e02-9df56a6f79ba@gmail.com>
        <e45c8ffc-ea24-1178-7bfa-62ca6bedbb3b@samsung.com>
        <2573cd77-1175-d194-7bfc-24d28b276846@samsung.com>
        <5aac4d59-5e06-25a6-3de1-6a5a586b9e34@gmail.com>
        <bccb08ef-7e48-0cc7-08b5-7177b84a5763@samsung.com>
        <887f4b2d-9181-356c-5f09-23be30d2480c@gmail.com>
        <8edcfd7b-110b-3886-64ee-3ec02cc6bd19@samsung.com>
        <57e8ccad-f0d5-febb-7a31-8d34430a5cb8@gmail.com>
In-Reply-To: <57e8ccad-f0d5-febb-7a31-8d34430a5cb8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dmitry Osipenko <digetx@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

On 9/18/20 6:14 AM, Dmitry Osipenko wrote:
> 17.09.2020 05:32, Chanwoo Choi пишет:
> ...
>>> There is no need to deassert the reset if clk-enable fails because reset
>>> control of tegra30-devfreq is exclusive, i.e it isn't shared with any
>>> other peripherals, and thus, reset control could asserted/deasserted at
>>> any time by the devfreq driver. If clk-enable fails, then reset will
>>> stay asserted and it will be fine to re-assert it again.
>>>
>>
>> Thanks for the detailed explanation. 
>> But, I think that almost people don't know the detailed h/w information.
>> If possible, how about matching the pair when clk-enable fails as following?
>>
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -828,6 +828,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>         if (err) {
>>                 dev_err(&pdev->dev,
>>                         "Failed to prepare and enable ACTMON clock\n");
>> +               reset_control_deassert(tegra->reset);
>>                 return err;
>>         }
> 
> That change won't bring any real benefits and will confuse people who
> know the HW, so we shouldn't do it.
> 
> Since the interrupt is disabled by default at the probe time, we
> actually don't need to care in a what state ACTMON hardware is at the
> driver-probe time since even if HW is active, it won't cause any damage
> to the system since ACTMON only collects and processes stats.
> 
> I made some experiments and looks like at least on Tegra30 the ACTMON
> hardware block uses multiple clocks and the ACTMON-clk isn't strictly
> necessary for the resetting of the HW state, it's actually quite common
> for Tegra peripherals that a part of HW logic runs off some root clk.
> 
> Hence if we want to improve the code, I think we can make this change:
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c
> b/drivers/devfreq/tegra30-devfreq.c
> index ee274daa57ac..4e3ac23e6850 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -891,8 +891,6 @@ static int tegra_devfreq_probe(struct
> platform_device *pdev)
>  		return err;
>  	}
> 
> -	reset_control_assert(tegra->reset);
> -
>  	err = clk_prepare_enable(tegra->clock);
>  	if (err) {
>  		dev_err(&pdev->dev,
> @@ -900,7 +898,7 @@ static int tegra_devfreq_probe(struct
> platform_device *pdev)
>  		return err;
>  	}
> 
> -	reset_control_deassert(tegra->reset);
> +	reset_control_reset(tegra->reset);
> 
>  	for (i = 0; i < mc->num_timings; i++) {
>  		/*

It looks good to me for improving the readability
for everyone who don't know the detailed h/w information.


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
