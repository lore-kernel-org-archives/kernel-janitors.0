From: Shannon Nelson <snelson@pensando.io>
Date: Wed, 22 Jul 2020 21:18:46 +0000
Subject: Re: [PATCH][next] ionic: fix memory leak of object 'lid'
Message-Id: <e0e428cf-3bef-9b57-2a7f-5a2381587085@pensando.io>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200722174003.962374-1-colin.king@canonical.com>
In-Reply-To: <20200722174003.962374-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Pensando Drivers <drivers@pensando.io>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 7/22/20 10:40 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when netdev fails to allocate the error return path
> fails to free the allocated object 'lid'.  Fix this by setting
> err to the return error code and jumping to a new label that
> performs the kfree of lid before returning.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 4b03b27349c0 ("ionic: get MTU from lif identity")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/net/ethernet/pensando/ionic/ionic_lif.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> index 7ad338a4653c..728dd6429d80 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> @@ -2034,7 +2034,8 @@ static struct ionic_lif *ionic_lif_alloc(struct ionic *ionic, unsigned int index
>   				    ionic->ntxqs_per_lif, ionic->ntxqs_per_lif);
>   	if (!netdev) {
>   		dev_err(dev, "Cannot allocate netdev, aborting\n");
> -		return ERR_PTR(-ENOMEM);
> +		err = -ENOMEM;
> +		goto err_out_free_lid;
>   	}
>   
>   	SET_NETDEV_DEV(netdev, dev);
> @@ -2120,6 +2121,7 @@ static struct ionic_lif *ionic_lif_alloc(struct ionic *ionic, unsigned int index
>   err_out_free_netdev:
>   	free_netdev(lif->netdev);
>   	lif = NULL;
> +err_out_free_lid:
>   	kfree(lid);
>   
>   	return ERR_PTR(err);

Thanks!

Acked-by: Shannon Nelson <snelson@pensando.io>
