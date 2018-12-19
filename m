From: Florian Westphal <fw@strlen.de>
Date: Wed, 19 Dec 2018 09:13:13 +0000
Subject: Re: [PATCH net-next] xfrm: policy: remove set but not used variable 'priority'
Message-Id: <20181219091313.ab7xl2y7wldffpwc@breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545181940-100883-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1545181940-100883-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> net/xfrm/xfrm_policy.c: In function 'xfrm_policy_lookup_bytype':
> net/xfrm/xfrm_policy.c:2079:6: warning:
>  variable 'priority' set but not used [-Wunused-but-set-variable]
> 
> It not used since commit 6be3b0db6db8 ("xfrm: policy: add inexact policy
> search tree infrastructure")

Acked-by: Florian Westphal <fw@strlen.de>

Removing this appears correct, the exact policy gets passed to
xfrm_policy_eval_candidates where the priority is checked.
