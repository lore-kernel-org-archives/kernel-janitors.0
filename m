From: Domen Puncer <domen@coderock.org>
Date: Sun, 01 Aug 2004 22:20:46 +0000
Subject: [Kernel-janitors] Re: linux2.6.7: af_ipx.c init cleanup
Message-Id: <20040801222046.GB2276@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68026513679804967=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68026513679804967==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/08/04 21:41 +0200, Walter Harms wrote:
> Hi list,
> i moved the messages directly into the code also.
>

Someone's gonna be happy with all the error messages, when he hits this :-)
(also... you can do better than numbered labels)
> +       err=ipx_proc_init();
> +       if (err < 0)
> +               goto exit_7;
> +#endif
>         return 0;
> +exit_7:
> +       ipx_unregister_sysctl();
> +
> +exit_6:
> +       unregister_snap_client(pSNAP_datalink);
> +exit_5:
> +       printk(KERN_CRIT "IPX: Unable to register with SNAP\n");
> +       unregister_8022_client(p8022_datalink);
> +exit_4:
> +       printk(KERN_CRIT "IPX: Unable to register with 802.2\n");
> +       dev_remove_pack(&ipx_8023_packet_type);
> +       destroy_8023_client(p8023_datalink);
> +exit_3:
> +       printk(KERN_CRIT "IPX: Unable to register with 802.3\n");
> +       dev_remove_pack(&ipx_dix_packet_type);
> +       destroy_EII_client(pEII_datalink);
> +exit_2:
> +       printk(KERN_CRIT "IPX: Unable to register with Ethernet II\n");
> +       sock_unregister(ipx_family_ops.family);
> +exit_1:
> +       return -1;
> +
>  }
>  
>  static void __exit ipx_proto_finito(void)
>  {
> +#ifdef CONFIG_PROC_FS
>         ipx_proc_exit();
> -       ipx_unregister_sysctl();
> +#endif
>  
> +#ifdef CONFIG_SYSCTL
> +       ipx_unregister_sysctl();
> +#endif
>         unregister_netdevice_notifier(&ipx_dev_notifier);
>  
>         ipxitf_cleanup();
> 
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============68026513679804967==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68026513679804967==--
