From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Apr 2019 08:34:37 +0000
Subject: Re: [PATCH] netfilter: nf_tables: prevent shift wrap in nft_chain_parse_hook()
Message-Id: <20190405083436.GT32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190402133038.GA18575@kadam>
In-Reply-To: <20190402133038.GA18575@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

On Tue, Apr 02, 2019 at 04:30:38PM +0300, Dan Carpenter wrote:
> I believe that "hook->num" can be up to UINT_MAX so the shift has to
> be unsigned or shifting more than 31 is undefined.  It's possible that
> this leads to array overflow in nf_tables_addchain():
> 
> 	ops->hook	= hook.type->hooks[ops->hooknum];
> 
> Fixes: fe19c04ca137 ("netfilter: nf_tables: remove nhooks field from struct nft_af_info")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  net/netfilter/nf_tables_api.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> index ef7772e976cc..b6e48fe7c776 100644
> --- a/net/netfilter/nf_tables_api.c
> +++ b/net/netfilter/nf_tables_api.c
> @@ -1545,7 +1545,7 @@ static int nft_chain_parse_hook(struct net *net,
>  		if (IS_ERR(type))
>  			return PTR_ERR(type);
>  	}
> -	if (!(type->hook_mask & (1 << hook->num)))
> +	if (!(type->hook_mask & (1U << hook->num)))

Ugh...  No this doesn't work.  It's still undefined behavoir even if we
make it unsigned.  It has to be:

	if (hook->num > 31 || !(type->hook_mask & (1 << hook->num)))

which seems like a slightly ugly magic number but it fixes the buffer
overflow.

regards,
dan carpenter
