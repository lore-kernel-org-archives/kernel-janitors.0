From: walter harms <wharms@bfs.de>
Date: Thu, 27 Nov 2014 15:23:32 +0000
Subject: Re: [PATCH 2/2] staging: android: ion: One function call less in ion_buffer_create() after error det
Message-Id: <547741F4.2090306@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54722AF8.3000609@users.sourceforge.net>
In-Reply-To: <54722AF8.3000609@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 27.11.2014 15:25, schrieb SF Markus Elfring:
>>> diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
>>> index df12cc3..7a26b85 100644
>>> --- a/drivers/staging/android/ion/ion.c
>>> +++ b/drivers/staging/android/ion/ion.c
>>> @@ -226,7 +226,7 @@ static struct ion_buffer *ion_buffer_create(struct ion_heap *heap,
>>>  		buffer->pages = vmalloc(sizeof(struct page *) * num_pages);
>>>  		if (!buffer->pages) {
>>>  			ret = -ENOMEM;
>>> -			goto err1;
>>> +			goto err2;
>>>  		}
>>>  
>>>  		for_each_sg(table->sgl, sg, table->nents, i) {
>>> @@ -262,7 +262,6 @@ static struct ion_buffer *ion_buffer_create(struct ion_heap *heap,
>>>  err:
>>>  	heap->ops->unmap_dma(heap, buffer);
>>>  	heap->ops->free(buffer);
>>> -err1:
>>>  	vfree(buffer->pages);
>>>  err2:
>>
>> Now we have "err" and "err2", which doesn't make much sense,
>> please fix up.
> 
> How do you want this source code to be improved?
> Should I introduce longer names for the affected jump labels?
> 

hi markus,
the confusion arises because the errX are numbered and now on in the sequence is missing.

So far i see you can renumber them or give more descriptiv names.

hope that helps,
re,
 wh
