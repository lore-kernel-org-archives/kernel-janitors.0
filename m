From: =?UTF-8?Q?Kadlecsik_J=C3=B3zsef?= <kadlec@blackhole.kfki.hu>
Date: Tue, 27 Aug 2019 18:21:29 +0000
Subject: Re: [PATCH v2] netfilter: ipset: Fix an error code in ip_set_sockfn_get()
Message-Id: <alpine.DEB.2.20.1908272020470.11996@blackhole.kfki.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190824144955.GA5337@mwanda>
In-Reply-To: <20190824144955.GA5337@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, Florent Fourcot <florent.fourcot@wifirst.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Aditya Pakki <pakki001@umn.edu>, Johannes Berg <johannes.berg@intel.com>, Stefano Brivio <sbrivio@redhat.com>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org


Hi Dan,

On Sat, 24 Aug 2019, Dan Carpenter wrote:

> The copy_to_user() function returns the number of bytes remaining to be
> copied.  In this code, that positive return is checked at the end of the
> function and we return zero/success.  What we should do instead is
> return -EFAULT.
> 
> Fixes: a7b4f989a629 ("netfilter: ipset: IP set core support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: I missed the other instance of this issue
> 
>  net/netfilter/ipset/ip_set_core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Patch is applied in the ipset git tree, thanks!

Best regards,
Jozsef

> diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
> index e64d5f9a89dd..e7288eab7512 100644
> --- a/net/netfilter/ipset/ip_set_core.c
> +++ b/net/netfilter/ipset/ip_set_core.c
> @@ -2069,8 +2069,9 @@ ip_set_sockfn_get(struct sock *sk, int optval, void __user *user, int *len)
>  		}
>  
>  		req_version->version = IPSET_PROTOCOL;
> -		ret = copy_to_user(user, req_version,
> -				   sizeof(struct ip_set_req_version));
> +		if (copy_to_user(user, req_version,
> +				 sizeof(struct ip_set_req_version)))
> +			ret = -EFAULT;
>  		goto done;
>  	}
>  	case IP_SET_OP_GET_BYNAME: {
> @@ -2129,7 +2130,8 @@ ip_set_sockfn_get(struct sock *sk, int optval, void __user *user, int *len)
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
> 2.11.0
> 
> 

-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
