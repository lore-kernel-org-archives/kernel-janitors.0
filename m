From: Domen Puncer <domen@coderock.org>
Date: Wed, 15 Dec 2004 19:21:21 +0000
Subject: [KJ] Re: linux-2.6.9: add errorcheck for  netlink
Message-Id: <20041215192121.GA24818@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51029837435294412=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041215161324.GB5321@nd47.coderock.org>
In-Reply-To: <20041215161324.GB5321@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============51029837435294412==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15/12/04 19:25 +0100, walter harms wrote:
> 
> >
> >Fix mailer not to wrap lines.
> >
> 
> I am unsing now mozilla-mail hope that help,
> if i have more time i will switch to something more easy.
> 
> 
> 
> 
> 
> >>	rtnetlink_links[PF_UNSPEC] = link_rtnetlink_table;
> >>	rtnetlink_links[PF_PACKET] = link_rtnetlink_table;
> >>+	return 0;
> >>+
> >>+no_netlink:
> >>+	kfree(rtnl);
> >>+no_mem:
> >>+	return -1;
> >
> >
> >How about -ENOMEM or similar?
> >Also: nl_table isn't freed.
> >
> 
> Whitespace fixed
> -ENOM instead of -1
> freeing rta_buf
> what is nl_table ? typo ? i missed something ?

Uh, mixed that up; should have been rta_buf

> 
> 
> 
> >
> >>}
> >>
> >>EXPORT_SYMBOL(__rta_fill);
> >>--- linux-2.6.9/include/linux/rtnetlink.h.bak	2004-11-26 
> >>22:59:02.000000000 +0100
> >>+++ linux-2.6.9/include/linux/rtnetlink.h	2004-11-26 
> >>23:00:09.986720520 +0100
> >>@@ -805,7 +805,7 @@
> >>
> >>extern void rtnl_lock(void);
> >>extern void rtnl_unlock(void);
> >>-extern void rtnetlink_init(void);
> >>+extern int rtnetlink_init(void);
> >>
> >>#define ASSERT_RTNL() do { \
> >>	if (unlikely(down_trylock(&rtnl_sem) == 0)) { \
> >>--- linux-2.6.9/net/netlink/af_netlink.c.bak	2004-11-26 
> >>22:24:29.000000000 +0100
> >>+++ linux-2.6.9/net/netlink/af_netlink.c	2004-11-26 
> >>22:44:22.000000000 +0100
> >>@@ -1209,29 +1209,51 @@
> >>	.owner	= THIS_MODULE,	/* for consistency 8) */
> >>};
> >>
> >>-static int __init netlink_proto_init(void)
> >>-{
> >>-	struct sk_buff *dummy_skb;
> >>
> >>-	if (sizeof(struct netlink_skb_parms) > sizeof(dummy_skb->cb)) {
> >>-		printk(KERN_CRIT "netlink_init: panic\n");
> >>-		return -1;
> >>-	}
> >>-	sock_register(&netlink_family_ops);
> >
> >
> >Moving functions instead of predeclaring?
> >It makes reviewing harder.
> >
> >
> >>+static void __exit netlink_proto_exit(void)
> >>+{
> >>+       sock_unregister(PF_NETLINK);
> >>#ifdef CONFIG_PROC_FS
> >>-	proc_net_fops_create("netlink", 0, &netlink_seq_fops);
> >>+       proc_net_remove("netlink");
> >>#endif
> >>-	/* The netlink device handler may be needed early. */
> >>-	rtnetlink_init();
> >>-	return 0;
> >>}
> >>
> >>-static void __exit netlink_proto_exit(void)
> >>+static int __init netlink_proto_init(void)
> >>{
> >>-       sock_unregister(PF_NETLINK);
> >>-       proc_net_remove("netlink");
> >>+        struct sk_buff *dummy_skb;
> >>+#ifdef CONFIG_PROC_FS
> >>+        struct proc_dir_entry *proc;
> >>+#endif
> >>+        int err;
> >>+
> >>+        if (sizeof(struct netlink_skb_parms) > sizeof(dummy_skb->cb)) {
> >>+                printk(KERN_CRIT "netlink_init: panic\n");
> >>+                return -1;
> >>+        }
> >>+        err = sock_register(&netlink_family_ops);
> >>+        if (err < 0)
> >>+                return err;
> >>+
> >>+#ifdef CONFIG_PROC_FS
> >>+        proc = proc_net_fops_create("netlink", 0, &netlink_seq_fops);
> >>+        if (!proc) {
> >>+                sock_unregister(PF_NETLINK);
> >>+                return -ENOMEM;
> >>+        }
> >>+#endif
> >>+
> >>+        /* The netlink device handler may be needed early. */
> >>+        if ( rtnetlink_init() < 0) {
> >>+                netlink_proto_exit();
> >
> >
> >You can't call __exit function from non-__exit.
> >(If this is linked in kernel __exit stuff gets discarded)
> >
> >
> >>+                return -1;
> >>+        } ;
> >>+
> >>+        return 0;
> >>}
> >>
> 
> + whitespace fixed 'if ( rtnetlink_init'
> + netlink_proto_exit is prototyped
> Will you move the function in front of _init again ?
> A prototype for a 2 liner is noise for me :)

Ah, false alarm then; looked like moving big functions, but is in fact
indentiation (in original tabs, in you version spaces).

> 
> + i removed CONFIG_PROC_FS from the exit code since i have learned
>   that proc_net_remove() will be empty in that case

Right.

> 
> re,
> walter
> 

--===============51029837435294412==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51029837435294412==--
