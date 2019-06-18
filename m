From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Jun 2019 20:55:29 +0000
Subject: Re: [PATCH] mfd: stmfx: Fix an endian bug in stmfx_irq_handler()
Message-Id: <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda> <20190618081645.GM16364@dell>
In-Reply-To: <20190618081645.GM16364@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Amelie Delaunay <amelie.delaunay@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Tue, Jun 18, 2019 at 1:16 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>
> Ideally we can get a review too.

Looks fine to me, but obviously somebody should actually _test_ it too.

              Linus
