From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Sat, 25 Feb 2006 12:13:21 +0000
Subject: Re: [KJ] bonding/bond_main.c: check return value of
Message-Id: <9a8748490602250413r1837b323jd67c936d624177b0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43E20B2F.8050109@bfs.de>
In-Reply-To: <43E20B2F.8050109@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/25/06, walter harms <wharms@bfs.de> wrote:
> hi list,
> my next improved patch. please note
> * struct net_device *bond_dev=NULL; to prevend gcc from complaining
> * max_bonds is atleast 1 so i should be initialised always
> * better error handling (freeing ALL resources in case of error now)
> * KERN_ERR instead of KERN_WARNING
>
> The driver does no unregister_netdevice() i did not understand why so i
> left it in this state. The two labels are not a mistake they simply
> illustrate that this is an error exit for two different errors.
>
> alexey, if you realy do not like it, simple remove them.
>
> re,
>   walter
>
>
> Signed-off-by: walter harms <wharms@bfs.de>
>
> --- linux-2.6.15.4/drivers/net/bonding/bond_main.c.bak  2006-02-10
> 08:22:48.000000000 +0100
> +++ linux-2.6.15.4/drivers/net/bonding/bond_main.c      2006-02-25
> 12:36:25.000000000 +0100
> @@ -4884,6 +4884,7 @@
>   static int __init bonding_init(void)
>   {
>         struct bond_params params;
> +       struct net_device *bond_dev=NULL;

Please observe the kernel coding style, there should be spaces around
the '=' here:

       struct net_device *bond_dev = NULL;


>         int i;
>         int res;
>
> @@ -4901,7 +4902,7 @@
>   #endif
>
>         for (i = 0; i < max_bonds; i++) {
> -               struct net_device *bond_dev;
> +
>

I can see the point in moving the declaration, but why insert a blank
line?  if anything I'd say you should be removing the blank line
that's already there, like so :

 -               struct net_device *bond_dev;
 -


>                 bond_dev = alloc_netdev(sizeof(struct bonding), "", ether_setup);
>                 if (!bond_dev) {
> @@ -4929,18 +4930,29 @@
>
>                 res = register_netdevice(bond_dev);
>                 if (res < 0) {
> -                       bond_deinit(bond_dev);
> -                       free_netdev(bond_dev);
> -                       goto out_err;
> +                       goto out_no_netdevice;
>                 }
>         }
>
>         rtnl_unlock();
> -       register_netdevice_notifier(&bond_netdev_notifier);
> +       res = register_netdevice_notifier(&bond_netdev_notifier);
> +       if (res < 0) {
> +               printk( KERN_ERR DRV_NAME" register_netdevice_notifier failed\n");
> +
> +               goto out_no_nd_notifier;
> +       }
> +
> +
>         register_inetaddr_notifier(&bond_inetaddr_notifier);
>
>         return 0;
>
> +out_no_nd_notifier:
> +
> +out_no_netdevice:

personally I'd just collapse the two labels into a single label.


> +       bond_deinit(bond_dev);
> +       free_netdev(bond_dev);
> +
>   out_err:
>         /*
>          * rtnl_unlock() will run netdev_run_todo(), putting the


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
