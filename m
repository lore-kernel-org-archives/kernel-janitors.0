From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sat, 06 Jun 2015 12:05:04 +0000
Subject: Re: [PATCH] fib_trie: Fix potential null pointer dereference
Message-Id: <1433592304.1895.73.camel@edumazet-glaptop2.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433590553-4672-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1433590553-4672-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Firo Yang <firogm@gmail.com>
Cc: davem@davemloft.net, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2015-06-06 at 19:35 +0800, Firo Yang wrote:
> A smatch warning.
> When kmem_cache_alloc() failed to alloc memory, a null pointer
> will be returned. Redeference null pointer will generate


Dereferencing a null pointer will crash.

> an unnecessary oops. So, use it after check.
> 
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  net/ipv4/fib_trie.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv4/fib_trie.c b/net/ipv4/fib_trie.c
> index 01bce15..34094c7 100644
> --- a/net/ipv4/fib_trie.c
> +++ b/net/ipv4/fib_trie.c
> @@ -326,12 +326,13 @@ static inline void empty_child_dec(struct key_vector *n)
>  static struct key_vector *leaf_new(t_key key, struct fib_alias *fa)
>  {
>  	struct tnode *kv = kmem_cache_alloc(trie_leaf_kmem, GFP_KERNEL);
> -	struct key_vector *l = kv->kv;
> +	struct key_vector *l;
>  
>  	if (!kv)
>  		return NULL;
>  
>  	/* initialize key vector */
> +	l = kv->kv;
>  	l->key = key;
>  	l->pos = 0;
>  	l->bits = 0;

Fixes: dc35dbeda3e0 ("fib_trie: Add tnode struct as a container for fields not needed in key_vector")
Acked-by: Eric Dumazet <edumazet@google.com>

Thanks.


