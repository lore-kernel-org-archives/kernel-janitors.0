From: Aviad Krawczyk <aviad.krawczyk@huawei.com>
Date: Thu, 24 Aug 2017 12:24:55 +0000
Subject: Re: [PATCH net-next] hinic: uninitialized variable in hinic_api_cmd_init()
Message-Id: <63dafb26-dd90-bf64-bd41-48a844cdf924@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170824104739.gw422ufydwmiu4gi@mwanda>
In-Reply-To: <20170824104739.gw422ufydwmiu4gi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/24/2017 1:47 PM, Dan Carpenter wrote:
> We never set the error code in this function.
> 
> Fixes: eabf0fad81d5 ("net-next/hinic: Initialize api cmd resources")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/ethernet/huawei/hinic/hinic_hw_api_cmd.c b/drivers/net/ethernet/huawei/hinic/hinic_hw_api_cmd.c
> index 8901801fe426..c40603a183df 100644
> --- a/drivers/net/ethernet/huawei/hinic/hinic_hw_api_cmd.c
> +++ b/drivers/net/ethernet/huawei/hinic/hinic_hw_api_cmd.c
> @@ -941,6 +941,7 @@ int hinic_api_cmd_init(struct hinic_api_cmd_chain **chain,
>  		if (IS_ERR(chain[chain_type])) {
>  			dev_err(&pdev->dev, "Failed to create chain %d\n",
>  				chain_type);
> +			err = PTR_ERR(chain[chain_type]);
>  			goto err_create_chain;
>  		}
>  	}
> 
> 

Thanks a lot, Reviewed-by: Aviad Krawczyk <aviad.krawczyk@huawei.com>

