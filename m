From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 03 Jun 2020 00:36:06 +0000
Subject: Re: [PATCH -next] IB/hfi1: Use free_netdev() in hfi1_netdev_free()
Message-Id: <20200603003606.GA132773@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200601135644.GD4872@ziepe.ca>
 <20200602061635.31224-1-yuehaibing@huawei.com>
In-Reply-To: <20200602061635.31224-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: mike.marciniszyn@intel.com, dennis.dalessandro@intel.com, dledford@redhat.com, sadanand.warrier@intel.com, grzegorz.andrejczuk@intel.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org

On Tue, Jun 02, 2020 at 02:16:35PM +0800, YueHaibing wrote:
> dummy_netdev shold be freed by free_netdev() instead of
> kfree(). Also remove unneeded variable 'priv'
> 
> Fixes: 4730f4a6c6b2 ("IB/hfi1: Activate the dummy netdev")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
> ---
>  drivers/infiniband/hw/hfi1/netdev_rx.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Applied to for-next, thanks

Jason
