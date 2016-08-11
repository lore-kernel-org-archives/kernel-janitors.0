From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Thu, 11 Aug 2016 11:11:50 +0000
Subject: Re: [PATCH] xfrm: constify xfrm_replay structures
Message-Id: <20160811111150.GC5710@gauss.secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470760028-8581-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470760028-8581-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 09, 2016 at 06:27:08PM +0200, Julia Lawall wrote:
> The xfrm_replay structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to the ipsec-next tree, thanks!
