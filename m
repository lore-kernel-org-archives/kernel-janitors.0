From: Igor Russkikh <igor.russkikh@aquantia.com>
Date: Tue, 08 May 2018 07:19:14 +0000
Subject: Re: [PATCH] net: aquantia: Fix an error handling path in 'aq_pci_probe()'
Message-Id: <a784ae7f-cd9c-4141-f862-0c01f61d0200@aquantia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180508063947.11317-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180508063947.11317-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, davem@davemloft.net, pavel.belous@aquantia.com, weiyongjun1@huawei.com, dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On 08.05.2018 09:39, Christophe JAILLET wrote:
> The position of 2 labels should be swapped in order to release resources
> in the correct order and avoid leaks.
> 

>  	kfree(self->aq_hw);
>  err_ioremap:
>  	free_netdev(ndev);
> -err_pci_func:
> -	pci_release_regions(pdev);
>  err_ndev:
> +	pci_release_regions(pdev);
> +err_pci_func:
>  	pci_disable_device(pdev);
>  	return err;
>  }
> 

This was just submitted yesterday and is already accepted in netdev by David:

http://patchwork.ozlabs.org/patch/909746/

Thanks!

BR, Igor
