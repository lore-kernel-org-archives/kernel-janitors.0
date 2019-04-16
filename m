From: Robin Murphy <robin.murphy@arm.com>
Date: Tue, 16 Apr 2019 13:02:01 +0000
Subject: Re: [PATCH 01/12] arm-cci: add missing of_node_put after of_device_is_available
Message-Id: <b50cffe8-5fe4-eb44-adf4-48bf8604943a@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-2-git-send-email-Julia.Lawall@lip6.fr>
 <2c56bdcb-9354-c719-13df-38b5f1974f10@web.de>
In-Reply-To: <2c56bdcb-9354-c719-13df-38b5f1974f10@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Julia Lawall <Julia.Lawall@lip6.fr>, linux@arm.linux.org.uk
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14/04/2019 15:45, Markus Elfring wrote:
>> @@ -538,8 +538,10 @@  static int cci_probe(void)
>>   	struct resource res;
>>
>>   	np = of_find_matching_node(NULL, arm_cci_matches);
>> -	if (!of_device_is_available(np))
>> +	if (!of_device_is_available(np)) {
>> +		of_node_put(np);
>>   		return -ENODEV;
>> +	}
>>
>>   	ret = of_address_to_resource(np, 0, &res);
>>   	if (!ret) {
> 
> How do you think about to move this function call to an additional jump target
> for the desired exception handling?

TBH it looks like the whole thing could do with a bit of refactoring - 
strictly we should probably be dropping the node reference in all the 
other failure paths too.

Robin.
