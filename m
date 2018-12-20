From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Thu, 20 Dec 2018 08:10:46 +0000
Subject: Re: [PATCH net-next] xfrm: policy: remove set but not used variable 'priority'
Message-Id: <20181220081046.GA3581@gauss3.secunet.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545181940-100883-1-git-send-email-yuehaibing@huawei.com>
 <20181219091313.ab7xl2y7wldffpwc@breakpoint.cc>
In-Reply-To: <20181219091313.ab7xl2y7wldffpwc@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: YueHaibing <yuehaibing@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 19, 2018 at 10:13:13AM +0100, Florian Westphal wrote:
> YueHaibing <yuehaibing@huawei.com> wrote:
> > Fixes gcc '-Wunused-but-set-variable' warning:
> > 
> > net/xfrm/xfrm_policy.c: In function 'xfrm_policy_lookup_bytype':
> > net/xfrm/xfrm_policy.c:2079:6: warning:
> >  variable 'priority' set but not used [-Wunused-but-set-variable]
> > 
> > It not used since commit 6be3b0db6db8 ("xfrm: policy: add inexact policy
> > search tree infrastructure")
> 
> Acked-by: Florian Westphal <fw@strlen.de>

Patch applied, thanks!
