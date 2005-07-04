From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Mon, 04 Jul 2005 12:49:57 +0000
Subject: Re: [KJ] [PATCH 2.6.13-rc1 17/17] fix sparse warnings (__nocast type)
Message-Id: <20050704094957.3e389419.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83469708858732594=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031908.09433.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031908.09433.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--===============83469708858732594==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Victor Fusco <victor@cetuc.puc-rio.br>
Sent on  Mon, 4 Jul 2005 09:44:13 +0000

> > > -static inline struct sk_buff *bt_skb_alloc(unsigned int len, int how)
> > > +static inline struct sk_buff *bt_skb_alloc(unsigned int len,
> > > +                                           unsigned int __nocast how)
> > 
> > I see a int to unsigned int change.  doing a lookup, I've found that
> > 'how' is a flag passed to alloc_skb.  is it safe to use it as unsigned? 
> > 
> 
> Oi!
> 
> A funcao alloc_skb tambem foi modificada para receber "unsigned int" .
> Da uma olhada no patch 14/17 nesta mesma thread. Essas modificacoes
> sao propagacoes do "__nocast type" em kmalloc. Que por sua vez, foi
> inserido justamente para apontar esse tipo de erro.

OK, explained and understood :)

Thanks!

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--===============83469708858732594==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83469708858732594==--
