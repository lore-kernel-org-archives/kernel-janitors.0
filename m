From: Eli Cohen <eli@dev.mellanox.co.il>
Date: Sun, 28 Jul 2013 07:23:36 +0000
Subject: Re: [patch] IB/mlx5: stack info leak in mlx5_ib_alloc_ucontext()
Message-Id: <20130728072336.GB29427@mtldesk30>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130725170436.GC7026@elgon.mountain>
In-Reply-To: <20130725170436.GC7026@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eli Cohen <eli@mellanox.com>, Roland Dreier <roland@kernel.org>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 25, 2013 at 08:04:36PM +0300, Dan Carpenter wrote:
> We don't set "resp.reserved".  Since it's at the end of the struct that
> means we don't have to copy it to the user.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
> index 8000fff..43dfb84 100644
> --- a/drivers/infiniband/hw/mlx5/main.c
> +++ b/drivers/infiniband/hw/mlx5/main.c
> @@ -619,7 +619,8 @@ static struct ib_ucontext *mlx5_ib_alloc_ucontext(struct ib_device *ibdev,
>  
>  	resp.tot_uuars = req.total_num_uuars;
>  	resp.num_ports = dev->mdev.caps.num_ports;
> -	err = ib_copy_to_udata(udata, &resp, sizeof(resp));
> +	err = ib_copy_to_udata(udata, &resp,
> +			       sizeof(resp) - sizeof(resp.reserved));
>  	if (err)
>  		goto out_uars;
>

I don't have strong opinion on this one. The title of the patch is
stack info leak but the only leak of a reserved field. Other opinions?
