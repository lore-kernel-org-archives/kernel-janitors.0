From: David Miller <davem@davemloft.net>
Date: Fri, 18 Aug 2017 23:29:22 +0000
Subject: Re: [PATCH] mlx5: ensure 0 is returned when vport is zero
Message-Id: <20170818.162922.1769160270805446057.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170818134925.16604-1-colin.king@canonical.com>
In-Reply-To: <20170818134925.16604-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: saeedm-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Aug 2017 14:49:25 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently, if vport is zero then then an uninialized return status
> in err is returned.  Since the only return status at the end of the
> function esw_add_uc_addr is zero for the current set of return paths
> we may as well just return 0 rather than err to fix this issue.
> 
> Detected by CoverityScan, CID#1452698 ("Uninitialized scalar variable")
> 
> Fixes: eeb66cdb6826 ("net/mlx5: Separate between E-Switch and MPFS")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
