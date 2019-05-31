From: Wei Liu <wei.liu2@citrix.com>
Date: Fri, 31 May 2019 07:20:05 +0000
Subject: Re: [PATCH] xen-netback: remove redundant assignment to err
Message-Id: <20190531072005.GC25537@zion.uk.xensource.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530190438.9571-1-colin.king@canonical.com>
In-Reply-To: <20190530190438.9571-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, "David S . Miller" <davem@davemloft.net>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 30, 2019 at 08:04:38PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is assigned with the value -ENOMEM that is never
> read and it is re-assigned a new value later on.  The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Wei Liu <wei.liu2@citrix.com>


> ---
>  drivers/net/xen-netback/interface.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
> index 783198844dd7..240f762b3749 100644
> --- a/drivers/net/xen-netback/interface.c
> +++ b/drivers/net/xen-netback/interface.c
> @@ -633,7 +633,7 @@ int xenvif_connect_data(struct xenvif_queue *queue,
>  			unsigned int rx_evtchn)
>  {
>  	struct task_struct *task;
> -	int err = -ENOMEM;
> +	int err;
>  
>  	BUG_ON(queue->tx_irq);
>  	BUG_ON(queue->task);
> -- 
> 2.20.1
> 
