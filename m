From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 27 Feb 2006 09:43:05 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in drivers/atm
Message-Id: <20060227094305.GA1204@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85202936936415319=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============85202936936415319==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2006-02-27 at 10:22:36 +0100, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> --- linux-2.6.16-rc4/drivers/atm/adummy.c.orig	2006-02-27 09:02:51.000000000 +0100
> +++ linux-2.6.16-rc4/drivers/atm/adummy.c	2006-02-27 09:03:09.000000000 +0100
> @@ -114,14 +114,13 @@ static int __init adummy_init(void)
>  
>  	printk(KERN_ERR "adummy: version %s\n", DRV_VERSION);
>  
> -	adummy_dev = (struct adummy_dev *) kmalloc(sizeof(struct adummy_dev),
> +	adummy_dev = (struct adummy_dev *) kzalloc(sizeof(struct adummy_dev),
>  						   GFP_KERNEL);

Casting kmalloc/kzalloc return values is not necessary.

[...]
> --- linux-2.6.16-rc4/drivers/atm/he.c.orig	2006-02-27 09:03:20.000000000 +0100
> +++ linux-2.6.16-rc4/drivers/atm/he.c	2006-02-27 09:12:51.000000000 +0100
> @@ -384,13 +384,12 @@ he_init_one(struct pci_dev *pci_dev, con
>  	}
>  	pci_set_drvdata(pci_dev, atm_dev);
>  
> -	he_dev = (struct he_dev *) kmalloc(sizeof(struct he_dev),
> +	he_dev = (struct he_dev *) kzalloc(sizeof(struct he_dev),
>  							GFP_KERNEL);

Same here.

[...]
> --- linux-2.6.16-rc4/drivers/atm/idt77252.c.orig	2006-02-27 09:13:10.000000000 +0100
> +++ linux-2.6.16-rc4/drivers/atm/idt77252.c	2006-02-27 09:14:29.000000000 +0100
> @@ -642,10 +642,9 @@ alloc_scq(struct idt77252_dev *card, int
>  {
>  	struct scq_info *scq;
>  
> -	scq = (struct scq_info *) kmalloc(sizeof(struct scq_info), GFP_KERNEL);
> +	scq = (struct scq_info *) kzalloc(sizeof(struct scq_info), GFP_KERNEL);

Ditto

[...]
> --- linux-2.6.16-rc4/drivers/atm/zatm.c.orig	2006-02-27 09:17:47.000000000 +0100
> +++ linux-2.6.16-rc4/drivers/atm/zatm.c	2006-02-27 09:18:24.000000000 +0100
> @@ -604,9 +604,9 @@ static int start_rx(struct atm_dev *dev)
>  DPRINTK("start_rx\n");
>  	zatm_dev = ZATM_DEV(dev);
>  	size = sizeof(struct atm_vcc *)*zatm_dev->chans;
> -	zatm_dev->rx_map = (struct atm_vcc **) kmalloc(size,GFP_KERNEL);
> -	if (!zatm_dev->rx_map) return -ENOMEM;
> -	memset(zatm_dev->rx_map,0,size);
> +	zatm_dev->rx_map = (struct atm_vcc **) kzalloc(size, GFP_KERNEL);

Same here

Cheers, Tobias

--===============85202936936415319==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85202936936415319==--
