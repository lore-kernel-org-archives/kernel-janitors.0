From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 30 May 2010 20:11:28 +0000
Subject: Re: Subject: [PATCH] net/ipv6: Use GFP_ATOMIC when a lock is held
Message-Id: <1275250288.2472.21.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005302147310.19253@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005302147310.19253@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le dimanche 30 mai 2010 à 21:48 +0200, Julia Lawall a écrit :
> From: Julia Lawall <julia@diku.dk>
> 
> A spin lock is taken near the beginning of the enclosing function.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> @@
> 
> spin_lock(...)
> ... when != spin_unlock(...)
> -GFP_KERNEL
> +GFP_ATOMIC
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  net/ipv6/sit.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -u -p a/net/ipv6/sit.c b/net/ipv6/sit.c
> --- a/net/ipv6/sit.c
> +++ b/net/ipv6/sit.c
> @@ -358,7 +358,7 @@ ipip6_tunnel_add_prl(struct ip_tunnel *t
>  		goto out;
>  	}
>  
> -	p = kzalloc(sizeof(struct ip_tunnel_prl_entry), GFP_KERNEL);
> +	p = kzalloc(sizeof(struct ip_tunnel_prl_entry), GFP_ATOMIC);
>  	if (!p) {
>  		err = -ENOBUFS;
>  		goto out;

Nice catch, but what about allocating this outside of the locked
section ?

diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
index e51e650..ff3dd84 100644
--- a/net/ipv6/sit.c
+++ b/net/ipv6/sit.c
@@ -340,6 +340,10 @@ ipip6_tunnel_add_prl(struct ip_tunnel *t, struct ip_tunnel_prl *a, int chg)
 	if (a->addr = htonl(INADDR_ANY))
 		return -EINVAL;
 
+	p = kzalloc(sizeof(struct ip_tunnel_prl_entry), GFP_KERNEL);
+	if (!p)
+		return -ENOBUFS;
+
 	spin_lock(&ipip6_prl_lock);
 
 	for (p = t->prl; p; p = p->next) {
@@ -358,19 +362,16 @@ ipip6_tunnel_add_prl(struct ip_tunnel *t, struct ip_tunnel_prl *a, int chg)
 		goto out;
 	}
 
-	p = kzalloc(sizeof(struct ip_tunnel_prl_entry), GFP_KERNEL);
-	if (!p) {
-		err = -ENOBUFS;
-		goto out;
-	}
 
 	p->next = t->prl;
 	p->addr = a->addr;
 	p->flags = a->flags;
 	t->prl_count++;
 	rcu_assign_pointer(t->prl, p);
+	p = NULL;
 out:
 	spin_unlock(&ipip6_prl_lock);
+	kfree(p);
 	return err;
 }
 


