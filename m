From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 24 Nov 2020 11:56:30 +0000
Subject: Re: [PATCH] zlib: define get_unaligned16() only when used
Message-Id: <CAK8P3a2rVKQ5UHzcycu=0QpjtSQ3Nne4Xre-7+V27vmCe9yfKg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201124104030.903-1-lukas.bulwahn@gmail.com> <CAG48ez1FqJYay1F=LUt84DVHd+k0=gXohwhTnwv=t1sv=hTSjw@mail.gmail.com>
 <20201124115058.GA32060@infradead.org>
In-Reply-To: <20201124115058.GA32060@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Jann Horn <jannh@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>, kernel-janitors@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

On Tue, Nov 24, 2020 at 12:51 PM Christoph Hellwig <hch@infradead.org> wrote:
> On Tue, Nov 24, 2020 at 12:08:40PM +0100, Jann Horn wrote:
> > > Since commit acaab7335bd6 ("lib/zlib: remove outdated and incorrect
> > > pre-increment optimization"), get_unaligned16() is only used when
> > > !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS.
> > >
> > > Hence, make CC=clang W=1 warns:
> > >
> > >   lib/zlib_inflate/inffast.c:20:1:
> > >     warning: unused function 'get_unaligned16' [-Wunused-function]
> > >
> > > Define get_unaligned16() only when it is actually used.
> > >
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >
> > AFAICS a nicer option would be to "#include <asm/unaligned.h>" and
> > then use "get_unaligned", which should automatically do the right
> > thing everywhere and remove the need for defining get_unaligned16()
> > and checking CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS entirely?
>
> Yes, that is the right thing to do.

It's possible that this didn't work when the code was originally added:
The decompressor functions are called from the compressed boot path,
which is a bit limited regarding which headers it can include, at least
on some architectures.

I would recommend test-building this for all architectures that include
../../../../lib/decompress_inflate.c from their boot code.

     Arnd
