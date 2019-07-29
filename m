From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Date: Mon, 29 Jul 2019 12:14:30 +0000
Subject: Re: [PATCH] media: vsp1: fix memory leak of dl on error return path
Message-Id: <dd5e9421-9d32-0cad-9411-575569766b2f@ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190728171124.14202-1-colin.king@canonical.com>
 <e5c3dede-2c59-4c64-7a8c-f022ee06cbfa@ideasonboard.com>
 <22ff8757-fd79-a279-f55e-fc7c8d204a60@canonical.com>
In-Reply-To: <22ff8757-fd79-a279-f55e-fc7c8d204a60@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 29/07/2019 13:12, Colin Ian King wrote:
> On 29/07/2019 13:11, Kieran Bingham wrote:
>> Hi Colin,
>>
>> On 28/07/2019 18:11, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Currently when the call vsp1_dl_body_get fails and returns null the
>>> error return path leaks the allocation of dl. Fix this by kfree'ing
>>> dl before returning.
>>
>> Eeep. This does indeed look to be the case.
>>
>>>
>>> Addresses-Coverity: ("Resource leak")
>>> Fixes: 5d7936b8e27d ("media: vsp1: Convert display lists to use new body pool")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>
>> Thank you!
> 
> Thank static analysis :-)

Bah, that's just the hammer - you're the one finding the nails :-D
--
Kieran


> 
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>>
>>> ---
>>>  drivers/media/platform/vsp1/vsp1_dl.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/vsp1/vsp1_dl.c b/drivers/media/platform/vsp1/vsp1_dl.c
>>> index 104b6f514536..d7b43037e500 100644
>>> --- a/drivers/media/platform/vsp1/vsp1_dl.c
>>> +++ b/drivers/media/platform/vsp1/vsp1_dl.c
>>> @@ -557,8 +557,10 @@ static struct vsp1_dl_list *vsp1_dl_list_alloc(struct vsp1_dl_manager *dlm)
>>>  
>>>  	/* Get a default body for our list. */
>>>  	dl->body0 = vsp1_dl_body_get(dlm->pool);
>>> -	if (!dl->body0)
>>> +	if (!dl->body0) {
>>> +		kfree(dl);
>>>  		return NULL;
>>> +	}
>>>  
>>>  	header_offset = dl->body0->max_entries * sizeof(*dl->body0->entries);
>>>  
>>>
>>
> 
