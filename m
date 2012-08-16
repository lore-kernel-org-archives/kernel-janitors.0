From: ebiederm@xmission.com (Eric W. Biederman)
Date: Thu, 16 Aug 2012 23:11:36 +0000
Subject: Re: [patch] ipv6: move dereference after check in fl_free()
Message-Id: <87sjbm1lg7.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120816131502.GB23188@elgon.mountain>
In-Reply-To: <20120816131502.GB23188@elgon.mountain> (Dan Carpenter's message
	of "Thu, 16 Aug 2012 16:15:02 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> There is a dereference before checking for NULL bug here.  Generally
> free() functions should accept NULL pointers.  For example, fl_create()
> can pass a NULL pointer to fl_free() on the error path.

Thanks.

Applied to user-namespace.git

Eric

>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Only needed on linux-next.
>
> diff --git a/net/ipv6/ip6_flowlabel.c b/net/ipv6/ip6_flowlabel.c
> index c836a6a..90bbefb 100644
> --- a/net/ipv6/ip6_flowlabel.c
> +++ b/net/ipv6/ip6_flowlabel.c
> @@ -91,12 +91,9 @@ static struct ip6_flowlabel *fl_lookup(struct net *net, __be32 label)
>  
>  static void fl_free(struct ip6_flowlabel *fl)
>  {
> -	switch (fl->share) {
> -	case IPV6_FL_S_PROCESS:
> -		put_pid(fl->owner.pid);
> -		break;
> -	}
>  	if (fl) {
> +		if (fl->share = IPV6_FL_S_PROCESS)
> +			put_pid(fl->owner.pid);
>  		release_net(fl->fl_net);
>  		kfree(fl->opt);
>  	}
