From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 07 Jul 2005 22:24:23 +0000
Subject: Re: [KJ] [patch 2.6.13-rc1 03/23] Audit return code of create_proc_*
Message-Id: <200507080224.23895.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707154524.160751000@rhum.iomeda.fr>
In-Reply-To: <20050707154524.160751000@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 07 July 2005 19:44, Christophe Lucas wrote:

Subject: [KJ] [patch 2.6.13-rc1 03/23] Audit return code of create_proc_*
	[patch 2.6.13-rc1 @num@/@total@] Audit return code of create_proc_*

Screwed script?

> --- 2.6.13-rc1.orig/drivers/net/tokenring/olympic.c
> +++ 2.6.13-rc1/drivers/net/tokenring/olympic.c
> @@ -265,13 +265,16 @@ static int __devinit olympic_probe(struc

> -	printk("Olympic: %s registered as: %s\n",olympic_priv->olympic_card_name,dev->name);
> +	printk(KERN_INFO "Olympic: %s registered as: %s\n",olympic_priv->olympic_card_name,dev->name);
>  	if (olympic_priv->olympic_network_monitor) { /* Must go after register_netdev as we need the device name */ 
> +		struct proc_dir_entry* ent;

	struct proc_dir_entry *ent;

> -		create_proc_read_entry(proc_name,0,NULL,olympic_proc_info,(void *)dev) ; 
> -		printk("Olympic: Network Monitor information: /proc/%s\n",proc_name); 
> +		ent = create_proc_read_entry(proc_name,0,NULL,olympic_proc_info,(void *)dev) ;
> +		if (!ent)
> +			printk(KERN_WARNING "Olympic: Unable to create /proc entry.\n");
> +		printk(KERN_INFO "Olympic: Network Monitor information: /proc/%s\n",proc_name); 

If it wasn't created, what's the point?

> -	printk("%s \n", version);
> -	printk("%s. I/O at %hx, MMIO at %p, LAP at %p, using irq %d\n", olympic_priv->olympic_card_name, (unsigned int) dev->base_addr,olympic_priv->olympic_mmio, olympic_priv->olympic_lap, dev->irq);
> +	printk(KERN_INFO "%s \n", version);
> +	printk(KERN_INFO "%s. I/O at %hx, MMIO at %p, LAP at %p, using irq %d\n",
> +		olympic_priv->olympic_card_name, (unsigned int) dev->base_addr,
> +		olympic_priv->olympic_mmio, olympic_priv->olympic_lap, dev->irq);

Don't mix unrelated changes.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
