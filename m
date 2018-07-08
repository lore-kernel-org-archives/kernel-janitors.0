From: Christoph Hellwig <hch@lst.de>
Date: Sun, 08 Jul 2018 15:07:55 +0000
Subject: Re: [PATCH] IB/core: type promotion bug in rdma_rw_init_one_mr()
Message-Id: <20180708150755.GB14418@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
In-Reply-To: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 12:32:12PM +0300, Dan Carpenter wrote:
> "nents" is an unsigned int, so if ib_map_mr_sg() returns a negative
> error code then it's type promoted to a high unsigned int which is
> treated as success.
> 
> Fixes: a060b5629ab0 ("IB/core: generic RDMA READ/WRITE API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
