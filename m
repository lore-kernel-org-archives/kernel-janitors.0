From: =?UTF-8?Q?Kadlecsik_J=C3=B3zsef?= <kadlec@blackhole.kfki.hu>
Date: Thu, 22 Aug 2019 09:11:56 +0000
Subject: Re: [PATCH] netfilter: ipset: Fix an error code in ip_set_sockfn_get()
Message-Id: <alpine.DEB.2.20.1908221109390.11879@blackhole.kfki.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821071830.GI26957@mwanda>
In-Reply-To: <20190821071830.GI26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, Florent Fourcot <florent.fourcot@wifirst.fr>, Kate Stewart <kstewart@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, Aditya Pakki <pakki001@umn.edu>, Qian Cai <cai@gmx.us>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Johannes Berg <johannes.berg@intel.com>, Stefano Brivio <sbrivio@redhat.com>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, 21 Aug 2019, Dan Carpenter wrote:

> The copy_to_user() function returns the number of bytes remaining to be
> copied.  In this code, that positive return is checked at the end of the
> function and we return zero/success.  What we should do instead is
> return -EFAULT.

Yes, you are right. There's another usage of copy_to_user() in this 
function, could you fix it as well?

Best regards,
Jozsef
 
> Fixes: a7b4f989a629 ("netfilter: ipset: IP set core support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  net/netfilter/ipset/ip_set_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
> index e64d5f9a89dd..15b8d4318207 100644
> --- a/net/netfilter/ipset/ip_set_core.c
> +++ b/net/netfilter/ipset/ip_set_core.c
> @@ -2129,7 +2129,8 @@ ip_set_sockfn_get(struct sock *sk, int optval, void __user *user, int *len)
>  	}	/* end of switch(op) */
>  
>  copy:
> -	ret = copy_to_user(user, data, copylen);
> +	if (copy_to_user(user, data, copylen))
> +		ret = -EFAULT;
>  
>  done:
>  	vfree(data);
> -- 
> 2.20.1
> 
> 

-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
