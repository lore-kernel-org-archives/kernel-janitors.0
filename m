From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 28 Apr 2008 18:41:48 +0000
Subject: Re: cli()/sti() removal
Message-Id: <919fe2b30804281141l403dfa86gb9d5b3c989d08b4d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Apr 16, 2008 at 1:41 PM, M. Asselstine <asselsm@mcmaster.ca> wrote:
> On Wed, Apr 16, 2008 at 12:55 PM, Matthew Wilcox <matthew@wil.cx> wrote:
[...]
>  >  > >  boardergo looks like it needs its locking reviewed.  It has the
>  >  > >  card->hysdn_lock already, so I don't quite understand what the sti()
>  >  > >  and cli() are doing in ergo_irq_bh()
>  >  > >
>  >  > It looks like Thomas Gleixner and Amol Lad did the initial legwork
>  >  > (2bd7e20e0d24325b0799544bc8105cc57cc8e2aa and
>  >  > 0d9ba869e103d91d471146378ad85bf1fb8e74b4) but a bunch of sti() and one
>  >  > cli() survived. This is going to be a tough one to finish as I do not
>  >  > have any way to test it.
>  >
>  >  I don't think anyone else does either.  It's going to require careful
>  >  analysis of the driver to check they're simply obsolete.  It might be
>  >  worth asking Thomas and Amol why they were left (it may be a simple
>  >  oversight).
>  Yep a simple email to them might provide an answer or at minimum some insight.
>
I have analyzed this driver for more time that I am willing to admit
(thankfully my EeePC allows me to spend this time while in transit on
the bus). I do not see any use for the cli()/sit() calls in the bottom
half handler as the register IO is protected by the spinlock and
somewhat by card->hw_lock. And as for the other three sti() calls
found in the various board bringup functions I also see no need as
there is no matching disabling of interrupts anywhere in the driver. I
really wish I had access to this hardware so I could cook up a patch
and try things out.

Mark

[...]
