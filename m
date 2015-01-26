From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 26 Jan 2015 02:55:19 +0000
Subject: Re: [PATCH] crypto: atmel: Free memory in error path
Message-Id: <20150126025519.GA19796@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1421738152-30462-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1421738152-30462-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 20, 2015 at 08:15:52AM +0100, Christophe Jaillet wrote:
> If only one of the 2 __get_free_pages fails, then there is a memory leak.
> 
> Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
