From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 15 Jun 2017 12:21:08 +0000
Subject: Re: [PATCH] nvme-rdma: fix error code in nvme_rdma_create_ctrl()
Message-Id: <20170615122108.xxih3xj44k6ltclk@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614104645.GO29394@elgon.mountain>
In-Reply-To: <20170614104645.GO29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2017 at 01:46:45PM +0300, Dan Carpenter wrote:
> We accidentally return ERR_PTR(0) which is NULL.  The caller isn't
> explicitly checking for that but I couldn't immediately spot whether
> this would lead to a NULL dereference.  Anyway, we can fix add an
> error code easily enough.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan,

applied to nvme-4.13.
