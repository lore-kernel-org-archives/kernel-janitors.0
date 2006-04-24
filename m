From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 24 Apr 2006 04:41:51 +0000
Subject: Re: [KJ] [PATCH] net/ipv4/netfilter/ipt_recent.c 2.6.17-rc2-git5
Message-Id: <20060424044151.GB32505@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42263371466669408=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <444C4F8E.4050001@gmail.com>
In-Reply-To: <444C4F8E.4050001@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============42263371466669408==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2006 at 12:09:50AM -0400, Anne Thrax wrote:
> Replaced a kfree() with a kfree_skb() when freeing an sk_buff.

But this skbuff wasn't allocated with alloc_skb().  Is this kosher?
Is it also a bug that this skb was kmalloced?

It looks to me like this is a fake skb and it should be kfree'd,
but I'd welcome more eyes on this one.

> --- /usr/src/linux-2.6.17-rc2-git5-orig/net/ipv4/netfilter/ipt_recent.c 
> 2006-04-23 16:47:53.000000000 -0500
> +++ /usr/src/linux-2.6.17-rc2-git5/net/ipv4/netfilter/ipt_recent.c 
> 2006-04-23 16:51:09.000000000 -0500
> @@ -323,7 +323,7 @@
> 
>         kfree(skb->nh.iph);
>  out_free_skb:
> -       kfree(skb);
> +       kfree_skb(skb);
>  out_free_info:
>         kfree(info);
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42263371466669408==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42263371466669408==--
