From: Roland Dreier <roland@purestorage.com>
Date: Thu, 16 Aug 2012 16:05:56 +0000
Subject: Re: [infiniband:for-next 9/19] drivers/net/ethernet/mellanox/mlx4/mr.c:134:4: error: implicit declar
Message-Id: <CAL1RGDW0w3oi+HuENWBqzAXMvLpHji_Z+B4qO9XNvvDsKEnrEA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120816003552.GA3532@localhost>
In-Reply-To: <20120816003552.GA3532@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Aug 15, 2012 at 5:35 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> drivers/net/ethernet/mellanox/mlx4/mr.c: In function 'mlx4_buddy_init':
> drivers/net/ethernet/mellanox/mlx4/mr.c:134:4: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
> drivers/net/ethernet/mellanox/mlx4/mr.c:134:19: warning: assignment makes pointer from integer without a cast [enabled by default]
> drivers/net/ethernet/mellanox/mlx4/mr.c:149:4: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

Stephen caught this in -next testing too, should be fixed today.

Thanks!
  Roland
