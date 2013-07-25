From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Thu, 25 Jul 2013 07:32:06 +0000
Subject: Re: [patch -mainline] af_key: more info leaks in pfkey messages
Message-Id: <20130725073205.GQ3109@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130724103956.GA30345@elgon.mountain>
In-Reply-To: <20130724103956.GA30345@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mathias Krause <minipli@googlemail.com>, Herbert Xu <herbert@gondor.hengli.com.au>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 24, 2013 at 01:39:57PM +0300, Dan Carpenter wrote:
> This is inspired by a5cc68f3d6 "af_key: fix info leaks in notify
> messages".  There are some struct members which don't get initialized
> and could disclose small amounts of private information.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I'm at the "monkey see, monkey do" level of understanding this code so
> let me know if I've missed something.
> 
> diff --git a/net/key/af_key.c b/net/key/af_key.c
> index 456b262..e939d32 100644
> --- a/net/key/af_key.c
> +++ b/net/key/af_key.c
> @@ -2081,6 +2081,7 @@ static int pfkey_xfrm_policy2msg(struct sk_buff *skb, const struct xfrm_policy *
>  			pol->sadb_x_policy_type = IPSEC_POLICY_NONE;
>  	}
>  	pol->sadb_x_policy_dir = dir+1;
> +	pol->sadb_x_policy_reserved = 0;
>  	pol->sadb_x_policy_id = xp->index;
>  	pol->sadb_x_policy_priority = xp->priority;
>  
> @@ -3137,7 +3138,9 @@ static int pfkey_send_acquire(struct xfrm_state *x, struct xfrm_tmpl *t, struct
>  	pol->sadb_x_policy_exttype = SADB_X_EXT_POLICY;
>  	pol->sadb_x_policy_type = IPSEC_POLICY_IPSEC;
>  	pol->sadb_x_policy_dir = XFRM_POLICY_OUT + 1;
> +	pol->sadb_x_policy_reserved = 0;
>  	pol->sadb_x_policy_id = xp->index;
> +	pol->sadb_x_policy_priority = 0;

Userspace seems not to care, but the correct setting would be

pol->sadb_x_policy_priority = xp->priority;

So maybe we should send the right priority to userspace, just for
the case that anyone is interested in it.

