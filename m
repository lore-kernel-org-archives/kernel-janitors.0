From: Anne Thrax <foobarfoobarfoobar@gmail.com>
Date: Mon, 24 Apr 2006 20:39:10 +0000
Subject: Re: [KJ] [PATCH] net/ipv4/netfilter/ipt_recent.c 2.6.17-rc2-git5
Message-Id: <444D376E.7040007@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444C4F8E.4050001@gmail.com>
In-Reply-To: <444C4F8E.4050001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>
> But this skbuff wasn't allocated with alloc_skb().  Is this kosher?
> Is it also a bug that this skb was kmalloced?
>
> It looks to me like this is a fake skb and it should be kfree'd,
> but I'd welcome more eyes on this one.
>

Maybe we should then have it alloc_skb() rather than just kmalloc()
The function isn't there for nothing, and it does do some checking
that would not be done through kmalloc() and kfree().

--- /usr/src/linux-2.6.17-rc2-git5-orig/net/ipv4/netfilter/ipt_recent.c 
2006-04-23 16:47:53.000000000 -0500
+++ /usr/src/linux-2.6.17-rc2-git5/net/ipv4/netfilter/ipt_recent.c 
2006-04-23 23:50:50.000000000 -0500
@@ -304,7 +304,7 @@
        strncpy(info->name,curr_table->name,IPT_RECENT_NAME_LEN);
        info->name[IPT_RECENT_NAME_LEN-1] = '\0';

-       skb = kmalloc(sizeof(struct sk_buff),GFP_KERNEL);
+       skb = alloc_skb(sizeof(struct sk_buff),GFP_KERNEL);
        if (!skb) {
                used = -ENOMEM;
                goto out_free_info;
@@ -323,7 +323,7 @@

        kfree(skb->nh.iph);
 out_free_skb:
-       kfree(skb);
+       kfree_skb(skb);
 out_free_info:
        kfree(info);


While reading the function alloc_skb(), you can request it to be
a certain size. But why would anyone want to allocate a different
size than sizeof(sk_buff)? Unless there is something I'm missing
here, why don't we just remove the size parameter altogether?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
