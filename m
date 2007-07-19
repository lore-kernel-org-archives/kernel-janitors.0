From: Yoann Padioleau <padator@wanadoo.fr>
Date: Thu, 19 Jul 2007 13:52:57 +0000
Subject: Re: netdev_priv()
Message-Id: <878x9cjy9y.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Thomas Surrel" <thomas.surrel@gmail.com> writes:

>>
>> That's what my new semantic patch does. But maybe I am now too
>> restrictive.
>
> Your patch is indeed missing some needed changes. I had a look in
> drivers/net/wireless only, and it appears that the following drivers
> would need to be worked on as well:
> airo
> arlan
> hostap
> prism54
> ray_cs
> wavelan
> wl3501
>
> and I assume there are much more in the whole drivers/net/.
>
> I'm not sure there is an easy way to do all the changes at once. I'm
> going to make the changes manually in the remaining drivers, but if
> there is a faster method, don't hesitate to stop me.

Yes, I can apply my simpler semantic patch on the file you 
have clearly identified as "safe" to do the transformation. 

The only thing is that I would like also to automate the
identification part where you know when it's safe or not. How do you
know that for instance it's safe to replace the dev->priv by
netpriv(dev) in airo.c ? How do you know the private structure is
allocated behind the struct netdevice ?

in airo.c there is 

static struct net_device *init_wifidev(struct airo_info *ai,
					struct net_device *ethdev)
{
	int err;
	struct net_device *dev = alloc_netdev(0, "wifi%d", wifi_setup);
	if (!dev)
		return NULL;
	dev->priv = ethdev->priv;
	dev->irq = ethdev->irq;
	dev->base_addr = ethdev->base_addr;
	dev->wireless_data = ethdev->wireless_data;
	memcpy(dev->dev_addr, ethdev->dev_addr, dev->addr_len);
	err = register_netdev(dev);
	if (err<0) {
		free_netdev(dev);
		return NULL;
	}
	return dev;
}


So it does not look dev->priv is behind the freshly allocated
alloc_netdev.




>
> Best regards,
>
> Thomas

