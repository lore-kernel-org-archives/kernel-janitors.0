From: walter harms <wharms@bfs.de>
Date: Wed, 15 Jul 2015 11:35:16 +0000
Subject: Re: [patch] vhost: NULL vs ERR_PTR bug
Message-Id: <55A64574.1090907@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150715111659.GA22854@mwanda> <20150715142420-mutt-send-email-mst@redhat.com>
In-Reply-To: <20150715142420-mutt-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org



Am 15.07.2015 13:28, schrieb Michael S. Tsirkin:
> On Wed, Jul 15, 2015 at 02:16:59PM +0300, Dan Carpenter wrote:
>> There is only one caller for vhost_kvzalloc() and it expects NULL on
>> allocation failure.  Most people would probably expect that so let's
>> change ERR_PTR(-ENOMEM) to NULL.
>>
>> Fixes: 4de7255f7d2b ('vhost: extend memory regions allocation to vmalloc')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Ouch. Thanks a lot for noticing this, and it's a good thing
> you did before Linus merged it.
> I'll squash this into Igor's patch and redo my pull request.
> 

Is this function needed at all ?

e.g. I followed vzalloc() to __vmalloc_node_range()

a check for size=0 seems to be done there.

re,
 wh


>>
>> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>> index a9fe859..99d613b 100644
>> --- a/drivers/vhost/vhost.c
>> +++ b/drivers/vhost/vhost.c
>> @@ -686,7 +686,7 @@ static void *vhost_kvzalloc(unsigned long size)
>>  	if (!n) {
>>  		n = vzalloc(size);
>>  		if (!n)
>> -			return ERR_PTR(-ENOMEM);
>> +			return NULL;
>>  	}
>>  	return n;
>>  }
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
