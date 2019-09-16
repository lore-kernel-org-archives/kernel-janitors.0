From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 16 Sep 2019 19:43:43 +0000
Subject: Re: [PATCH] iommu/arm-smmu: Axe a useless test in 'arm_smmu_master_alloc_smes()'
Message-Id: <5babe7b3-07ba-cb07-82b0-4105d8e8b4fc@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190915193401.27426-1-christophe.jaillet@wanadoo.fr>
 <de9ee628-9efb-3078-590c-6852be61c7d2@arm.com>
In-Reply-To: <de9ee628-9efb-3078-590c-6852be61c7d2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, joro@8bytes.org
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Le 16/09/2019 à 12:46, Robin Murphy a écrit :
> On 15/09/2019 20:34, Christophe JAILLET wrote:
>> 'ommu_group_get_for_dev()' never returns NULL, so this test can be 
>> removed.
>
> Nit: typo in the function name.
>
> Otherwise, there definitely used to be some path where a NULL return 
> could leak out, so I would have had that in mind at the time I wrote 
> this, but apparently I never noticed that that had already been 
> cleaned up by the time this got merged.
>
Hi,

Maybe fixed by 72dcac633475 ("iommu: Warn once when device_group 
callback returns NULL")


CJ

> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
>
> Thanks,
> Robin.
>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/iommu/arm-smmu.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index c3ef0cc8f764..6fae8cdbe985 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -1038,8 +1038,6 @@ static int arm_smmu_master_alloc_smes(struct 
>> device *dev)
>>       }
>>         group = iommu_group_get_for_dev(dev);
>> -    if (!group)
>> -        group = ERR_PTR(-ENOMEM);
>>       if (IS_ERR(group)) {
>>           ret = PTR_ERR(group);
>>           goto out_err;
>>
>
