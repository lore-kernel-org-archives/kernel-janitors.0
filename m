From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 16 Apr 2020 06:53:39 +0000
Subject: Re: [PATCH V2] crypto: marvell/octeontx - Add missing '\n' in log messages
Message-Id: <20200416065339.GK7901@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411120633.22150-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200411120633.22150-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com, davem@davemloft.net, lbartosik@marvell.com, colin.king@canonical.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Apr 11, 2020 at 02:06:33PM +0200, Christophe JAILLET wrote:
> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
> 
> While at it, I've introduced a few pr_cont that looked logical to me.
> 
> Fixes: 10b4f09491bf ("crypto: marvell - add the Virtual Function driver for CPT")
> Fixes: d9110b0b01ff ("crypto: marvell - add support for OCTEON TX CPT engine")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> V2: remove a pr_cont after a pr_debug
>     avoid repeating 'engine_group' in a message
> ---
>  .../crypto/marvell/octeontx/otx_cptpf_main.c  |  4 +-
>  .../crypto/marvell/octeontx/otx_cptpf_mbox.c  | 12 +--
>  .../crypto/marvell/octeontx/otx_cptpf_ucode.c | 95 ++++++++++---------
>  .../crypto/marvell/octeontx/otx_cptvf_algs.c  |  6 +-
>  .../crypto/marvell/octeontx/otx_cptvf_main.c  | 12 +--
>  .../marvell/octeontx/otx_cptvf_reqmgr.c       | 10 +-
>  6 files changed, 70 insertions(+), 69 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
