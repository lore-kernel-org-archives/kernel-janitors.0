From: Anne Thrax <foobarfoobarfoobar@gmail.com>
Date: Thu, 15 Jun 2006 19:54:47 +0000
Subject: Re: [KJ] [PATCH 2.6.16.20 001/001l] netfilter: frees skb
Message-Id: <4491BB07.8000501@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060615121356.43791.qmail@web8714.mail.in.yahoo.com>
In-Reply-To: <20060615121356.43791.qmail@web8714.mail.in.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> This removes the use of kfree in freeing skbs. 
> kfree has been replaced with kfree_skb.
> 
> Signed-off-by: <nilayvaish@yahoo.com>
> ---
> --- a/net/ipv4/netfilter/ipt_recent.c   2006-03-20 11:23:29.000000000 +0530
> +++ b/net/ipv4/netfilter/ipt_recent.c   2006-06-15 10:52:59.000000000 +0530
> @@ -322,7 +322,7 @@ static int ip_recent_ctrl(struct file *f
> 
>  kfree(skb->nh.iph);
>  out_free_skb:
> - kfree(skb);
> + kfree_skb(skb);
>  out_free_info:
>  kfree(info);

I think that I've already sent in a patch for this. If so, then you need to
not only switch the kfree() with kfree_skb(). The skb being freed was
allocated with kmalloc(), so you need to switch that with alloc_skb().
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
