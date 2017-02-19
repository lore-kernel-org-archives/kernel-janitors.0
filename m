From: Majd Dibbiny <majd@mellanox.com>
Date: Sun, 19 Feb 2017 17:12:00 +0000
Subject: Re: [PATCH 09/29] IB/mlx4: Move an assignment out of a check in forward_trap()
Message-Id: <08075D57-03AA-4768-8843-B4D745E1F567@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>,<ac39ba0d-8738-2532-9eec-a82c76fc9ff4@users.sourceforge.net>
In-Reply-To: <ac39ba0d-8738-2532-9eec-a82c76fc9ff4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Leon Romanovsky <leonro@mellanox.com>, Matan Barak <matanb@mellanox.com>, Sean Hefty <sean.hefty@intel.com>, Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


> On Feb 18, 2017, at 10:58 PM, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 17 Feb 2017 22:22:53 +0100
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> ERROR: do not use assignment in if condition
> 
> Thus fix the affected source code place.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> drivers/infiniband/hw/mlx4/mad.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/mlx4/mad.c b/drivers/infiniband/hw/mlx4/mad.c
> index 9518b7244269..860fec8b9601 100644
> --- a/drivers/infiniband/hw/mlx4/mad.c
> +++ b/drivers/infiniband/hw/mlx4/mad.c
> @@ -401,7 +401,8 @@ static void forward_trap(struct mlx4_ib_dev *dev, u8 port_num, const struct ib_m
>         */
>        spin_lock_irqsave(&dev->sm_lock, flags);
>        memcpy(send_buf->mad, mad, sizeof *mad);
> -        if ((send_buf->ah = dev->sm_ah[port_num - 1]))
> +        send_buf->ah = dev->sm_ah[port_num - 1];
> +        if (send_buf->ah)
>            ret = ib_post_send_mad(send_buf, NULL);
>        else
>            ret = -EINVAL;
> -- 
> 2.11.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Thanks,
Reviewed-by: Majd Dibbiny
<majd@mellanox.com>