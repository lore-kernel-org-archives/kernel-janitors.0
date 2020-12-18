From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 18 Dec 2020 13:46:17 +0000
Subject: Re: [PATCH] mmc: sdhci-sprd: Fix some resource leaks in the remove function
Message-Id: <83712f89-deb7-b266-8e8a-99f0df4c6782@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201217204236.163446-1-christophe.jaillet@wanadoo.fr>
 <CA+H2tpGkv0sPQ2e6OfUVuW2xFx-KSpZy_vYY3TG_9JBWvFZxAA@mail.gmail.com>
In-Reply-To: <CA+H2tpGkv0sPQ2e6OfUVuW2xFx-KSpZy_vYY3TG_9JBWvFZxAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Orson Zhai <orsonzhai@gmail.com>
Cc: adrian.hunter@intel.com, Ulf Hansson <ulf.hansson@linaro.org>, Baolin Wang <baolin.wang7@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, linux-mmc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, billows.wu@unisoc.com, Wu Hongtao <wuht06@gmail.com>

Le 17/12/2020 à 23:55, Orson Zhai a écrit :
> + cc: Billows
> 
> Hi Christophe,
> On Fri, Dec 18, 2020 at 4:50 AM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> 'sdhci_remove_host()' and 'sdhci_pltfm_free()' should be used in place of
>> 'mmc_remove_host()' and 'mmc_free_host()'.
>>
>> This avoids some resource leaks, is more in line with the error handling
>> path of the probe function, and is more consistent with other drivers.
>>
>> Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host controller")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Other adjustment may be needed.
>> I'm not sure at all of the 0 passed to 'sdhci_remove_host()'. Some drivers
>> pass 0, some have some more complicated computation.
>> ---
>>   drivers/mmc/host/sdhci-sprd.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
>> index f85171edabeb..5dc36efff47f 100644
>> --- a/drivers/mmc/host/sdhci-sprd.c
>> +++ b/drivers/mmc/host/sdhci-sprd.c
>> @@ -708,14 +708,14 @@ static int sdhci_sprd_remove(struct platform_device *pdev)
>>   {
>>          struct sdhci_host *host = platform_get_drvdata(pdev);
>>          struct sdhci_sprd_host *sprd_host = TO_SPRD_HOST(host);
>> -       struct mmc_host *mmc = host->mmc;
>>
>> -       mmc_remove_host(mmc);
>> +       sdhci_remove_host(host, 0);
>> +
>>          clk_disable_unprepare(sprd_host->clk_sdio);
>>          clk_disable_unprepare(sprd_host->clk_enable);
>>          clk_disable_unprepare(sprd_host->clk_2x_enable);
>>
>> -       mmc_free_host(mmc);
>> +       sdhci_pltfm_free(pdev);
> 
> I saw a lot of drivers also use mmc_free_host().
> Do you have patches elsewhere to clean them?
> 

As far as I can see, all drivers that use 'mmc_free_host' also use 
'mmc_alloc_host'. (based on 5.10.1 and unless error)

The only exception is 'sdhci-sprd.c'.

So no, I don't plan any other clean-up.



To spot it, I run one of my own cocci script which compare functions 
called in the remove function and in the error handling path of the probe.

So I caught this one because 'mmc_free_host' is used in the porbe and 
'sdhci_pltfm_free' in the remove function.


CJ

> Thanks,
> -Orson
> 
>>
>>          return 0;
>>   }
>> --
>> 2.27.0
>>
> 
