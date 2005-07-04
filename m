From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Mon, 04 Jul 2005 11:13:23 +0000
Subject: Re: [KJ] [PATCH 2.6.13-rc1 17/17] fix sparse warnings (__nocast type)
Message-Id: <20050704081323.22ae8c37.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14570663611782297=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031908.09433.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031908.09433.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--===============14570663611782297==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Victor Fusco <victor@cetuc.puc-rio.br>
Sent on  Sun, 3 Jul 2005 19:08:09 +0000

> -static inline struct sk_buff *bt_skb_alloc(unsigned int len, int how)
> +static inline struct sk_buff *bt_skb_alloc(unsigned int len,
> +                                           unsigned int __nocast how)

I see a int to unsigned int change.  doing a lookup, I've found that 'how'
is a flag passed to alloc_skb.  is it safe to use it as unsigned? 

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--===============14570663611782297==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14570663611782297==--
