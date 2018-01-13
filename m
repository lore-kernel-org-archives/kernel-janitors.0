From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 13 Jan 2018 17:09:01 +0000
Subject: Re: [PATCH] EDAC, mv64x60: Remove some code duplication
Message-Id: <49db37d7-3d54-3ae5-9cb9-702ef14f1f43@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180113072821.8100-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180113072821.8100-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Borislav Petkov <bp@alien8.de>
Cc: mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>

Le 13/01/2018 à 15:22, Borislav Petkov a écrit :
> + Chris Packham who's been fixing some stuff in here too.
>
> On Sat, Jan 13, 2018 at 08:28:21AM +0100, Christophe JAILLET wrote:
>> Reorder the error handling code in order to release the resources in
>> reverse order than allocation.
>>
>> Introduce a new 'release_group' label in the error handling path and use
>> it to void some code duplication.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/edac/mv64x60_edac.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/edac/mv64x60_edac.c b/drivers/edac/mv64x60_edac.c
>> index 3c68bb525d5d..aa5bc1d8f424 100644
>> --- a/drivers/edac/mv64x60_edac.c
>> +++ b/drivers/edac/mv64x60_edac.c
>> @@ -450,8 +450,8 @@ static int mv64x60_cpu_err_probe(struct platform_device *pdev)
>>   					      "cpu", 1, NULL, 0, 0, NULL, 0,
>>   					      edac_dev_idx);
>>   	if (!edac_dev) {
>> -		devres_release_group(&pdev->dev, mv64x60_cpu_err_probe);
>> -		return -ENOMEM;
>> +		res = -ENOMEM;
>> +		goto release_group;
>>   	}
>>   
>>   	pdata = edac_dev->pvt_info;
>> @@ -561,8 +561,9 @@ static int mv64x60_cpu_err_probe(struct platform_device *pdev)
>>   err2:
>>   	edac_device_del_device(&pdev->dev);
>>   err:
>> -	devres_release_group(&pdev->dev, mv64x60_cpu_err_probe);
>>   	edac_device_free_ctl_info(edac_dev);
>> +release_group:
>> +	devres_release_group(&pdev->dev, mv64x60_cpu_err_probe);
>>   	return res;
>>   }
>>   
>> -- 
> Thanks, looks good. But looking at this driver, mv64x60_mc_err_probe()
> and mv64x60_sram_err_probe() have the same problem too. Can you address them
> with your patch too pls?
Will do. mv64x60_pci_err_probe() also needs some tweaks.

> Also, if you feel like fixing more stuff in this driver, it doesn't use
> the edac_printk() infrastructure but naked printk() calls. It could be
> converted to it.
I will only propose to remove a useless message and improve another one, 
but won't convert the whole driver, sorry.

CJ

> Thx.
>

