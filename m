From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 17 Jul 2020 05:59:54 +0000
Subject: Re: [PATCH] crypto: xts: use memmove to avoid overlapped memory copy
Message-Id: <CAMj1kXH9PHNNUMgwNUv8gBJDxs8w5Eta=AouKM7L=hMWNOQ=HQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200716152900.1709694-1-colin.king@canonical.com>
 <CAMj1kXEWyweZ0E3WHthEG9oiOpOS9UxtTB7xskAsF8FeinNg9w@mail.gmail.com> <20200717052139.GB2045@gondor.apana.org.au>
In-Reply-To: <20200717052139.GB2045@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, 17 Jul 2020 at 08:21, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Jul 16, 2020 at 06:56:30PM +0300, Ard Biesheuvel wrote:
> > On Thu, 16 Jul 2020 at 18:29, Colin King <colin.king@canonical.com> wrote:
> > >
> > > From: Colin Ian King <colin.king@canonical.com>
> > >
> > > There is a memcpy that performs a potential overlapped memory copy
> > > from source b to destination b + 1.  Fix this by using the safer
> > > memmove instead.
> > >
> > > Addresses-Coverity: ("Overlapping buffer in memory copy")
> > > Fixes: 8083b1bf8163 ("crypto: xts - add support for ciphertext stealing")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  crypto/xts.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/crypto/xts.c b/crypto/xts.c
> > > index 3565f3b863a6..fa3e6e7b7043 100644
> > > --- a/crypto/xts.c
> > > +++ b/crypto/xts.c
> > > @@ -169,7 +169,7 @@ static int cts_final(struct skcipher_request *req,
> > >                                       offset - XTS_BLOCK_SIZE);
> > >
> > >         scatterwalk_map_and_copy(b, rctx->tail, 0, XTS_BLOCK_SIZE, 0);
> > > -       memcpy(b + 1, b, tail);
> > > +       memmove(b + 1, b, tail);
> >
> > This is a false positive: tail is guaranteed to be smaller than
> > sizeof(*b), so memmove() is unnecessary here.
> >
> > If changing to memcpy(&b[1], &b[0], tail) makes the warning go away, i
> > am fine with it, but otherwise we should just leave it as is.
>
> How about a comment perhaps?
>

Or change it to b[1] = b[0] (assuming the compiler allows struct
assignment in that way). This will always copy XTS_BLOCK_SIZE bytes,
but we have sufficient space, and it is probably more efficient  too
in most cases.


> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
