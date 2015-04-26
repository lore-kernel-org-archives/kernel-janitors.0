From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sun, 26 Apr 2015 06:50:39 +0000
Subject: Re: [PATCH] crypto: sha1-mb - Remove pointless cast
Message-Id: <20150426065039.GA13536@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429783930-7318-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1429783930-7318-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Firo Yang <firogm@gmail.com>
Cc: kernel-janitors@vger.kernel.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, tim.c.chen@linux.intel.com, smueller@chronox.de, minipli@googlemail.com, dan.carpenter@oracle.com, ameenali023@gmail.com, fengguang.wu@intel.com, linux-crypto@vger.kernel.org

On Thu, Apr 23, 2015 at 06:12:10PM +0800, Firo Yang wrote:
> Since kzalloc() returns a void pointer, we don't need to cast the
> return value in arch/x86/crypto/sha-mb/sha1_mb.c::sha1_mb_mod_init().
> 
> Signed-off-by: Firo Yang <firogm@gmail.com>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
