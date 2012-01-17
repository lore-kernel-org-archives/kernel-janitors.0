From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 17 Jan 2012 20:57:08 +0000
Subject: Re: [patch] inetpeer: initialize ->redirect_genid in inet_getpeer()
Message-Id: <1326833828.2606.5.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120117204843.GA20999@elgon.mountain>
In-Reply-To: <20120117204843.GA20999@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Le mardi 17 janvier 2012 à 23:48 +0300, Dan Carpenter a écrit :
> kmemcheck complains that ->redirect_genid doesn't get initialized.
> Presumably it should be set to zero.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/net/ipv4/inetpeer.c b/net/ipv4/inetpeer.c
> index 86f13c67..49ce5f4 100644
> --- a/net/ipv4/inetpeer.c
> +++ b/net/ipv4/inetpeer.c
> @@ -447,6 +447,7 @@ relookup:
>  		p->rate_last = 0;
>  		p->pmtu_expires = 0;
>  		p->pmtu_orig = 0;
> +		p->redirect_genid = 0;
>  		memset(&p->redirect_learned, 0, sizeof(p->redirect_learned));
>  
> 

We dont really care, since we force redirect_learned.a4 to be 0

Only place we care is in ip_rt_redirect() and its done properly there.

Lets shutup kmemcheck.

Acked-by: Eric Dumazet <eric.dumazet@gmail.com>



