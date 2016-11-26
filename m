From: David Miller <davem@davemloft.net>
Date: Sat, 26 Nov 2016 01:30:17 +0000
Subject: Re: [patch] net/mlx5: remove a duplicate condition
Message-Id: <20161125.203017.430757314871566294.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161124110345.GC17225@mwanda>
In-Reply-To: <20161124110345.GC17225@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Cc: saeedm-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 14:03:45 +0300

> We verified that MLX5_FLOW_CONTEXT_ACTION_COUNT was set on the first
> line of the function so we don't need to check again here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
