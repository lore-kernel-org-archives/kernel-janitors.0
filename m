From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 14 Apr 2008 20:17:50 +0000
Subject: Re: cli()/sti() removal
Message-Id: <20080414201750.GB11962@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 14, 2008 at 03:38:27PM -0400, M. Asselstine wrote:
> Looking at Documentation/cli-sti-removal.txt and grepping for these
> macros in the kernel tree reveal that things are close to allowing
> this task to be completed. I would like to propose that the remainder
> of this work be completed, cleaning up documentation and code related
> to this deprecation. I am willing to do the work but just wanted to
> put a feeler out there to determine if there is any reason not to
> proceed. I also wanted to make sure there wasn't anyone else doing
> this already.

People who suggest this usually don't realise just how hard the problem
is.  Let's see how we're doing ...

drivers/atm/nicstar.c:    save_flags(nsdsf); cli();\
drivers/atm/nicstar.c:    save_flags(nsdsf); cli();\
drivers/atm/nicstar.c:    save_flags(nsdsf); cli();\
drivers/isdn/hysdn/boardergo.c:               cli();          /* no further ints */
drivers/net/hamradio/dmascc.c:                cli();
drivers/net/tulip/xircom_tulip_cb.c:          cli();
drivers/net/tulip/xircom_tulip_cb.c:          cli();
drivers/net/tulip/xircom_tulip_cb.c:          save_flags(flags); cli();
drivers/net/tulip/xircom_tulip_cb.c:    cli();
include/asm-frv/system.h:     cli();                                  \

Wow.  That's a big improvement over where we were.  Just some of the
nastiest bits of the kernel still using it ;-)

ok ... the three occurrences in nicstar look like they can be deleted.
Replacing 'restore_flags(nsdsf);' with local_irq_restore(flags) would be
a nice touch, but to be honest the generic lockdep code we have these
days should do even better, so killing the nicstar NS_DEBUG_SPINLOCKS
code would be a good idea.

boardergo looks like it needs its locking reviewed.  It has the
card->hysdn_lock already, so I don't quite understand what the sti()
and cli() are doing in ergo_irq_bh()

dmascc appears to be calling cli() while it's already in interrupt
context.  If so, it already has the register_lock and so this is
unnecessary.  Someone should dig into the driver to verify that this
is true.

xircom_tulip_cb also has a per-device spinlock.  Again, someone needs to
verify why the various places calling cli() aren't grabbing the spinlock.

I actually have a card which I believe to be a xircom_tulip_cb.
Unfortunately, it's twice as tall as any cardbus slot I have in any
functioning computers here, so I can't even plug it in to check it.
I also note that there's a xircom_cb that appears to be replacing
xircom_tulip_cb, so maybe deleting xircom_tulip_cb is possible?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
