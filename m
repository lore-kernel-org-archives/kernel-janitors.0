From: Shannon Nelson <snelson@pensando.io>
Date: Sun, 22 Sep 2019 18:21:24 +0000
Subject: Re: [PATCH net] ionic: Fix an error code in ionic_lif_alloc()
Message-Id: <d878a0d8-7458-0a7d-3bf9-8a8a06e5d6a9@pensando.io>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190921055926.GA18726@mwanda>
In-Reply-To: <20190921055926.GA18726@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pensando Drivers <drivers@pensando.io>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 9/20/19 10:59 PM, Dan Carpenter wrote:
> We need to set the error code on this path.  Otherwise it probably
> results in a NULL dereference down the line.
>
> Fixes: aa3198819bea ("ionic: Add RSS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/net/ethernet/pensando/ionic/ionic_lif.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> index db7c82742828..72107a0627a9 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> @@ -1704,6 +1704,7 @@ static struct ionic_lif *ionic_lif_alloc(struct ionic *ionic, unsigned int index
>   					      GFP_KERNEL);
>   
>   	if (!lif->rss_ind_tbl) {
> +		err = -ENOMEM;
>   		dev_err(dev, "Failed to allocate rss indirection table, aborting\n");
>   		goto err_out_free_qcqs;
>   	}

Thanks, Dan.

Acked-by: Shannon Nelson <snelson@pensando.io>
