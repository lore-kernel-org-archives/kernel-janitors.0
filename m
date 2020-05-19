From: Danil Kipnis <danil.kipnis@cloud.ionos.com>
Date: Tue, 19 May 2020 09:36:21 +0000
Subject: Re: [PATCH -next] RDMA/rtrs: server: fix some error return code
Message-Id: <CAHg0HuzqtZXzwXG4zBE5=kXomUunMP5y8ytZRsNKh1_XYdEdNw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200519091912.134358-1-weiyongjun1@huawei.com>
In-Reply-To: <20200519091912.134358-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Tue, May 19, 2020 at 11:16 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix to return negative error code -ENOMEM from the some error handling
> cases instead of 0, as done elsewhere in this function.
>
> Fixes: 9cb837480424 ("RDMA/rtrs: server: main functionality")
> Fixes: 91b11610af8d ("RDMA/rtrs: server: sysfs interface functions")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 8 +++++---
>  drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c | 1 +
>  2 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> index ba8ab33b94a2..526433580b96 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
> @@ -660,8 +660,8 @@ static int map_cont_bufs(struct rtrs_srv_sess *sess)
>                                         GFP_KERNEL, sess->s.dev->ib_dev,
>                                         DMA_TO_DEVICE, rtrs_srv_rdma_done);
>                         if (!srv_mr->iu) {
> -                               rtrs_err(ss, "rtrs_iu_alloc(), err: %d\n",
> -                                         -ENOMEM);
> +                               err = -ENOMEM;
> +                               rtrs_err(ss, "rtrs_iu_alloc(), err: %d\n", err);
>                                 goto free_iu;
>                         }
>                 }
> @@ -2150,8 +2150,10 @@ static int __init rtrs_server_init(void)
>                 goto out_chunk_pool;
>         }
>         rtrs_wq = alloc_workqueue("rtrs_server_wq", WQ_MEM_RECLAIM, 0);
> -       if (!rtrs_wq)
> +       if (!rtrs_wq) {
> +               err = -ENOMEM;
>                 goto out_dev_class;
> +       }
>
>         return 0;
>
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c b/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
> index 0cf015634338..3d7877534bcc 100644
> --- a/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
> @@ -189,6 +189,7 @@ static int rtrs_srv_create_once_sysfs_root_folders(struct rtrs_srv_sess *sess)
>         }
>         srv->kobj_paths = kobject_create_and_add("paths", &srv->dev.kobj);
>         if (!srv->kobj_paths) {
> +               err = -ENOMEM;
>                 pr_err("kobject_create_and_add(): %d\n", err);
>                 device_unregister(&srv->dev);
>                 goto unlock;
>

Thanks a lot Wei!
Reviewed-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
