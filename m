From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 23 Nov 2018 20:27:08 +0000
Subject: Re: [PATCH] ide-atapi: Check for blk_mq_alloc_request() errors
Message-Id: <33de139d-8650-9579-624e-f54042b3985d@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181123071823.zc6lfurqf3o2qn4b@kili.mountain>
In-Reply-To: <20181123071823.zc6lfurqf3o2qn4b@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/23/18 1:24 PM, Dan Carpenter wrote:
> On Fri, Nov 23, 2018 at 12:54:32PM -0700, Jens Axboe wrote:
>> On 11/23/18 12:18 AM, Dan Carpenter wrote:
>>> If blk_mq_alloc_request() fails then it leads to an error pointer
>>> dereference.
>>
>> Thanks, this should not error, as we're getting the one and only
>> reserved tag. That's why it doesn't check. So I think if we're
>> going to add code to a case that can't happen, it should at least
>> be accompanied by a error print of some sort.
> 
> Ah.  Fine.  Let's not add code just to make the static checker happy.
> 
> We should leave it as-is.

Agree, but I think it deserves a comment :-)

-- 
Jens Axboe
