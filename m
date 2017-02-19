From: Majd Dibbiny <majd@mellanox.com>
Date: Sun, 19 Feb 2017 17:11:05 +0000
Subject: Re: [PATCH 08/29] IB/mlx4: Delete an unnecessary check before the function call "kfree" in free_pv_o
Message-Id: <94F12CE9-FC8B-4C5A-92D0-2B8CE63815E9@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>,<1070bd22-757a-e0c9-551d-44c31f5c11cc@users.sourceforge.net>
In-Reply-To: <1070bd22-757a-e0c9-551d-44c31f5c11cc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Leon Romanovsky <leonro@mellanox.com>, Matan Barak <matanb@mellanox.com>, Sean Hefty <sean.hefty@intel.com>, Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


> On Feb 18, 2017, at 11:28 PM, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 17 Feb 2017 22:06:24 +0100
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> WARNING: kfree(NULL) is safe and this check is probably not required
> 
> Thus fix the affected source code place.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/infiniband/hw/mlx4/mad.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/mlx4/mad.c b/drivers/infiniband/hw/mlx4/mad.c
> index 75b6522b3a8f..9518b7244269 100644
> --- a/drivers/infiniband/hw/mlx4/mad.c
> +++ b/drivers/infiniband/hw/mlx4/mad.c
> @@ -1966,10 +1966,8 @@ static int alloc_pv_object(struct mlx4_ib_dev *dev, int slave, int port,
> 
> static void free_pv_object(struct mlx4_ib_dev *dev, int slave, int port)
> {
> -    if (dev->sriov.demux[port - 1].tun[slave]) {
> -        kfree(dev->sriov.demux[port - 1].tun[slave]);
> -        dev->sriov.demux[port - 1].tun[slave] = NULL;
> -    }
> +    kfree(dev->sriov.demux[port - 1].tun[slave]);
> +    dev->sriov.demux[port - 1].tun[slave] = NULL;
> }
In case it was NULL, we will have a redundant assignment here.
I don't think this change is needed..
> 
> static int create_pv_resources(struct ib_device *ibdev, int slave, int port,
> -- 
> 2.11.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
