From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Thu, 30 Jul 2015 11:57:43 +0000
Subject: Re: [patch -master] netfilter: xt_CT: checking for IS_ERR() instead of NULL
Message-Id: <20150730115743.GA7077@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150727224228.GA10367@mwanda>
In-Reply-To: <20150727224228.GA10367@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 28, 2015 at 01:42:28AM +0300, Dan Carpenter wrote:
> We recently changed this from nf_conntrack_alloc() to nf_ct_tmpl_alloc()
> so the error handling needs to changed to check for NULL instead of
> IS_ERR().
> 
> Fixes: 0838aa7fcfcd ('netfilter: fix netns dependencies with conntrack templates')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

I have also appended this chunk, since synproxy is also affected:

--- a/net/netfilter/nf_synproxy_core.c
+++ b/net/netfilter/nf_synproxy_core.c
@@ -353,7 +353,7 @@ static int __net_init synproxy_net_init(struct net *net)
        int err = -ENOMEM;
 
        ct = nf_ct_tmpl_alloc(net, 0, GFP_KERNEL);
-       if (IS_ERR(ct)) {
+       if (!ct) {
                err = PTR_ERR(ct);
                goto err1;
        }

> diff --git a/net/netfilter/xt_CT.c b/net/netfilter/xt_CT.c
> index c663003..43ddeee 100644
> --- a/net/netfilter/xt_CT.c
> +++ b/net/netfilter/xt_CT.c
> @@ -202,9 +202,10 @@ static int xt_ct_tg_check(const struct xt_tgchk_param *par,
>  		goto err1;
>  
>  	ct = nf_ct_tmpl_alloc(par->net, info->zone, GFP_KERNEL);
> -	ret = PTR_ERR(ct);
> -	if (IS_ERR(ct))
> +	if (!ct) {
> +		ret = -ENOMEM;
>  		goto err2;
> +	}
>  
>  	ret = 0;
>  	if ((info->ct_events || info->exp_events) &&
