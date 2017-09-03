From: David Miller <davem@davemloft.net>
Date: Sun, 03 Sep 2017 17:57:38 +0000
Subject: Re: [PATCH][next] net/mlx4_core: fix incorrect size allocation for dev->caps.spec_qps
Message-Id: <20170903.105738.1741058008003610763.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831170724.3747-1-colin.king@canonical.com>
In-Reply-To: <20170831170724.3747-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: tariqt-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 31 Aug 2017 18:07:24 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The current allocation for dev->caps.spec_qps is for the size of the
> pointer and not the size of the actual  mlx4_spec_qps structure.  Fix
> this by using the correct size.   Also splint allocation over a few
> lines to make it cppcheck clean on overly wide lines.
> 
> Detected by CoverityScan, CID#1455222 ("Wrong sizeof argument")
> 
> Fixes: c73c8b1e47ca ("net/mlx4_core: Dynamically allocate structs at mlx4_slave_cap")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
