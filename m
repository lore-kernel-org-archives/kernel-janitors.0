From: Ingo Molnar <mingo@kernel.org>
Date: Fri, 01 Jul 2016 10:13:30 +0000
Subject: Re: [patch] crypto: sha256-mb - cleanup a || vs | typo
Message-Id: <20160701101329.GA3833@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160629144242.GE22818@mwanda>
 <8538242a-eab7-127e-e47e-26027fee4f6d@zytor.com>
 <1467319339.22178.256.camel@linux.intel.com>
 <20160701075559.GA11902@gmail.com>
 <20160701092806.GA13424@gondor.apana.org.au>
In-Reply-To: <20160701092806.GA13424@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Megha Dey <megha.dey@intel.com>, "Wang, Rui Y" <rui.y.wang@intel.com>, Denys Vlasenko <dvlasenk@redhat.com>, Xiaodong Liu <xiaodong.liu@intel.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Herbert Xu <herbert@gondor.apana.org.au> wrote:

> On Fri, Jul 01, 2016 at 09:55:59AM +0200, Ingo Molnar wrote:
> >
> > Plus:
> >=20
> > > > > =A0		/* Compute how many bytes to copy from user buffer into
> > > > > =A0		=A0* extra block
> > > > > =A0		=A0*/
> >=20
> > please use the customary (multi-line) comment style:
>=20
> This is the customary comment style of the networking stack and
> the crypto API.  So please don't change it.

Guys, do you even read your own code??

That 'standard' is not being enforced consistently at all. Even in this ver=
y=20
series there's an example of that weird comment not being followed:

+++ b/arch/x86/crypto/sha1-mb/sha1_mb.c
@@ -304,7 +304,7 @@ static struct sha1_hash_ctx *sha1_ctx_mgr_submit(struct=
 sha1_ctx_mgr *mgr,
                /*
                 * Compute how many bytes to copy from user buffer into
                 * extra block

See how this comment block uses the standard coding style, while the next p=
atch=20
has this weird coding style:

-       if ((ctx->partial_block_buffer_length) | (len < SHA256_BLOCK_SIZE))=
 {
+       if ((ctx->partial_block_buffer_length) || (len < SHA256_BLOCK_SIZE)=
) {
                /* Compute how many bytes to copy from user buffer into
                 * extra block
                 */

The networking code's "exceptionalism" regarding the standard comment style=
 is=20
super distracting and in this particular example it resulted in:

 - inconsistent comment styles next to each other,
 - the questionable '|' pattern hiding right next to:
 - pointless parantheses around the (ctx->partial_block_buffer_length),
 - which field name is also a misnomer.

So anyone doing security review of that weird '|' pattern first has to figu=
re out=20
whether the 4 ugly code patterns amount to a security problem or not...

One thing that is more harmful that any of the coding styles: the inconsist=
ent=20
coding style used by this code.

Btw., as a historic reference, there is nothing sacred about the 'networkin=
g=20
comments coding style': I was there (way too many years ago) when that comm=
ent=20
style was introduced by Alan Cox's first TCP/IP code drop, and it was littl=
e more=20
than just a random inconsistency that people are now treating as gospel...

Thanks,

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
