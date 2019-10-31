From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 31 Oct 2019 12:57:06 +0000
Subject: Re: [PATCH] io_uring: signedness bug in io_async_cancel()
Message-Id: <a697c16b-92bb-52a3-e2e8-5f24d75f580d@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191031105547.GC26612@mwanda>
In-Reply-To: <20191031105547.GC26612@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/31/19 4:55 AM, Dan Carpenter wrote:
> The problem is that this enum is unsigned, and we do use "ret" for the
> enum values, but we also use it for negative error codes.  If it's not
> signed then it causes a problem in the error handling.

I noticed this one the other day, merged in a fix for it then. Not
an issue in the current tree, though linux-next may still have the
older one.

-- 
Jens Axboe
