From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 24 Nov 2011 11:59:38 +0000
Subject: Re: [patch] mtip32xx: uninitialized variable in mtip_quiesce_io()
Message-Id: <4ECE31AA.3020007@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111124114702.GA32522@elgon.mountain>
In-Reply-To: <20111124114702.GA32522@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Asai Thambi S P <asamymuthupa@micron.com>, Sam Bradshaw <sbradshaw@micron.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2011-11-24 12:47, Dan Carpenter wrote:
> We recently introduce new continue in the loop which make gcc complain.
> In theory if MTIP_FLAG_SVC_THD_ACTIVE_BIT is set, we could hit continue
> over and over until eventually we time out of the loop.  In that case
> "active" should be set as true, but right now it's uninitialized.

Thanks Dan, applied.

-- 
Jens Axboe

