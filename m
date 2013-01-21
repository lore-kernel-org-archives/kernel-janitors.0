From: David Miller <davem@davemloft.net>
Date: Mon, 21 Jan 2013 18:19:12 +0000
Subject: Re: [PATCH 7/15] drivers/crypto/atmel-aes.c: adjust duplicate test
Message-Id: <20130121.131912.602907116084738120.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
	<1358773378-4700-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358773378-4700-8-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: herbert@gondor.apana.org.au, kernel-janitors@vger.kernel.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 21 Jan 2013 14:02:51 +0100

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Delete successive tests to the same location.  The code tested the result
> of a previous allocation, that itself was already tested.  It is changed to
> test the result of the most recent allocation.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: David S. Miller <davem@davemloft.net>
