From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 21 Aug 2004 08:36:39 +0000
Subject: Re: [Kernel-janitors] ip_gre.c: update last_rx after netif_rx
Message-Id: <20040821083639.GA1827@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24698981041887724=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <411E62D3.8070808@uranium235.org>
In-Reply-To: <411E62D3.8070808@uranium235.org>
To: Jay Bourque <kernel@uranium235.org>
Cc: kernel-janitors@lists.osdl.org, netdev@oss.sgi.com

--===============24698981041887724==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 14 Aug 2004, Jay Bourque wrote:

> Fix to update last_rx after netif_rx
> This is my first patch so I'd appreciate any feedback.
> 
> -Jay
> 
> --- linux-2.6.8.1/net/ipv4/ip_gre.c    Sat Aug 14 05:55:48 2004
> +++ linux-2.6.8.1/net/ipv4/ip_gre.c.new    Sat Aug 14 12:17:16 2004
> @@ -646,6 +646,7 @@ int ipgre_rcv(struct sk_buff *skb)
>         nf_reset(skb);
>         ipgre_ecn_decapsulate(iph, skb);
>         netif_rx(skb);
> +       tunnel->dev->last_rx = jiffies;
>         read_unlock(&ipgre_lock);
>         return(0);
>     }
doesn't look complete, see patch below, but please read on:

the kj todo has an entry about "update last_rx after netif_rx", 
i wonder what that timestamping is good for, and newer 
sources 2.4.27 and 2.6.8 show 2 occurences of last_rx.

patches doing that are for young 2.4:
http://seclists.org/linux-kernel/2001/Feb/4846.html

i presume that this task is outdated,
thanks for putting light on that. 



--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============24698981041887724==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24698981041887724==--
