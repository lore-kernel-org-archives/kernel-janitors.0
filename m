From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 24 Apr 2006 23:24:33 +0000
Subject: Re: [KJ] [PATCH] net/ipv4/netfilter/ipt_recent.c 2.6.17-rc2-git5
Message-Id: <20060424232433.GC32505@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54518936928489192=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <444C4F8E.4050001@gmail.com>
In-Reply-To: <444C4F8E.4050001@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============54518936928489192==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2006 at 04:39:10PM -0400, Anne Thrax wrote:
> >
> >But this skbuff wasn't allocated with alloc_skb().  Is this kosher?
> >Is it also a bug that this skb was kmalloced?
> >
> >It looks to me like this is a fake skb and it should be kfree'd,
> >but I'd welcome more eyes on this one.
> 
> Maybe we should then have it alloc_skb() rather than just kmalloc()
> The function isn't there for nothing, and it does do some checking
> that would not be done through kmalloc() and kfree().

But then, alloc_skb() does a lot of work that kmalloc doesn't do.
If the author knows that work is irrelevant, then this is a good
optimisation, and perhaps even necessary given that this code path is
potentially called for every packet.

I don't know; you may be right.  Let's see if the author can explain why
he's kmallocing instead of skb_allocing

> --- /usr/src/linux-2.6.17-rc2-git5-orig/net/ipv4/netfilter/ipt_recent.c 
> 2006-04-23 16:47:53.000000000 -0500
> +++ /usr/src/linux-2.6.17-rc2-git5/net/ipv4/netfilter/ipt_recent.c 
> 2006-04-23 23:50:50.000000000 -0500
> @@ -304,7 +304,7 @@
>        strncpy(info->name,curr_table->name,IPT_RECENT_NAME_LEN);
>        info->name[IPT_RECENT_NAME_LEN-1] = '\0';
> 
> -       skb = kmalloc(sizeof(struct sk_buff),GFP_KERNEL);
> +       skb = alloc_skb(sizeof(struct sk_buff),GFP_KERNEL);
>        if (!skb) {
>                used = -ENOMEM;
>                goto out_free_info;
> @@ -323,7 +323,7 @@
> 
>        kfree(skb->nh.iph);
> out_free_skb:
> -       kfree(skb);
> +       kfree_skb(skb);
> out_free_info:
>        kfree(info);
> 
> 
> While reading the function alloc_skb(), you can request it to be
> a certain size. But why would anyone want to allocate a different
> size than sizeof(sk_buff)? Unless there is something I'm missing
> here, why don't we just remove the size parameter altogether?
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54518936928489192==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54518936928489192==--
