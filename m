From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 05 May 2020 15:09:38 +0000
Subject: Re: [PATCH 2/4 v2] firmware: stratix10-svc: Unmap some previously memremap'ed memory
Message-Id: <5bae5684-6b3e-e94c-7745-046bd24c4f4b@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
 <43505dc3a4b405d1c7d4a0fa74c67eda3e8bdb75.1588142343.git.christophe.jaillet@wanadoo.fr>
 <20200505144355.GC838641@kroah.com>
In-Reply-To: <20200505144355.GC838641@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: richard.gong@linux.intel.com, atull@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 05/05/2020 à 16:43, Greg KH a écrit :
> On Wed, Apr 29, 2020 at 08:52:43AM +0200, Christophe JAILLET wrote:
>> In 'svc_create_memory_pool()' we memremap some memory. This has to be
>> undone in case of error and if the driver is removed.
>>
>> The easiest way to do it is to use 'devm_memremap()'.
>>
>> Fixes: 7ca5ce896524 ("firmware: add Intel Stratix10 service layer driver")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/firmware/stratix10-svc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
>> index 3a176e62754a..de5870f76c5e 100644
>> --- a/drivers/firmware/stratix10-svc.c
>> +++ b/drivers/firmware/stratix10-svc.c
>> @@ -631,7 +631,7 @@ svc_create_memory_pool(struct platform_device *pdev,
>>   	end = rounddown(sh_memory->addr + sh_memory->size, PAGE_SIZE);
>>   	paddr = begin;
>>   	size = end - begin;
>> -	va = memremap(paddr, size, MEMREMAP_WC);
>> +	va = devm_memremap(dev, paddr, size, MEMREMAP_WC);
>>   	if (!va) {
>>   		dev_err(dev, "fail to remap shared memory\n");
>>   		return ERR_PTR(-EINVAL);
> And there was no previous unmap happening when the pool was torn down
> that now needs to be removed?

I don't think so, there is no memunmap call in 'stratix10-svc.c'

CJ

> thanks,
>
> greg k-h
>
