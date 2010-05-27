From: Sarveshwar Bandi <sarveshwarb@serverengines.com>
Date: Thu, 27 May 2010 06:43:57 +0000
Subject: Re: [patch 1/2] be2net: add unlock on error path
Message-Id: <20100527063156.GA12380@serverengines.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100526144634.GL22515@bicker>
In-Reply-To: <20100526144634.GL22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Sathya Perla <sathyap@serverengines.com>, Subbu Seetharaman <subbus@serverengines.com>, Ajit Khaparde <ajitk@serverengines.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks

Acked-by: Sarveshwar Bandi <sarveshwarb@serverengines.com> 
On 26/05/10 16:46 +0200, Dan Carpenter wrote:
> The unlock accidentally got removed from the error path in dd131e76e5:
> "be2net: Bug fix to avoid disabling bottom half during firmware upgrade."
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/net/benet/be_cmds.c b/drivers/net/benet/be_cmds.c
> index c911bfb..18d5789 100644
> --- a/drivers/net/benet/be_cmds.c
> +++ b/drivers/net/benet/be_cmds.c
> @@ -1429,7 +1429,7 @@ int be_cmd_write_flashrom(struct be_adapter *adapter, struct be_dma_mem *cmd,
>  	wrb = wrb_from_mccq(adapter);
>  	if (!wrb) {
>  		status = -EBUSY;
> -		goto err;
> +		goto err_unlock;
>  	}
>  	req = cmd->va;
>  	sge = nonembedded_sgl(wrb);
> @@ -1457,7 +1457,10 @@ int be_cmd_write_flashrom(struct be_adapter *adapter, struct be_dma_mem *cmd,
>  	else
>  		status = adapter->flash_status;
>  
> -err:
> +	return status;
> +
> +err_unlock:
> +	spin_unlock_bh(&adapter->mcc_lock);
>  	return status;
>  }
>  
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
