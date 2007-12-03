From: Roel Kluin <12o3l@tiscali.nl>
Date: Mon, 03 Dec 2007 00:40:22 +0000
Subject: Re: if(function()) BUG(); still bad?
Message-Id: <47535076.1040701@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47534BC4.1020701@tiscali.nl>
In-Reply-To: <47534BC4.1020701@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Matthew Wilcox wrote:
> On Mon, Dec 03, 2007 at 01:20:20AM +0100, Roel Kluin wrote:
>> for instance in a patch I saw this:
>>
>>> +		if (__blk_end_request(rq, 0, 0))
>>> +			BUG();
>>>  		spin_unlock(q->queue_lock);
>> If it's still bad, what should the fix be? (I'll write a script and post
>> patches)
> 
> This one should not be converted to a BUG_ON.  We always want to call
> __blk_end_request(), whether we have CONFIG_BUG or not.  This case just
> wants to test the return value.
> 

Ok, from your reply I can make up it's bad if the function in the if()
assigns a value, or has pointers as arguments, which it modifies.
