From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 01 May 2020 15:48:40 +0000
Subject: Re: [PATCH 4/4 v2] firmware: stratix10-svc: Slightly simplify code
Message-Id: <c7ac6b7c-a1d5-e001-964b-0881707c41b1@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
 <8c505c686438c54da61ad4fe15e1eae722011153.1588142343.git.christophe.jaillet@wanadoo.fr>
 <1f8ae50d-6830-7fbb-e999-3e8110fe7cd6@linux.intel.com>
In-Reply-To: <1f8ae50d-6830-7fbb-e999-3e8110fe7cd6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Richard Gong <richard.gong@linux.intel.com>, gregkh@linuxfoundation.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 01/05/2020 à 17:40, Richard Gong a écrit :
> Hi,
>
> On 4/29/20 1:52 AM, Christophe JAILLET wrote:
>> Replace 'devm_kmalloc_array(... | __GFP_ZERO)' with the equivalent and
>> shorter 'devm_kcalloc(...)'.
>>
> It doesn't make much sense.
> Actually devm_kcalloc returns devm_kmalloc_array(.., flag | __GFP_ZERO).
>
The only goal is to have a sightly less verbose code.
This saves one line of code and there is no need to wonder why we 
explicitly pass __GFP_ZERO to kmalloc_array.

Mostly a matter of taste.

'devm_kcalloc' is inlined, so the binary should be exactly the same.

CJ

>> 'ctrl->genpool' can not be NULL, so axe a useless test in the remove
>> function.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/firmware/stratix10-svc.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/firmware/stratix10-svc.c 
>> b/drivers/firmware/stratix10-svc.c
>> index 739004398877..c228337cb0a1 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
>> @@ -1002,8 +1002,7 @@ static int stratix10_svc_drv_probe(struct 
>> platform_device *pdev)
>>       if (!controller)
>>           return -ENOMEM;
>>   -    chans = devm_kmalloc_array(dev, SVC_NUM_CHANNEL,
>> -                   sizeof(*chans), GFP_KERNEL | __GFP_ZERO);
>> +    chans = devm_kcalloc(dev, SVC_NUM_CHANNEL, sizeof(*chans), 
>> GFP_KERNEL);
>>       if (!chans)
>>           return -ENOMEM;
>>   @@ -1086,8 +1085,7 @@ static int stratix10_svc_drv_remove(struct 
>> platform_device *pdev)
>>           kthread_stop(ctrl->task);
>>           ctrl->task = NULL;
>>       }
>> -    if (ctrl->genpool)
>> -        gen_pool_destroy(ctrl->genpool);
>> +    gen_pool_destroy(ctrl->genpool);
>>       list_del(&ctrl->node);
>>         return 0;
>>
>
> Regards,
> Richard
>
