From: Asias He <asias@redhat.com>
Date: Thu, 06 Sep 2012 03:04:15 +0000
Subject: Re: [patch] virtio-blk: fix NULL checking in virtblk_alloc_req()
Message-Id: <504812AF.5060607@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123252.GE6128@elgon.mountain>
	<871uifj1vr.fsf@rustcorp.com.au>
In-Reply-To: <871uifj1vr.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>

On 09/06/2012 10:55 AM, Rusty Russell wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
>> Smatch complains about the inconsistent NULL checking here.  Fix it to
>> return NULL on failure.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> This is only needed in linux-next.
> 
> Nice!
> 
>> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
>> index 2edfb5c..457db0c 100644
>> --- a/drivers/block/virtio_blk.c
>> +++ b/drivers/block/virtio_blk.c
>> @@ -90,10 +90,11 @@ static inline struct virtblk_req *virtblk_alloc_req(struct virtio_blk *vblk,
>>  	struct virtblk_req *vbr;
>>  
>>  	vbr = mempool_alloc(vblk->pool, gfp_mask);
>> -	if (vbr && use_bio)
>> -		sg_init_table(vbr->sg, vblk->sg_elems);
>> +	if (!vbr)
>> +		return NULL;
>>  
>> -	vbr->vblk = vblk;
>> +	if (use_bio)
>> +		sg_init_table(vbr->sg, vblk->sg_elems);
>>  
>>  	return vbr;
>>  }
> 
> But it turns out that "vbr->vblk = vblk;" assignment is important :)

I was just replying ;-)

> Fixed and applied,

Thanks Rusty!

-- 
Asias
