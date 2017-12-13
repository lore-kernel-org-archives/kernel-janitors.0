From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 13 Dec 2017 18:20:37 +0000
Subject: Re: IB/mlx4: Potential buffer overflow in _mlx4_set_path()
Message-Id: <20171213182037.GF5984@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143923.26dqc3ekhbmtmsgt@mwanda>
In-Reply-To: <20171205143923.26dqc3ekhbmtmsgt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yishai Hadas <yishaih@mellanox.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 05, 2017 at 05:39:23PM +0300, Dan Carpenter wrote:
> Smatch complains about this code:
> 
>     drivers/infiniband/hw/mlx4/qp.c:1827 _mlx4_set_path()
>     error: buffer overflow 'dev->dev->caps.gid_table_len' 3 <= 255
> 
> The mlx4_ib_gid_index_to_real_index() does check that "port" is within
> bounds, but we don't check the return value for errors.  It seems simple
> enough to add a check for that.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Leon Romanovsky <leonro@mellanox.com>

Thanks, applied to -next

Jason
