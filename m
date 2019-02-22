From: Majd Dibbiny <majd@mellanox.com>
Date: Fri, 22 Feb 2019 09:47:43 +0000
Subject: Re: [PATCH] RDMA/core: Fix a WARN() message
Message-Id: <E339EA11-F0E9-4D52-B7C1-177D21142AFE@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222062902.GB30993@kadam>
In-Reply-To: <20190222062902.GB30993@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> On Feb 22, 2019, at 8:29 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> The first parameter of WARN_ONCE() is a condition, then following
> parameters are the message.  In this case, we left out the condition so
> it will just print the ops->type string.
> 
> Fixes: 3856ec4b93c9 ("RDMA/core: Add RDMA_NLDEV_CMD_NEWLINK/DELLINK support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Majd Dibbiny <majd@mellanox.com>
> ---
> drivers/infiniband/core/nldev.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
> index 5e94dc87f04f..660a192a44a3 100644
> --- a/drivers/infiniband/core/nldev.c
> +++ b/drivers/infiniband/core/nldev.c
> @@ -1223,7 +1223,7 @@ void rdma_link_register(struct rdma_link_ops *ops)
> {
>    down_write(&link_ops_rwsem);
>    if (link_ops_get(ops->type)) {
> -        WARN_ONCE("Duplicate rdma_link_ops! %s\n", ops->type);
> +        WARN_ONCE(1, "Duplicate rdma_link_ops! %s\n", ops->type);
>        goto out;
>    }
>    list_add(&ops->list, &link_ops);
> -- 
> 2.17.1
> 
