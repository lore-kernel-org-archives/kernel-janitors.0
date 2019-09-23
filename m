From: Keith Busch <kbusch@kernel.org>
Date: Mon, 23 Sep 2019 14:26:30 +0000
Subject: Re: [PATCH] nvme: fix an error code in nvme_init_subsystem()
Message-Id: <20190923142630.GA14804@C02WT3WMHTD6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190923141836.GA31251@mwanda>
In-Reply-To: <20190923141836.GA31251@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sagi Grimberg <sagi@grimberg.me>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>

On Mon, Sep 23, 2019 at 05:18:36PM +0300, Dan Carpenter wrote:
> "ret" should be a negative error code here, but it's either success or
> possibly uninitialized.
> 
> Fixes: 32fd90c40768 ("nvme: change locking for the per-subsystem controller list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, patch looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>
