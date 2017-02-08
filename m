From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Wed, 08 Feb 2017 13:02:41 +0000
Subject: Re: [PATCH] tpm xen: drop unneeded chip variable
Message-Id: <20170208130241.lj7gixi7vhbkfqih@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1486330777-11341-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1486330777-11341-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Peter Huewe <peterhuewe@gmx.de>, kernel-janitors@vger.kernel.org, Marcel Selhorst <tpmdd@selhorst.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, tpmdd-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Sun, Feb 05, 2017 at 10:39:37PM +0100, Julia Lawall wrote:
> The call that used chip was dropped in 1f0f30e404b3.  Drop the
> leftover declaration and initialization.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko

> 
> ---
>  drivers/char/tpm/xen-tpmfront.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
> index 5aaa268..656e8af 100644
> --- a/drivers/char/tpm/xen-tpmfront.c
> +++ b/drivers/char/tpm/xen-tpmfront.c
> @@ -289,7 +289,6 @@ static int tpmfront_probe(struct xenbus_device *dev,
>  		const struct xenbus_device_id *id)
>  {
>  	struct tpm_private *priv;
> -	struct tpm_chip *chip;
>  	int rv;
>  
>  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> @@ -306,7 +305,6 @@ static int tpmfront_probe(struct xenbus_device *dev,
>  
>  	rv = setup_ring(dev, priv);
>  	if (rv) {
> -		chip = dev_get_drvdata(&dev->dev);
>  		ring_free(priv);
>  		return rv;
>  	}
> 
