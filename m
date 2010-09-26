From: Denis Kirjanov <dkirjanov@kernel.org>
Date: Sun, 26 Sep 2010 14:35:39 +0000
Subject: Re: [PATCH 8/9] staging: slicoss: use free_netdev(netdev) instead
Message-Id: <4C9F5A3B.3070502@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285495108-22196-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1285495108-22196-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On 09/26/2010 01:58 PM, Vasiliy Kulikov wrote:
> Freeing netdev without free_netdev() leads to net, tx leaks.
> I might lead to dereferencing freed pointer.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> @@
> struct net_device* dev;
> @@
> 
> -kfree(dev)
> +free_netdev(dev)
> ---
>  Compile tested.
> 
>  drivers/staging/slicoss/slicoss.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/slicoss/slicoss.c b/drivers/staging/slicoss/slicoss.c
> index 58ff123..18f1103 100644
> --- a/drivers/staging/slicoss/slicoss.c
> +++ b/drivers/staging/slicoss/slicoss.c
> @@ -3233,7 +3233,7 @@ static void __devexit slic_entry_remove(struct pci_dev *pcidev)
>  		slic_global.num_slic_cards--;
>  		slic_card_cleanup(card);
>  	}
> -	kfree(dev);
> +	free_netdev(dev);
>  	pci_release_regions(pcidev);
>  }
>  
Acked-by: Denis Kirjanov <dkirjanov@kernel.org>

Good catch, thanks!
