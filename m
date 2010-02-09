From: "Linus Walleij" <linus.walleij@stericsson.com>
Date: Tue, 09 Feb 2010 21:54:36 +0000
Subject: RE: [PATCH 6/11] drivers/dma: Correct NULL test
Message-Id: <A6D19A13FE030A409EC4362C172E091F0E79D583@eseldmw101.eemea.ericsson.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1002060943220.8092@ask.diku.dk> <e9c3a7c21002081307j567413adg6ed8aa04bf153e41@mail.gmail.com>
In-Reply-To: <e9c3a7c21002081307j567413adg6ed8aa04bf153e41@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

[Dan/Julia]

> On Sat, Feb 6, 2010 at 1:43 AM, Julia Lawall <julia@diku.dk> wrote:
> > From: Julia Lawall <julia@diku.dk>
> >
> > cohd_fin has already been verified not to be NULL, so the 
> argument to
> > BUG_ON cannot be true.

Acked-by: Linus Walleij <linus.walleij@stericsson.com>

BTW I've got some more DMA patches for COH 901 318 and even
a client using it cooking, if you apply this I'll happily
rebase as soon as I can see it in -next.

Linus Walleij
