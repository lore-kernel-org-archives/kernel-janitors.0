From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Thu, 30 Aug 2012 01:34:51 +0000
Subject: Re: [PATCH 1/7] ipvs: fix error return code
Message-Id: <20120830013451.GC8878@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346258957-7649-1-git-send-email-Julia.Lawall@lip6.fr>
 <1346258957-7649-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1346258957-7649-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Wensong Zhang <wensong@linux-vs.org>, kernel-janitors@vger.kernel.org, Simon Horman <horms@verge.net.au>, Julian Anastasov <ja@ssi.bg>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org

On Wed, Aug 29, 2012 at 06:49:11PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Initialize return variable before exiting on an error path.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
> 
> // </smpl>

Applied. Thanks.
