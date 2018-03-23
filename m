From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 23 Mar 2018 15:58:04 +0000
Subject: Re: [PATCH 2/2] crypto: talitos: Delete an error message for a failed memory allocation in talitos_e
Message-Id: <20180323155804.GA2186@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ad256dc9-a064-37f9-fb8e-aea22ba40a2b@users.sourceforge.net>
 <13bfdc03-1dee-2f1c-da8d-1e452f10c850@users.sourceforge.net>
In-Reply-To: <13bfdc03-1dee-2f1c-da8d-1e452f10c850@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-crypto@vger.kernel.org, Christophe Leroy <christophe.leroy@c-s.fr>, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Mar 12, 2018 at 02:32:58PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 12 Mar 2018 14:18:23 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
