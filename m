From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 28 Apr 2020 20:13:28 +0000
Subject: Re: [PATCH] firmware: stratix10-svc: Fix some error handling paths in 'stratix10_svc_drv_probe()'
Message-Id: <f812994a-3de7-00d7-5f06-2e819d8be3f3@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426190307.40840-1-christophe.jaillet@wanadoo.fr>
 <20200428115510.GA2014@kadam>
In-Reply-To: <20200428115510.GA2014@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: richard.gong@linux.intel.com, gregkh@linuxfoundation.org, atull@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 28/04/2020 à 13:55, Dan Carpenter a écrit :
> On Sun, Apr 26, 2020 at 09:03:07PM +0200, Christophe JAILLET wrote:
>> If an error occurs after calling 'kfifo_alloc()', the allocated memory
>> should be freed with 'kfifo_free()', as already done in the remove
>> function.
>>
>> Fixes: b5dc75c915cd ("firmware: stratix10-svc: extend svc to support new RSU features")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/firmware/stratix10-svc.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
>> index d5f0769f3761..cc9df9589195 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
>> @@ -1043,24 +1043,31 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
>>   
>>   	/* add svc client device(s) */
>>   	svc = devm_kzalloc(dev, sizeof(*svc), GFP_KERNEL);
>> -	if (!svc)
>> -		return -ENOMEM;
>> +	if (!svc) {
>> +		ret = -ENOMEM;
>> +		goto err_free_kfifo;
>> +	}
>>   
>>   	svc->stratix10_svc_rsu = platform_device_alloc(STRATIX10_RSU, 0);
>>   	if (!svc->stratix10_svc_rsu) {
>>   		dev_err(dev, "failed to allocate %s device\n", STRATIX10_RSU);
>> -		return -ENOMEM;
>> +		ret = -ENOMEM;
>> +		goto err_free_kfifo;
>>   	}
>>   
>>   	ret = platform_device_add(svc->stratix10_svc_rsu);
>>   	if (ret) {
>>   		platform_device_put(svc->stratix10_svc_rsu);
> Why not move this to the unwind code as well and do "goto put_platform;"?

Sure, I'll send a V2.

CJ


> regards,
> dan carpenter
>
>> -		return ret;
>> +		goto err_free_kfifo;
>>   	}
>>   	dev_set_drvdata(dev, svc);
>>   
>>   	pr_info("Intel Service Layer Driver Initialized\n");
>>   
>> +	return 0;
>> +
>> +err_free_kfifo:
>> +	kfifo_free(&controller->svc_fifo);
>>   	return ret;
>>   }
>
