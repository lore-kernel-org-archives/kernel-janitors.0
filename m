Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C3B63AC
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 23E9D123
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 02:33:11 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D322C2F4;
	Thu,  2 Nov 2023 02:33:52 -0700 (PDT)
Received: from [10.57.81.158] (unknown [10.57.81.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4FF83F67D;
	Thu,  2 Nov 2023 02:33:09 -0700 (PDT)
Message-ID: <7e96a041-dcba-4116-b797-38464a2b2b62@arm.com>
Date: Thu, 2 Nov 2023 09:33:08 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: trbe: Fix an IS_ERR() vs NULL check
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, kernel-janitors@vger.kernel.org
References: <ee0d1f92-b0c3-4f4e-8e16-2aabd47a3447@kili.mountain>
 <536d621a-19fa-4d2f-8bc1-ca7747de7921@arm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <536d621a-19fa-4d2f-8bc1-ca7747de7921@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2023 08:31, Anshuman Khandual wrote:
> On 11/2/23 13:22, Dan Carpenter wrote:
>> This code was changed from using coresight_get_platform_data() which
>> returns error pointers to devm_kzalloc() which returns NULL.  Update
>> the check to match.
>>
>> Fixes: 4817af577b82 ("coresight: trbe: Add a representative coresight_platform_data for TRBE")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
>> index a3954be7b1f3..228ea85cfc74 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -1265,7 +1265,7 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
>>   	 * into the device for that purpose.
>>   	 */
>>   	desc.pdata = devm_kzalloc(dev, sizeof(*desc.pdata), GFP_KERNEL);
>> -	if (IS_ERR(desc.pdata))
>> +	if (!desc.pdata)
> 
> Although this might not be applicable here, given the input size is always
> valid, devm_kzalloc() might also return ZERO_SIZE_PTR as well.

It will not return ZERO_SIZE_PTR for a non-zero size.

Suzuki

> 
> /*
>   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
>   *
>   * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
>   *
>   * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
>   * Both make kfree a no-op.
>   */
> #define ZERO_SIZE_PTR ((void *)16)
> 
> #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
>                                  (unsigned long)ZERO_SIZE_PTR)
> 
> Hence should ZERO_OR_NULL_PTR() check be used instead ?
> 
>>   		goto cpu_clear;
>>   
>>   	desc.type = CORESIGHT_DEV_TYPE_SINK;

