From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 05 Nov 2014 20:41:11 +0000
Subject: Re: [patch -next] NVMe: blk_mq_alloc_request() returns error pointers
Message-Id: <545A8B67.7060809@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141105203909.GB26314@mwanda>
In-Reply-To: <20141105203909.GB26314@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/05/2014 01:39 PM, Dan Carpenter wrote:
> We recently converted this to blk_mq but the error checks have to be
> updated to check for IS_ERR() instead of NULL.

Ah good catch, thanks Dan.

-- 
Jens Axboe

