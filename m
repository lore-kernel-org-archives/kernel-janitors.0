From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 08 Jul 2020 19:15:47 +0000
Subject: Re: [PATCH] io_uring: fix a use after free in io_async_task_func()
Message-Id: <58b9349b-22fd-e474-c746-2d3b542f5b23@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200708184711.GA31157@mwanda>
In-Reply-To: <20200708184711.GA31157@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/8/20 12:47 PM, Dan Carpenter wrote:
> The "apoll" variable is freed and then used on the next line.  We need
> to move the free down a few lines.

Thanks for spotting this Dan, applied.

-- 
Jens Axboe
