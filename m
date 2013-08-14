From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 14 Aug 2013 10:44:28 +0000
Subject: Re: [PATCH 1/2] arch/x86/crypto/camellia_glue.c: adjust code alignment
Message-Id: <alpine.DEB.2.02.1308141243520.2257@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376156077-6208-1-git-send-email-Julia.Lawall@lip6.fr> <1376156077-6208-2-git-send-email-Julia.Lawall@lip6.fr> <20130814104122.GA12970@gondor.apana.org.au>
In-Reply-To: <20130814104122.GA12970@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.hengli.com.au>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org



On Wed, 14 Aug 2013, Herbert Xu wrote:

> On Sat, Aug 10, 2013 at 07:34:36PM +0200, Julia Lawall wrote:
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > Adjust alignment in automatically generated code.  If this code
> > will not be regenerated in the future, it may as well look nice.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> > This patch was generated from the result of the previous one, which
> > replaced commas by semicolons.
>
> Please fold this patch into the original one.

OK, I will do that.  There is a second patch for another camellia file
that is in the same situation.  I will send new versions of both.

thanks,
julia
