From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 29 Mar 2012 18:57:31 +0000
Subject: Re: [patch] blkcg: change a spin_lock() to spin_lock_irq()
Message-Id: <4F74B09B.3070100@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120329185119.GA21812@elgon.mountain>
In-Reply-To: <20120329185119.GA21812@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2012-03-29 20:51, Dan Carpenter wrote:
> Smatch complains that we re-enable IRQs twice.  It looks like we forgot
> to disable them here on the spin_trylock() failure path.  This was added
> in 9f13ef678e "blkcg: use double locking instead of RCU for blkg
> synchronization".

Thanks, that is indeed a screwup. Fix applied.

-- 
Jens Axboe

