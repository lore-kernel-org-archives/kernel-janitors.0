From: "Thomas Surrel" <thomas.surrel@gmail.com>
Date: Thu, 19 Jul 2007 14:33:23 +0000
Subject: Re: netdev_priv()
Message-Id: <d858bca40707190733s51e0f250qe9e1f1cb4bc135e7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>
> Yes, I can apply my simpler semantic patch on the file you
> have clearly identified as "safe" to do the transformation.

Your simple semantic patch is not convering all the cases. Some driver
don't make the access with dev->priv, it can be
my_own_private_netdevice->priv. So we would still need to check behind
you patch, which is not far from doing manually, unfortunately ...

>
> The only thing is that I would like also to automate the
> identification part where you know when it's safe or not. How do you
> know that for instance it's safe to replace the dev->priv by
> netpriv(dev) in airo.c ? How do you know the private structure is
> allocated behind the struct netdevice ?
>
> in airo.c there is
>
> static struct net_device *init_wifidev(struct airo_info *ai,
>                                        struct net_device *ethdev)
> {
>        int err;
>        struct net_device *dev = alloc_netdev(0, "wifi%d", wifi_setup);
>        if (!dev)
>                return NULL;
>        dev->priv = ethdev->priv;
>        dev->irq = ethdev->irq;
>        dev->base_addr = ethdev->base_addr;
>        dev->wireless_data = ethdev->wireless_data;
>        memcpy(dev->dev_addr, ethdev->dev_addr, dev->addr_len);
>        err = register_netdev(dev);
>        if (err<0) {
>                free_netdev(dev);
>                return NULL;
>        }
>        return dev;
> }
>
>
> So it does not look dev->priv is behind the freshly allocated
> alloc_netdev.

Indeed, not in that location, but you also have:
static struct net_device *_init_airo_card( unsigned short irq, int port,
					   int is_pcmcia, struct pci_dev *pci,
					   struct device *dmdev )
{
	struct net_device *dev;
	struct airo_info *ai;
	int i, rc;

	/* Create the network device object. */
	dev = alloc_etherdev(sizeof(*ai));
	 if (!dev) {
		airo_print_err("", "Couldn't alloc_etherdev");
		return NULL;
	}
	if (dev_alloc_name(dev, dev->name) < 0) {
		airo_print_err("", "Couldn't get name!");
		goto err_out_free;
	}

	ai = dev->priv;

In that case again, autmating the process is not easy at all.
