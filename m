From: Pavel Begunkov <asml.silence@gmail.com>
Date: Wed, 08 Jul 2020 19:28:51 +0000
Subject: Re: [PATCH] io_uring: fix a use after free in io_async_task_func()
Message-Id: <66d2af76-eee0-e30d-44e5-ed70d9d808a5@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200708184711.GA31157@mwanda>
 <58b9349b-22fd-e474-c746-2d3b542f5b23@kernel.dk>
In-Reply-To: <58b9349b-22fd-e474-c746-2d3b542f5b23@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/07/2020 22:15, Jens Axboe wrote:
> On 7/8/20 12:47 PM, Dan Carpenter wrote:
>> The "apoll" variable is freed and then used on the next line.  We need
>> to move the free down a few lines.
> 
> Thanks for spotting this Dan, applied.

I wonder why gcc can't find it... It shouldn't be hard to do after
marking free-like functions with an attribute.

Are there such tools for the kernel?

-- 
Pavel Begunkov
