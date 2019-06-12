From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Wed, 12 Jun 2019 10:40:07 +0000
Subject: Re: [PATCH][next] xfrm: fix missing break on AF_INET6 case
Message-Id: <20190612104007.GK17989@gauss3.secunet.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190612103624.27246-1-colin.king@canonical.com>
In-Reply-To: <20190612103624.27246-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Florian Westphal <fw@strlen.de>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 12, 2019 at 11:36:24AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> It appears that there is a missing break statement for the AF_INET6 case
> that falls through to the default WARN_ONCE case. I don't think that is
> intentional. Fix this by adding in the missing break.
> 
> Addresses-Coverity: ("Missing break in switch")
> Fixes: 4c203b0454b5 ("xfrm: remove eth_proto value from xfrm_state_afinfo")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I have already a patch from Florian in queue to fix this.

Thanks anyway!
