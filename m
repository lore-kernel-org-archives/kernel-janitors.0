From: David Daney <ddaney@caviumnetworks.com>
Date: Tue, 28 Sep 2010 17:13:07 +0000
Subject: Re: [PATCH 6/9] staging: octeon: use free_netdev(netdev) instead
Message-Id: <4CA22223.3030701@caviumnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285693681-4679-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1285693681-4679-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, "David S. Miller" <davem@davemloft.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On 09/28/2010 10:08 AM, Vasiliy Kulikov wrote:
> It is not guaranteed that free_netdev() is macro.
> Freeing netdev without free_netdev() leads to net, tx leaks.
> I might lead to dereferencing freed pointer.
>
>
> Signed-off-by: Vasiliy Kulikov<segooon@gmail.com>

Thanks, you can add:

Acked-by: David Daney <ddaney@caviumnetworks.com>


> ---
>   drivers/staging/octeon/ethernet.c |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index fb568a9..a8f780e 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -670,7 +670,7 @@ static int __init cvm_oct_init_module(void)
>
>   			if (register_netdev(dev)<  0) {
>   				pr_err("Failed to register ethernet device for POW\n");
> -				kfree(dev);
> +				free_netdev(dev);
>   			} else {
>   				cvm_oct_device[CVMX_PIP_NUM_INPUT_PORTS] = dev;
>   				pr_info("%s: POW send group %d, receive group %d\n",
> @@ -756,12 +756,12 @@ static int __init cvm_oct_init_module(void)
>   			}
>
>   			if (!dev->netdev_ops) {
> -				kfree(dev);
> +				free_netdev(dev);
>   			} else if (register_netdev(dev)<  0) {
>   				pr_err("Failed to register ethernet device "
>   					 "for interface %d, port %d\n",
>   					 interface, priv->port);
> -				kfree(dev);
> +				free_netdev(dev);
>   			} else {
>   				cvm_oct_device[priv->port] = dev;
>   				fau -> @@ -815,7 +815,7 @@ static void __exit cvm_oct_cleanup_module(void)
>
>   			cvm_oct_tx_shutdown_dev(dev);
>   			unregister_netdev(dev);
> -			kfree(dev);
> +			free_netdev(dev);
>   			cvm_oct_device[port] = NULL;
>   		}
>   	}

