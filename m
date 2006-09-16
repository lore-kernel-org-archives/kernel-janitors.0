From: Frederik Deweerdt <deweerdt@free.fr>
Date: Sat, 16 Sep 2006 09:14:30 +0000
Subject: Re: [KJ] [PATCH] olympic.c: Checks for return values
Message-Id: <20060916111022.GI2876@slug>
List-Id: <kernel-janitors.vger.kernel.org>
References: <450BB893.6030001@batelco.com.bh>
In-Reply-To: <450BB893.6030001@batelco.com.bh>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 16, 2006 at 11:40:51AM +0300, Hashem Masoud wrote:
> Hello all,
Hi Hashem,
> 
> As per the TODO list on your website, register_netdev() should be 
> audited for its return values.
> The following could be an instance of wrong handling of return code.
> 
> I didn't compile this as I don't have the proper setup. Added to that, I 
> am not sure if
> the goto is the proper action. Please correct the patch if it is wrong, 
> it is my first patch!
> 
If you goto 'op_free_dev', you'll leave the mem io mapped (see
'op_free_iomap').
Regards,
Frederik
> 
> Signed-off-by: Hashem Masoud < <https://lists.osdl.org/mailman/listinfo/kernel-janitors> masoudh at batelco.com.bh>
> ---
> --- linux-2.6.17.13/drivers/net/tokenring/olympic.c     2006-09-09 06:23:24.000000000 +0300
> +++ olympic.c   2006-09-15 22:11:09.099112040 +0300
> @@ -265,7 +265,10 @@ static int __devinit olympic_probe(struc
>         SET_NETDEV_DEV(dev, &pdev->dev);
> 
>         pci_set_drvdata(pdev,dev) ;
> -       register_netdev(dev) ;
> +
> +       if (register_netdev(dev) != 0)
> +           goto op_free_dev;
> +
>         printk("Olympic: %s registered as: %s\n",olympic_priv->olympic_card_name,dev->name);
>         if (olympic_priv->olympic_network_monitor) { /* Must go after register_netdev as we need the device name */
>                 char proc_name[20] ;
> 
> 
> -- 
> Hashem Masoud
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
