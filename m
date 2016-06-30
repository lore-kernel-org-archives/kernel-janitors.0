From: Sathya Perla <sathya.perla@broadcom.com>
Date: Thu, 30 Jun 2016 11:34:56 +0000
Subject: RE: [patch] be2net: signedness bug in be_msix_enable()
Message-Id: <5e01e26fa672cf9686fdbc8d4448ffd2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160629143943.GA22818@mwanda>
In-Reply-To: <20160629143943.GA22818@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ajit Kumar Khaparde <ajit.khaparde@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
>
> "num_vec" needs to be signed for the error handling to work.
>
> Fixes: e261768e9e39 ('be2net: support asymmetric rx/tx queue counts')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/ethernet/emulex/benet/be_main.c
b/drivers/net/ethernet/emulex/benet/be_main.c
> index 1873c74..1f16e73 100644
> --- a/drivers/net/ethernet/emulex/benet/be_main.c
> +++ b/drivers/net/ethernet/emulex/benet/be_main.c
> @@ -3251,8 +3251,9 @@ static void be_msix_disable(struct be_adapter
*adapter)
>
>  static int be_msix_enable(struct be_adapter *adapter)  {
> -	unsigned int i, num_vec, max_roce_eqs;
> +	unsigned int i, max_roce_eqs;
>  	struct device *dev = &adapter->pdev->dev;
> +	int num_vec;
>

Oops...thanks for catching this! This must go into net-next.

Acked-by: Sathya Perla <sathya.perla@broadcom.com>
