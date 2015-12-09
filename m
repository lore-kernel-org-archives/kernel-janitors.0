From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 09 Dec 2015 15:04:53 +0000
Subject: Re: [patch] blk-integrity: checking for NULL instead of IS_ERR
Message-Id: <56684315.8060506@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209102123.GA3173@mwanda>
In-Reply-To: <20151209102123.GA3173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Keith Busch <keith.busch@intel.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/09/2015 03:21 AM, Dan Carpenter wrote:
> We recently changed bio_integrity_alloc() to return ERR_PTRs instead of
> NULL but these calls were missed.
>
> Fixes: 06c1e3902aa7 ('blk-integrity: empty implementation when disabled')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

-- 
Jens Axboe

