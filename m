From: Kim Phillips <kim.phillips@freescale.com>
Date: Fri, 01 Apr 2011 19:42:05 +0000
Subject: Re: [PATCH 2/6] drivers/crypto/caam/caamalg.c: introduce missing
Message-Id: <20110401144205.b050c598.kim.phillips@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301667827-20056-2-git-send-email-julia@diku.dk>
In-Reply-To: <1301667827-20056-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Steve Cornelius <sec@pobox.com>, Dan Carpenter <error27@gmail.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 1 Apr 2011 16:23:43 +0200
Julia Lawall <julia@diku.dk> wrote:

> Error handling code following a kmalloc should free the allocated data.

> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---

Acked-by: Kim Phillips <kim.phillips@freescale.com>

Kim

