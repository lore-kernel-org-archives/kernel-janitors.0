From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 20:46:48 +0000
Subject: Re: [PATCH] dmaengine: iop-adma: make array 'handler' static const, makes object smaller
Message-Id: <86c660c4-fccf-4854-188b-c5eefb3e742d@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905163726.19690-1-colin.king@canonical.com>
 <20190925204315.GK3824@vkoul-mobl>
In-Reply-To: <20190925204315.GK3824@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 25/09/2019 21:43, Vinod Koul wrote:
> On 05-09-19, 17:37, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Don't populate the array 'handler' on the stack but instead make it
>> static const. Makes the object code smaller by 80 bytes.
>>
>> Before:
>>    text	   data	    bss	    dec	    hex	filename
>>   38225	   9084	     64	  47373	   b90d	drivers/dma/iop-adma.o
>>
>> After:
>>    text	   data	    bss	    dec	    hex	filename
>>   38081	   9148	     64	  47293	   b8bd	drivers/dma/iop-adma.o
>>
>> (gcc version 9.2.1, amd64)
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/dma/iop-adma.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/dma/iop-adma.c b/drivers/dma/iop-adma.c
>> index a3f942a6a946..4dc5478fc156 100644
>> --- a/drivers/dma/iop-adma.c
>> +++ b/drivers/dma/iop-adma.c
>> @@ -1359,9 +1359,11 @@ static int iop_adma_probe(struct platform_device *pdev)
>>  	iop_adma_device_clear_err_status(iop_chan);
>>  
>>  	for (i = 0; i < 3; i++) {
>> -		irq_handler_t handler[] = { iop_adma_eot_handler,
>> -					iop_adma_eoc_handler,
>> -					iop_adma_err_handler };
>> +		static const irq_handler_t handler[] = {
>> +			iop_adma_eot_handler,
>> +			iop_adma_eoc_handler,
>> +			iop_adma_err_handler
> 
> would it not be more apt to declare the handler outside the loop!

Originally yes, but now it's static, no.

> 
>> +		};
>>  		int irq = platform_get_irq(pdev, i);
>>  		if (irq < 0) {
>>  			ret = -ENXIO;
>> -- 
>> 2.20.1
> 
