From: Domen Puncer <domen@coderock.org>
Date: Wed, 15 Dec 2004 16:13:24 +0000
Subject: [KJ] Re: linux-2.6.9: add errorcheck for  netlink
Message-Id: <20041215161324.GB5321@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18474038338148602=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18474038338148602==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/11/04 17:30 +0100, walter harms wrote:
> Hi list,
> i moved the netlink patches from 2.6.7 to 2.6.9.
> it adds 2 error checks.
> 1. register_netdevice_notifier()
> 2. sock_register()
> 
> To propagate the error i changed the type from void to int.
> 
> re,
> walter
> 
> 
> Signed-off-by: walter harms <wharms@bfs.de>
> 
> --- linux-2.6.9/net/core/rtnetlink.c.bak	2004-11-26
> 22:11:15.000000000 +0100

Fix mailer not to wrap lines.

> +++ linux-2.6.9/net/core/rtnetlink.c	2004-11-26 23:22:00.000000000 +0100
> @@ -653,7 +653,7 @@
>  	.notifier_call	= rtnetlink_event,
>  };
> 
> -void __init rtnetlink_init(void)
> +int __init rtnetlink_init(void)
>  {
>  	int i;
> 
> @@ -661,17 +661,34 @@
>  	for (i = 0; i < ARRAY_SIZE(rta_max); i++)
>  		if (rta_max[i] > rtattr_max)
>  			rtattr_max = rta_max[i];
> +
>  	rta_buf = kmalloc(rtattr_max * sizeof(struct rtattr *), GFP_KERNEL);
> -	if (!rta_buf)
> -		panic("rtnetlink_init: cannot allocate rta_buf\n");
> +	if (!rta_buf) {
> +		printk(KERN_CRIT "%s: cannot allocate 
> rta_buf\n",__FUNCTION__);
> +		goto no_mem;
> +	}
> 
>  	rtnl = netlink_kernel_create(NETLINK_ROUTE, rtnetlink_rcv);
> -	if (rtnl == NULL)
> -		panic("rtnetlink_init: cannot initialize rtnetlink\n");
> +	if (rtnl == NULL) {
> +		printk(KERN_CRIT "%s: cannot initialize 
> rtnetlink\n",__FUNCTION__);
> +		goto no_netlink;
> +	}
>  	netlink_set_nonroot(NETLINK_ROUTE, NL_NONROOT_RECV);
> -	register_netdevice_notifier(&rtnetlink_dev_notifier);
> +
> +        if ( register_netdevice_notifier(&rtnetlink_dev_notifier) < 0 ) {

Whitespace damage.

> +
> +                printk(KERN_ERR "%s: cannot initialize rtnetlink 
> notifier\n",__FUNCTION__);
> +		goto no_netlink;
> +        }
> +
>  	rtnetlink_links[PF_UNSPEC] = link_rtnetlink_table;
>  	rtnetlink_links[PF_PACKET] = link_rtnetlink_table;
> +	return 0;
> +
> +no_netlink:
> +	kfree(rtnl);
> +no_mem:
> +	return -1;

How about -ENOMEM or similar?
Also: nl_table isn't freed.

>  }
> 
>  EXPORT_SYMBOL(__rta_fill);
> --- linux-2.6.9/include/linux/rtnetlink.h.bak	2004-11-26 
> 22:59:02.000000000 +0100
> +++ linux-2.6.9/include/linux/rtnetlink.h	2004-11-26 
> 23:00:09.986720520 +0100
> @@ -805,7 +805,7 @@
> 
>  extern void rtnl_lock(void);
>  extern void rtnl_unlock(void);
> -extern void rtnetlink_init(void);
> +extern int rtnetlink_init(void);
> 
>  #define ASSERT_RTNL() do { \
>  	if (unlikely(down_trylock(&rtnl_sem) == 0)) { \
> --- linux-2.6.9/net/netlink/af_netlink.c.bak	2004-11-26 
> 22:24:29.000000000 +0100
> +++ linux-2.6.9/net/netlink/af_netlink.c	2004-11-26 
> 22:44:22.000000000 +0100
> @@ -1209,29 +1209,51 @@
>  	.owner	= THIS_MODULE,	/* for consistency 8) */
>  };
> 
> -static int __init netlink_proto_init(void)
> -{
> -	struct sk_buff *dummy_skb;
> 
> -	if (sizeof(struct netlink_skb_parms) > sizeof(dummy_skb->cb)) {
> -		printk(KERN_CRIT "netlink_init: panic\n");
> -		return -1;
> -	}
> -	sock_register(&netlink_family_ops);

Moving functions instead of predeclaring?
It makes reviewing harder.

> +static void __exit netlink_proto_exit(void)
> +{
> +       sock_unregister(PF_NETLINK);
>  #ifdef CONFIG_PROC_FS
> -	proc_net_fops_create("netlink", 0, &netlink_seq_fops);
> +       proc_net_remove("netlink");
>  #endif
> -	/* The netlink device handler may be needed early. */
> -	rtnetlink_init();
> -	return 0;
>  }
> 
> -static void __exit netlink_proto_exit(void)
> +static int __init netlink_proto_init(void)
>  {
> -       sock_unregister(PF_NETLINK);
> -       proc_net_remove("netlink");
> +        struct sk_buff *dummy_skb;
> +#ifdef CONFIG_PROC_FS
> +        struct proc_dir_entry *proc;
> +#endif
> +        int err;
> +
> +        if (sizeof(struct netlink_skb_parms) > sizeof(dummy_skb->cb)) {
> +                printk(KERN_CRIT "netlink_init: panic\n");
> +                return -1;
> +        }
> +        err = sock_register(&netlink_family_ops);
> +        if (err < 0)
> +                return err;
> +
> +#ifdef CONFIG_PROC_FS
> +        proc = proc_net_fops_create("netlink", 0, &netlink_seq_fops);
> +        if (!proc) {
> +                sock_unregister(PF_NETLINK);
> +                return -ENOMEM;
> +        }
> +#endif
> +
> +        /* The netlink device handler may be needed early. */
> +        if ( rtnetlink_init() < 0) {
> +                netlink_proto_exit();

You can't call __exit function from non-__exit.
(If this is linked in kernel __exit stuff gets discarded)

> +                return -1;
> +        } ;
> +
> +        return 0;
>  }
> 
> +
> +
> +

?

>  core_initcall(netlink_proto_init);
>  module_exit(netlink_proto_exit);
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============18474038338148602==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18474038338148602==--
