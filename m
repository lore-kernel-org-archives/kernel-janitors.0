From: Domen Puncer <domen@coderock.org>
Date: Sun, 01 Aug 2004 22:12:31 +0000
Subject: [Kernel-janitors] Re: linux2.6.7: af_ax25.c init cleanup
Message-Id: <20040801221231.GA2276@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16466556229960427=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16466556229960427==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/08/04 21:39 +0200, Walter Harms wrote:
> Hi list,
> i was looking for propper init sequences when in
> noticed that some error conditions are not catched.
> 
> I had to rely on C&P so its possible that
> tabs become space.
Yes, all tabs became spaces.
If your mailer can't insert a file then you should probably change it.

> 
> walter
> 
> Signed-off-by: walter (wharms@bfs.de)
> 
> --- linux-2.6.7/net/ax25/af_ax25.c.bak  2004-07-31 17:24:20.000000000 +0200
> +++ linux-2.6.7/net/ax25/af_ax25.c      2004-08-01 11:13:55.174924520 +0200
> @@ -1994,37 +1994,82 @@
>  EXPORT_SYMBOL(null_ax25_address);
>  EXPORT_SYMBOL(ax25_display_timer);
>  
> +#ifdef CONFIG_PROC_FS
> +static int ax25_init_proc(void) {
Could be __init

> +       int err;
> +       err=proc_net_fops_create("ax25_route", S_IRUGO, &ax25_route_fops);
Spaces before and after '='
> +       if (err < 0)
> +               goto exit_ax25_route;
> +       err=proc_net_fops_create("ax25", S_IRUGO, &ax25_info_fops);
> +       if (err < 0)
> +               goto exit_ax25;
> +       err=proc_net_fops_create("ax25_calls", S_IRUGO, &ax25_uid_fops);
> +       if (err < 0)
> +               goto exit_ax25_calls;
> +       return 0;
> +exit_ax25_calls:
> +       proc_net_remove("ax25_calls");
> +exit_ax25:
> +       proc_net_remove("ax25");
> +exit_ax25_route:
> +       proc_net_remove("ax25_route");
> +
> +       return -1;
> +}
> +#else
> +static int ax25_init_proc(void) {
inline or a macro would be better imo
> +       return 0;
> +}
> +#endif
> +
> +
>  static int __init ax25_init(void)
>  {
> -       sock_register(&ax25_family_ops);
> +       int err;
> +       err=sock_register(&ax25_family_ops);
> +       if (err < 0) 
> +               goto exit_1;
> +
>         dev_add_pack(&ax25_packet_type);
> -       register_netdevice_notifier(&ax25_dev_notifier);
> +       err=register_netdevice_notifier(&ax25_dev_notifier);
> +       if (err < 0) 
> +               goto exit_free_sock ;
Space before ;
> +
> +#ifdef CONFIG_SYSCTL
>         ax25_register_sysctl();
> +#endif
No need for ifdef, see ax25.h
> +
> +
> +       err=ax25_init_proc();
> +       if (err < 0) 
> +               printk(KERN_WARNING "%s: unable to init proc interface\n",__FUNCTION__);
Too long line
2 empty lines follow
>  
> -       proc_net_fops_create("ax25_route", S_IRUGO, &ax25_route_fops);
> -       proc_net_fops_create("ax25", S_IRUGO, &ax25_info_fops);
> -       proc_net_fops_create("ax25_calls", S_IRUGO, &ax25_uid_fops);
>  
>         return 0;
> +exit_free_sock:
> +       dev_remove_pack(&ax25_packet_type);
> +       sock_unregister(AF_X25);
> +exit_1:
> +       return -1;
This should probably be replaced with apropriate -ERROR
>  }
>  module_init(ax25_init);
>  
>  
> -MODULE_AUTHOR("Jonathan Naylor G4KLX <g4klx@g4klx.demon.co.uk>");
> -MODULE_DESCRIPTION("The amateur radio AX.25 link layer protocol");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS_NETPROTO(PF_AX25);
> -
>  static void __exit ax25_exit(void)
>  {
> +#ifdef CONFIG_PROC_FS
Not needed, see proc_fs.h
>         proc_net_remove("ax25_route");
>         proc_net_remove("ax25");
>         proc_net_remove("ax25_calls");
> +#endif
>         ax25_rt_free();
>         ax25_uid_free();
>         ax25_dev_free();
>  
> +#ifdef CONFIG_SYSCTL
Not needed
>         ax25_unregister_sysctl();
> +#endif
> +
>         unregister_netdevice_notifier(&ax25_dev_notifier);
>  
>         dev_remove_pack(&ax25_packet_type);
> @@ -2032,3 +2077,8 @@
>         sock_unregister(PF_AX25);
>  }
>  module_exit(ax25_exit);
> +
> +MODULE_AUTHOR("Jonathan Naylor G4KLX <g4klx@g4klx.demon.co.uk>");
> +MODULE_DESCRIPTION("The amateur radio AX.25 link layer protocol");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS_NETPROTO(PF_AX25);
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============16466556229960427==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16466556229960427==--
