From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 08 Jul 2020 19:14:43 +0000
Subject: Re: [PATCH] io_uring: fix a use after free in io_async_task_func()
Message-Id: <8d70f6ba-4f9f-24da-1dc2-83af554316b8@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200708184711.GA31157@mwanda>
 <4ea3c931-1738-14e2-aac6-55ef9b3dedeb@gmail.com>
In-Reply-To: <4ea3c931-1738-14e2-aac6-55ef9b3dedeb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Begunkov <asml.silence@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/8/20 1:01 PM, Pavel Begunkov wrote:
> On 08/07/2020 21:47, Dan Carpenter wrote:
>> The "apoll" variable is freed and then used on the next line.  We need
>> to move the free down a few lines.
> 
> My bad, thanks for spotting that!
> A comment below
> 
>>
>> Fixes: 0be0b0e33b0b ("io_uring: simplify io_async_task_func()")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  fs/io_uring.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/io_uring.c b/fs/io_uring.c
>> index 70828e2470e2..f2993070a9e8 100644
>> --- a/fs/io_uring.c
>> +++ b/fs/io_uring.c
>> @@ -4652,12 +4652,13 @@ static void io_async_task_func(struct callback_head *cb)
>>  	/* restore ->work in case we need to retry again */
>>  	if (req->flags & REQ_F_WORK_INITIALIZED)
>>  		memcpy(&req->work, &apoll->work, sizeof(req->work));
>> -	kfree(apoll);
> 
> __io_req_task_submit() can take some time, e.g. waiting for a mutex, so
> I'd rather free it before, but save req->poll.canceled in a local var.

It's 64 bytes of data, really doesn't matter. Let's just keep it simple.

-- 
Jens Axboe
