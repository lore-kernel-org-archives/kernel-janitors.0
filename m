From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 16 Aug 2004 08:38:46 +0000
Subject: Re: [Kernel-janitors] ip_gre.c: update last_rx after netif_rx
Message-Id: <20040816083846.GA1760@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73916713581074611=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <411E62D3.8070808@uranium235.org>
In-Reply-To: <411E62D3.8070808@uranium235.org>
To: kernel-janitors@vger.kernel.org

--===============73916713581074611==
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

well i hadn't researched that TODO item, when saying go for it,
sorry, but grepping for 'last_rx' in 2.6.8 shows only 2 items.
Arnaldo did lots of conversion at the beginning of the 2.4.x serie.
i think this task should be removed from TODO as the way to go is to
have correct rx pathes, but i'm not that good in networking code.
see: http://www.ussg.iu.edu/hypermail/linux/kernel/0302.2/1314.html

please confirm Arnaldo?

thanks
 
--
maks


--===============73916713581074611==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73916713581074611==--
