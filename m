From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Wed, 16 Sep 2020 02:38:13 +0000
Subject: Re: [PATCH] PM / devfreq: tegra30: disable clock on error in probe
Message-Id: <bccb08ef-7e48-0cc7-08b5-7177b84a5763@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200908072627epcas1p41f2c8c2730d42bd8935a40b0ab8122f7@epcas1p4.samsung.com>
        <20200908072557.GC294938@mwanda>
        <2ceb045a-ebac-58d7-0250-4ea39d711ce8@samsung.com>
        <44560522-f04e-ade5-2e02-9df56a6f79ba@gmail.com>
        <e45c8ffc-ea24-1178-7bfa-62ca6bedbb3b@samsung.com>
        <2573cd77-1175-d194-7bfc-24d28b276846@samsung.com>
        <5aac4d59-5e06-25a6-3de1-6a5a586b9e34@gmail.com>
In-Reply-To: <5aac4d59-5e06-25a6-3de1-6a5a586b9e34@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dmitry Osipenko <digetx@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

On 9/16/20 2:01 AM, Dmitry Osipenko wrote:
> 15.09.2020 05:13, Chanwoo Choi пишет:
>> On 9/15/20 11:00 AM, Chanwoo Choi wrote:
>>> Hi Dmitry,
>>>
>>> On 9/14/20 10:56 PM, Dmitry Osipenko wrote:
>>>> 14.09.2020 10:09, Chanwoo Choi пишет:
>>>>> Hi,
>>>>>
>>>>> On 9/8/20 4:25 PM, Dan Carpenter wrote:
>>>>>> This error path needs to call clk_disable_unprepare().
>>>>>>
>>>>>> Fixes: 7296443b900e ("PM / devfreq: tegra30: Handle possible round-rate error")
>>>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>>>> ---
>>>>>> ---
>>>>>>  drivers/devfreq/tegra30-devfreq.c | 4 +++-
>>>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>>>>>> index e94a27804c20..dedd39de7367 100644
>>>>>> --- a/drivers/devfreq/tegra30-devfreq.c
>>>>>> +++ b/drivers/devfreq/tegra30-devfreq.c
>>>>>> @@ -836,7 +836,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>>>>>  	rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
>>>>>>  	if (rate < 0) {
>>>>>>  		dev_err(&pdev->dev, "Failed to round clock rate: %ld\n", rate);
>>>>>> -		return rate;
>>>>>> +		err = rate;
>>>>>> +		goto disable_clk;
>>>>>>  	}
>>>>>>  
>>>>>>  	tegra->max_freq = rate / KHZ;
>>>>>> @@ -897,6 +898,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>>>>>  	dev_pm_opp_remove_all_dynamic(&pdev->dev);
>>>>>>  
>>>>>>  	reset_control_reset(tegra->reset);
>>>>>> +disable_clk:
>>>>>>  	clk_disable_unprepare(tegra->clock);
>>>>>
>>>>> Is it doesn't need to reset with reset_contrl_reset()?
>>>>
>>>> Hello, Chanwoo!
>>>>
>>>> It's reset just before the clk_round_rate() invocation, hence there
>>>> shouldn't be a need to reset it second time.
>>>
>>> Do you mean that reset is deasserted automatically
>>> when invoke clk_round_rate() on tegra?
> 
> I only mean that the tegra30-devfreq driver deasserts the reset before
> the clk_round_rate():
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/devfreq/tegra30-devfreq.c?h=v5.9-rc5#n834
> 
>>> If tree, I think that 'reset_control_reset(tegra->reset)' invocation
>>
>> I'm sorry for my typo. s/tree/true.
>>
>>> is not needed on 'remove_opp:' goto. Because already reset deassertion
>>> is invoked by clk_round_rate(), it seems that doesn't need to invoke
>>> anymore during exception case.
>>>
>>> Actually, it is not clear in my case.
> 
> The reset_control_reset() in the error path of the driver probe function
> is placed that way to make the tear-down order match the driver removal
> order. Perhaps the reset could be moved before the remove_opp, but this
> change won't make any real difference, hence it already should be good
> as-is.
> 
> 

I have one more question.
When failed to enable clock on line829[1],
does it need any reset_control invocation?
In this case on line829, just return without any restoration 
about reset control.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/devfreq/tegra30-devfreq.c?h=v5.9-rc5#n829

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
