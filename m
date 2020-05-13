From: Kishon Vijay Abraham I <kishon@ti.com>
Date: Wed, 13 May 2020 02:35:28 +0000
Subject: Re: [PATCH -next] phy: ti: j721e-wiz: Fix some error return code in wiz_probe()
Message-Id: <fc4b4490-c3d1-aad0-59ee-76585b562ed3@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507054109.110849-1-weiyongjun1@huawei.com>
 <f5cd603f-0f0b-23a4-310a-3a40f8f4f69a@ti.com>
In-Reply-To: <f5cd603f-0f0b-23a4-310a-3a40f8f4f69a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Roger Quadros <rogerq@ti.com>, Wei Yongjun <weiyongjun1@huawei.com>, Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jyri Sarha <jsarha@ti.com>, Sekhar Nori <nsekhar@ti.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>



On 5/7/2020 12:11 PM, Roger Quadros wrote:
> 
> 
> On 07/05/2020 08:41, Wei Yongjun wrote:
>> Fix to return negative error code from some error handling
>> cases instead of 0, as done elsewhere in this function.
>>
>> Fixes: 091876cc355d ("phy: ti: j721e-wiz: Add support for WIZ module present
>> in TI J721E SoC")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Acked-by: Roger Quadros <rogerq@ti.com>

merged, thanks!

-Kishon
> 
>> ---
>>   drivers/phy/ti/phy-j721e-wiz.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
>> index 1d12d1b1b63a..30ea5b207285 100644
>> --- a/drivers/phy/ti/phy-j721e-wiz.c
>> +++ b/drivers/phy/ti/phy-j721e-wiz.c
>> @@ -841,8 +841,10 @@ static int wiz_probe(struct platform_device *pdev)
>>       }
>>         base = devm_ioremap(dev, res.start, resource_size(&res));
>> -    if (!base)
>> +    if (!base) {
>> +        ret = -ENOMEM;
>>           goto err_addr_to_resource;
>> +    }
>>         regmap = devm_regmap_init_mmio(dev, base, &wiz_regmap_config);
>>       if (IS_ERR(regmap)) {
>> @@ -859,6 +861,7 @@ static int wiz_probe(struct platform_device *pdev)
>>         if (num_lanes > WIZ_MAX_LANES) {
>>           dev_err(dev, "Cannot support %d lanes\n", num_lanes);
>> +        ret = -ENODEV;
>>           goto err_addr_to_resource;
>>       }
>>   @@ -948,6 +951,7 @@ static int wiz_probe(struct platform_device *pdev)
>>       serdes_pdev = of_platform_device_create(child_node, NULL, dev);
>>       if (!serdes_pdev) {
>>           dev_WARN(dev, "Unable to create SERDES platform device\n");
>> +        ret = -ENOMEM;
>>           goto err_pdev_create;
>>       }
>>       wiz->serdes_pdev = serdes_pdev;
>>
>>
>>
> 
> cheers,
> -roger
