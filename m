From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 26 Sep 2019 11:42:08 +0000
Subject: Re: [PATCH][next] io_uring: ensure variable ret is initialized to zero
Message-Id: <04262621-68fd-a4bb-ab0c-83954c03fbb0@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190926095012.31826-1-colin.king@canonical.com>
 <3aa821ea-3041-fb56-2458-ec643963c511@kernel.dk>
 <20190926113329.GE27389@kadam>
In-Reply-To: <20190926113329.GE27389@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin King <colin.king@canonical.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/26/19 1:33 PM, Dan Carpenter wrote:
> On Thu, Sep 26, 2019 at 11:56:30AM +0200, Jens Axboe wrote:
>> On 9/26/19 11:50 AM, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> In the case where sig is NULL the error variable ret is not initialized
>>> and may contain a garbage value on the final checks to see if ret is
>>> -ERESTARTSYS.  Best to initialize ret to zero before the do loop to
>>> ensure the ret does not accidentially contain -ERESTARTSYS before the
>>> loop.
>>
>> Oops, weird it didn't complain. I've folded in this fix, as that commit
>> isn't upstream yet. Thanks!
> 
> There is a bug in GCC where at certain optimization levels, instead of
> complaining, it initializes it to zero.

That's awfully nice of it ;-)

Tried with -O0 and still didn't complain for me.

$ gcc --version
gcc (Ubuntu 9.1.0-2ubuntu2~18.04) 9.1.0

Tried gcc 5/6/7/8 as well. Might have to go look at what code it's
generating.

-- 
Jens Axboe
