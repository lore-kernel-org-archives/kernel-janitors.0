From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 16 Sep 2006 15:46:40 +0000
Subject: Re: [KJ] [PATCH] olympic.c: Checks for return values
Message-Id: <20060916154640.GA5286@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <450BB893.6030001@batelco.com.bh>
In-Reply-To: <450BB893.6030001@batelco.com.bh>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 16, 2006 at 05:18:47PM +0300, Hashem Masoud wrote:
> --- /linux-2.6.17.13/drivers/net/tokenring/olympic.c
> +++ olympic.c
> @@ -265,7 +265,10 @@ static int __devinit olympic_probe(struc
>         SET_NETDEV_DEV(dev, &pdev->dev);
>
>         pci_set_drvdata(pdev,dev) ;
> -       register_netdev(dev) ;
> +
> +       if (register_netdev(dev) != 0)
> +               goto op_free_iomap ;
> +
>         printk("Olympic: %s registered as:
> %s\n",olympic_priv->olympic_card_name,dev->name);
>         if (olympic_priv->olympic_network_monitor) { /* Must go after
> register_netdev as we need the device name */
>                 char proc_name[20] ;

That's almost it. However if you follow goto you'll notice that zero
will be returned which is not a proper indication of error.

Ergo, I need you to propagate error from register_netdev(),
read http://mbligh.org/linuxdocs/Email/Clients/Thunderbird , then send
proper inline patch with proper Signed-off-by line (without "at", normal
email). Also, you need to buy Thunderbird voodoo doll.


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
