From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Wed, 16 Apr 2008 16:41:44 +0000
Subject: Re: cli()/sti() removal
Message-Id: <919fe2b30804160941n7291691eqe474a402b71d7bb9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 14, 2008 at 4:17 PM, Matthew Wilcox <matthew@wil.cx> wrote:
>
> On Mon, Apr 14, 2008 at 03:38:27PM -0400, M. Asselstine wrote:
>  > Looking at Documentation/cli-sti-removal.txt and grepping for these
>  > macros in the kernel tree reveal that things are close to allowing
>  > this task to be completed. I would like to propose that the remainder
>  > of this work be completed, cleaning up documentation and code related
>  > to this deprecation. I am willing to do the work but just wanted to
>  > put a feeler out there to determine if there is any reason not to
>  > proceed. I also wanted to make sure there wasn't anyone else doing
>  > this already.
>
>  People who suggest this usually don't realise just how hard the problem
>  is.  Let's see how we're doing ...
>
I definitely see the complexity and respect it. With some careful
thought and guidance however do you not feel we can finish this up?

>  drivers/atm/nicstar.c:    save_flags(nsdsf); cli();\
>  drivers/atm/nicstar.c:    save_flags(nsdsf); cli();\
>  drivers/atm/nicstar.c:    save_flags(nsdsf); cli();\
>  drivers/isdn/hysdn/boardergo.c:               cli();          /* no further ints */
>  drivers/net/hamradio/dmascc.c:                cli();
>  drivers/net/tulip/xircom_tulip_cb.c:          cli();
>  drivers/net/tulip/xircom_tulip_cb.c:          cli();
>  drivers/net/tulip/xircom_tulip_cb.c:          save_flags(flags); cli();
>  drivers/net/tulip/xircom_tulip_cb.c:    cli();
>  include/asm-frv/system.h:     cli();                                  \
>
>  Wow.  That's a big improvement over where we were.  Just some of the
>  nastiest bits of the kernel still using it ;-)
>
>  ok ... the three occurrences in nicstar look like they can be deleted.
>  Replacing 'restore_flags(nsdsf);' with local_irq_restore(flags) would be
>  a nice touch, but to be honest the generic lockdep code we have these
>  days should do even better, so killing the nicstar NS_DEBUG_SPINLOCKS
>  code would be a good idea.
>
I am thinking this is a good strategy. There is really no need for the
NS_DEBUG_SPINLOCKS code as far as I can tell even any documentation
for NS_DEBUG_SPINLOCKS use seems to of been pulled from the header.

>  boardergo looks like it needs its locking reviewed.  It has the
>  card->hysdn_lock already, so I don't quite understand what the sti()
>  and cli() are doing in ergo_irq_bh()
>
It looks like Thomas Gleixner and Amol Lad did the initial legwork
(2bd7e20e0d24325b0799544bc8105cc57cc8e2aa and
0d9ba869e103d91d471146378ad85bf1fb8e74b4) but a bunch of sti() and one
cli() survived. This is going to be a tough one to finish as I do not
have any way to test it.

>  dmascc appears to be calling cli() while it's already in interrupt
>  context.  If so, it already has the register_lock and so this is
>  unnecessary.  Someone should dig into the driver to verify that this
>  is true.
>
Upon examination the only existing cli()/sti() is found in
start_timer() which as you say is called only when we are already in
an interrupt (scc_isr()) which already has the register_lock with the
exception of one call to start_timer() in scc_send_packet() which
again already has the register_lock. So I think these instances will
be safe to remove.

>  xircom_tulip_cb also has a per-device spinlock.  Again, someone needs to
>  verify why the various places calling cli() aren't grabbing the spinlock.
>
This one looks like it was just neglected and the save_flags();cli()
were just never moved over to
spin_lock_irqsave()/spin_unlock_irqrestore(). Do you not think this
would be a straight forward translation? as it looks like many other
places in the kernel these were done with only compile testing.

>  I actually have a card which I believe to be a xircom_tulip_cb.
>  Unfortunately, it's twice as tall as any cardbus slot I have in any
>  functioning computers here, so I can't even plug it in to check it.
>  I also note that there's a xircom_cb that appears to be replacing
>  xircom_tulip_cb, so maybe deleting xircom_tulip_cb is possible?
>
I wouldn't even know where to start to propose this removal.

There are a few in sound/oss, would these be of interest or is this
code maintained outside of the kernel?

Regards,
Mark

>  --
>  Intel are signing my paycheques ... these opinions are still mine
>  "Bill, look, we understand that you're interested in selling us this
>  operating system, but compare it to ours.  We can't possibly take such
>  a retrograde step."
>
