From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 23 Mar 2012 08:58:07 +0000
Subject: Re: [patch] block: use caller's GFP flags instead of GFP_KERNEL
Message-Id: <4F6C3B1F.9090703@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323083624.GC18239@elgon.mountain>
In-Reply-To: <20120323083624.GC18239@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 03/23/2012 09:36 AM, Dan Carpenter wrote:
> We should use the GFP flags that the caller specified instead of picking
> our own.  All the callers specify GFP_KERNEL so this doesn't make a
> difference to how the kernel runs, it's just a cleanup.

Thanks Dan, applied to for-3.4/core

-- 
Jens Axboe

