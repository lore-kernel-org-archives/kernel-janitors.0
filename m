From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 03 Nov 2017 14:23:21 +0000
Subject: Re: [PATCH] crypto: qat: remove unused and redundant pointer vf_info
Message-Id: <20171103142321.GG9011@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171012170456.32505-1-colin.king@canonical.com>
In-Reply-To: <20171012170456.32505-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Salvatore Benedetto <salvatore.benedetto@intel.com>, "David S . Miller" <davem@davemloft.net>, Ahsan Atta <ahsan.atta@intel.com>, qat-linux@intel.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 12, 2017 at 06:04:56PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer vf_info is being assigned but never read, it is redundant
> and therefore can be removed.
> 
> Cleans up clang warning: Value stored to 'vf_info' is never read
> 
> Fixes: ed8ccaef52fa ("crypto: qat - Add support for SRIOV")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
