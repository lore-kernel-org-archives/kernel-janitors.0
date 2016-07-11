From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Jul 2016 06:40:15 +0000
Subject: Re: [patch] crypto: sha256-mb - cleanup a || vs | typo
Message-Id: <CAMuHMdUHD-h=GdSyAXpPiHNrGH46xxsmVpS6Xnqoqa1fYAHD8A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160629144242.GE22818@mwanda> <8538242a-eab7-127e-e47e-26027fee4f6d@zytor.com>
 <1467319339.22178.256.camel@linux.intel.com> <20160701075559.GA11902@gmail.com>
 <20160701092806.GA13424@gondor.apana.org.au> <20160701101329.GA3833@gmail.com>
 <20160708162803.GA29111@linux.intel.com> <20160708164502.GA3064@gondor.apana.org.au>
 <CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com>
In-Reply-To: <CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Tim Chen <tim.c.chen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, the arch/x86 maintainers <x86@kernel.org>, Megha Dey <megha.dey@intel.com>, "Wang, Rui Y" <rui.y.wang@intel.com>, Denys Vlasenko <dvlasenk@redhat.com>, Xiaodong Liu <xiaodong.liu@intel.com>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>

Hi Linus,

On Fri, Jul 8, 2016 at 7:19 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>  (c)
>       // This can be a single line. Or many. Your choice.

> The (c) form is particularly good for things like enum or structure
> member comments at the end of code, where you might want to align
> things up, but the ending comment marker ends up being visually pretty
> distracting (and lining _that_ up is too much make-believe work).

While I'm a fan of the (c) form myself, I became used to not using it for
kernel code. Except for internal comments that are not intended to be sent
out. This works fine, as checkpatch will complain if I ever forget to remove
them while preparing patches.

The alternative would be to teach checkpatch to complain about FIXME, TODO,
and XXX in comments...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
