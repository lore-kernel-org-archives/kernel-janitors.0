From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Nov 2014 14:25:43 +0000
Subject: Re: [PATCH 2/2] staging: android: ion: One function call less in ion_buffer_create() after error det
Message-Id: <54773467.40109@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <54722893.6020301@users.sourceforge.net> <54722AF8.3000609@users.sourceforge.net> <20141126214226.GB31904@kroah.com>
In-Reply-To: <20141126214226.GB31904@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
>> index df12cc3..7a26b85 100644
>> --- a/drivers/staging/android/ion/ion.c
>> +++ b/drivers/staging/android/ion/ion.c
>> @@ -226,7 +226,7 @@ static struct ion_buffer *ion_buffer_create(struct ion_heap *heap,
>>  		buffer->pages = vmalloc(sizeof(struct page *) * num_pages);
>>  		if (!buffer->pages) {
>>  			ret = -ENOMEM;
>> -			goto err1;
>> +			goto err2;
>>  		}
>>  
>>  		for_each_sg(table->sgl, sg, table->nents, i) {
>> @@ -262,7 +262,6 @@ static struct ion_buffer *ion_buffer_create(struct ion_heap *heap,
>>  err:
>>  	heap->ops->unmap_dma(heap, buffer);
>>  	heap->ops->free(buffer);
>> -err1:
>>  	vfree(buffer->pages);
>>  err2:
> 
> Now we have "err" and "err2", which doesn't make much sense,
> please fix up.

How do you want this source code to be improved?
Should I introduce longer names for the affected jump labels?

Regards,
Markus
