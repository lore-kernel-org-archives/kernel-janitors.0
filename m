From: David Miller <davem@davemloft.net>
Date: Thu, 11 Jun 2015 23:13:22 +0000
Subject: Re: [patch -next] net/mlx5_core: fix an error code
Message-Id: <20150611.161322.1223689868555454353.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150611085001.GB27393@mwanda>
In-Reply-To: <20150611085001.GB27393@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Cc: eli-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, amirv-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 11:50:01 +0300

> We return success if mlx5e_alloc_sq_db() fails but we should return an
> error code.
> 
> Fixes: f62b8bb8f2d3 ('net/mlx5: Extend mlx5_core to support ConnectX-4 Ethernet functionality')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
