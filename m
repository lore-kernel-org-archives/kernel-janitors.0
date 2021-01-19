From: Jakub Kicinski <kuba@kernel.org>
Date: Tue, 19 Jan 2021 04:33:36 +0000
Subject: Re: [PATCH] net/qla3xxx: switch from 'pci_' to 'dma_' API
Message-Id: <20210118203336.6e7170a1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210117081542.560021-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210117081542.560021-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: GR-Linux-NIC-Dev@marvell.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 17 Jan 2021 09:15:42 +0100 Christophe JAILLET wrote:
> @@ -2525,9 +2519,8 @@ static int ql_alloc_net_req_rsp_queues(struct ql3_adapter *qdev)
>  	wmb();
>  
>  	qdev->req_q_virt_addr > -	    pci_alloc_consistent(qdev->pdev,
> -				 (size_t) qdev->req_q_size,
> -				 &qdev->req_q_phy_addr);
> +	    dma_alloc_coherent(&qdev->pdev->dev, (size_t)qdev->req_q_size,
> +			       &qdev->req_q_phy_addr, GFP_KERNEL);
>  
>  	if ((qdev->req_q_virt_addr = NULL) ||
>  	    LS_64BITS(qdev->req_q_phy_addr) & (qdev->req_q_size - 1)) {
> @@ -2536,16 +2529,14 @@ static int ql_alloc_net_req_rsp_queues(struct ql3_adapter *qdev)
>  	}
>  
>  	qdev->rsp_q_virt_addr > -	    pci_alloc_consistent(qdev->pdev,
> -				 (size_t) qdev->rsp_q_size,
> -				 &qdev->rsp_q_phy_addr);
> +	    dma_alloc_coherent(&qdev->pdev->dev, (size_t)qdev->rsp_q_size,
> +			       &qdev->rsp_q_phy_addr, GFP_KERNEL);
>  
>  	if ((qdev->rsp_q_virt_addr = NULL) ||
>  	    LS_64BITS(qdev->rsp_q_phy_addr) & (qdev->rsp_q_size - 1)) {
>  		netdev_err(qdev->ndev, "rspQ allocation failed\n");
> -		pci_free_consistent(qdev->pdev, (size_t) qdev->req_q_size,
> -				    qdev->req_q_virt_addr,
> -				    qdev->req_q_phy_addr);
> +		dma_free_coherent(&qdev->pdev->dev, (size_t)qdev->req_q_size,
> +				  qdev->req_q_virt_addr, qdev->req_q_phy_addr);
>  		return -ENOMEM;
>  	}

Something to follow up on - the error handling in this function looks
pretty sketchy. Looks like if the buffer was allocated but these
alignment conditions trigger the buffer is not freed. Happens both for
req and rsp buffer.

Applied, thanks!
