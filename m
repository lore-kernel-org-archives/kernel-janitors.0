From: Dan Carpenter <error27@gmail.com>
Date: Mon, 09 Aug 2010 11:32:54 +0000
Subject: Re: [patch 1/2] qlcnic: clean up qlcnic_init_pci_info()
Message-Id: <20100809113254.GI9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100809103542.GG9031@bicker>
In-Reply-To: <20100809103542.GG9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amit Kumar Salecha <amit.salecha@qlogic.com>
Cc: Anirban Chakraborty <anirban.chakraborty@qlogic.com>, linux-driver@qlogic.com, "David S. Miller" <davem@davemloft.net>, Sucheta Chakraborty <sucheta.chakraborty@qlogic.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 09, 2010 at 12:36:05PM +0200, Dan Carpenter wrote:
> +err_eswitch:
>  	kfree(adapter->eswitch);
>  	adapter->eswitch = NULL;
> -err_eswitch:
> +err_npars:
>  	kfree(adapter->npars);
> +	adapter->eswitch = NULL;
	^^^^^^^^^^^^^^^^^^^^^^^^

Oops.  Typo.  Will send a corrected fix.  Sorry.

regards,
dan carpenter

>  
>  	return ret;
>  }
