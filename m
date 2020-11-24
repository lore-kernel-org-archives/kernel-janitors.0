From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 24 Nov 2020 11:50:58 +0000
Subject: Re: [PATCH] zlib: define get_unaligned16() only when used
Message-Id: <20201124115058.GA32060@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201124104030.903-1-lukas.bulwahn@gmail.com>
 <CAG48ez1FqJYay1F=LUt84DVHd+k0=gXohwhTnwv=t1sv=hTSjw@mail.gmail.com>
In-Reply-To: <CAG48ez1FqJYay1F=LUt84DVHd+k0=gXohwhTnwv=t1sv=hTSjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jann Horn <jannh@google.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>, kernel-janitors@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

On Tue, Nov 24, 2020 at 12:08:40PM +0100, Jann Horn wrote:
> > Since commit acaab7335bd6 ("lib/zlib: remove outdated and incorrect
> > pre-increment optimization"), get_unaligned16() is only used when
> > !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS.
> >
> > Hence, make CC=clang W=1 warns:
> >
> >   lib/zlib_inflate/inffast.c:20:1:
> >     warning: unused function 'get_unaligned16' [-Wunused-function]
> >
> > Define get_unaligned16() only when it is actually used.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> AFAICS a nicer option would be to "#include <asm/unaligned.h>" and
> then use "get_unaligned", which should automatically do the right
> thing everywhere and remove the need for defining get_unaligned16()
> and checking CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS entirely?

Yes, that is the right thing to do.
