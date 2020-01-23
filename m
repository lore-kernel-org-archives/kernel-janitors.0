From: Benjamin Poirier <benjamin.poirier@gmail.com>
Date: Thu, 23 Jan 2020 05:19:31 +0000
Subject: Re: [PATCH] staging: qlge: fix spelling mistake "to" -> "too"
Message-Id: <20200123051931.GA419949@f3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200123000707.2831321-1-colin.king@canonical.com>
In-Reply-To: <20200123000707.2831321-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, GR-Linux-NIC-Dev@marvell.com, Manish Chopra <manishc@marvell.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

On 2020/01/23 00:07 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a netif_printk message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/qlge/qlge_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
> index ef8037d0b52e..115dfa2ffabd 100644
> --- a/drivers/staging/qlge/qlge_main.c
> +++ b/drivers/staging/qlge/qlge_main.c
> @@ -1758,7 +1758,7 @@ static struct sk_buff *ql_build_rx_skb(struct ql_adapter *qdev,
>  	} else if (ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DL) {
>  		if (ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HS) {
>  			netif_printk(qdev, rx_status, KERN_DEBUG, qdev->ndev,
> -				     "Header in small, %d bytes in large. Chain large to small!\n",
> +				     "Header in small, %d bytes in large. Chain large too small!\n",

The "to" is correct here.
~chaining a large buffer to a small buffer~
