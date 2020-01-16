From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 16 Jan 2020 07:05:44 +0000
Subject: Re: [PATCH][next] tee: fix memory allocation failure checks on drv_data and amdtee
Message-Id: <20200116070544.doegatlwgsftbhc4@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107143601.105321-1-colin.king@canonical.com>
 <747f9c93-7465-99aa-0b91-a05fd64c7d1f@amd.com>
In-Reply-To: <747f9c93-7465-99aa-0b91-a05fd64c7d1f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Cc: Colin King <colin.king@canonical.com>, Jens Wiklander <jens.wiklander@linaro.org>, Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>, Gary R Hook <gary.hook@amd.com>, tee-dev@lists.linaro.org, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 08, 2020 at 12:33:08PM +0530, Thomas, Rijo-john wrote:
> +linux-crypto
> 
> On 07/01/20 8:06 pm, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the memory allocation failure checks on drv_data and
> > amdtee are using IS_ERR rather than checking for a null pointer.
> > Fix these checks to use the conventional null pointer check.
> > 
> > Addresses-Coverity: ("Dereference null return")
> > Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Reviewed-by: Rijo Thomas <Rijo-john.Thomas@amd.com>

This patch needs to be resubmitted to the linux-crypto list for
it to be picked up by patchwork.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
