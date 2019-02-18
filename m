From: Raju Rangoju <rajur@chelsio.com>
Date: Mon, 18 Feb 2019 11:24:05 +0000
Subject: Re: [PATCH -next] iw_cxgb4: make function read_tcb() static
Message-Id: <20190218111204.GA1204@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218070432.167400-1-weiyongjun1@huawei.com>
In-Reply-To: <20190218070432.167400-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday, February 02/18/19, 2019 at 07:04:32 +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/infiniband/hw/cxgb4/cm.c:658:6: warning:
>  symbol 'read_tcb' was not declared. Should it be static?
> 
> Fixes: 11a27e2121a5 ("iw_cxgb4: complete the cached SRQ buffers")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/infiniband/hw/cxgb4/cm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
> index ae90b2932bd2..4d232bdf9e97 100644
> --- a/drivers/infiniband/hw/cxgb4/cm.c
> +++ b/drivers/infiniband/hw/cxgb4/cm.c
> @@ -655,7 +655,7 @@ static int send_halfclose(struct c4iw_ep *ep)
>  	return c4iw_l2t_send(&ep->com.dev->rdev, skb, ep->l2t);
>  }
>  
> -void read_tcb(struct c4iw_ep *ep)
> +static void read_tcb(struct c4iw_ep *ep)
>  {
>  	struct sk_buff *skb;
>  	struct cpl_get_tcb *req;
> 
>
Acked-by: Raju Rangoju <rajur@chelsio.com>
> 
