From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 19 Jun 2019 05:58:16 +0000
Subject: Re: [PATCH] mfd: stmfx: Fix an endian bug in stmfx_irq_handler()
Message-Id: <20190619055816.GF18371@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda> <20190618081645.GM16364@dell>
 <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
In-Reply-To: <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Amelie Delaunay <amelie.delaunay@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Tue, 18 Jun 2019, Linus Torvalds wrote:

> On Tue, Jun 18, 2019 at 1:16 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> >
> > Ideally we can get a review too.
> 
> Looks fine to me, but obviously somebody should actually _test_ it too.

Amelie, would you be so kind?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
