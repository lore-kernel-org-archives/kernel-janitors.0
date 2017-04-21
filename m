From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 21 Apr 2017 22:50:46 +0000
Subject: Re: [PATCH 1/2] lightnvm: potential underflow in pblk_read_rq()
Message-Id: <6837484f-46b6-f36d-1387-bd02c25bd866@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421205301.3ds7jrgcktuldvrp@mwanda>
In-Reply-To: <20170421205301.3ds7jrgcktuldvrp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Matias Bjorling <mb@lightnvm.io>, =?UTF-8?Q?Javier_Gonz=c3=a1lez?= <jg@lightnvm.io>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 04/21/2017 02:53 PM, Dan Carpenter wrote:
> This is a static checker fix, and perhaps not a real bug.  The static
> checker thinks that nr_secs could be negative.  It would result in
> zeroing more memory than intended.  Anyway, even if it's not a bug,
> changing this variable to unsigned makes the code easier to audit.
> 
> Fixes: a4bd217b4326 ("lightnvm: physical block device (pblk) target")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Added, thanks Dan.


-- 
Jens Axboe

