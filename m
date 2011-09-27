From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Tue, 27 Sep 2011 22:17:39 +0000
Subject: Re: [patch] xen: double lock typo
Message-Id: <20110927221739.GC10820@phenom.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110927070721.GA7351@elgon.mountain>
In-Reply-To: <20110927070721.GA7351@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, kernel-janitors@vger.kernel.org, xen-devel@lists.xensource.com, Jan Beulich <jbeulich@suse.com>, virtualization@lists.linux-foundation.org

On Tue, Sep 27, 2011 at 10:07:21AM +0300, Dan Carpenter wrote:
> We called mutex_lock() twice instead of unlocking.

Duh. OK, queued up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/xen/xen-pciback/vpci.c b/drivers/xen/xen-pciback/vpci.c
> index 01222d7..46d140b 100644
> --- a/drivers/xen/xen-pciback/vpci.c
> +++ b/drivers/xen/xen-pciback/vpci.c
> @@ -238,7 +238,7 @@ static int __xen_pcibk_get_pcifront_dev(struct pci_dev *pcidev,
>  			}
>  		}
>  	}
> -	mutex_lock(&vpci_dev->lock);
> +	mutex_unlock(&vpci_dev->lock);
>  	return found;
>  }
>  
