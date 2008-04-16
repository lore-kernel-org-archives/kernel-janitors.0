From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Wed, 16 Apr 2008 17:41:12 +0000
Subject: Re: cli()/sti() removal
Message-Id: <919fe2b30804161041q71179b29h65da6b10e364235@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Apr 16, 2008 at 12:55 PM, Matthew Wilcox <matthew@wil.cx> wrote:
> On Wed, Apr 16, 2008 at 12:41:44PM -0400, M. Asselstine wrote:
>  > I definitely see the complexity and respect it. With some careful
>  > thought and guidance however do you not feel we can finish this up?
>
>  I do, now the task is so small ;-)
>
>
>  > >  ok ... the three occurrences in nicstar look like they can be deleted.
>  > >  Replacing 'restore_flags(nsdsf);' with local_irq_restore(flags) would be
>  > >  a nice touch, but to be honest the generic lockdep code we have these
>  > >  days should do even better, so killing the nicstar NS_DEBUG_SPINLOCKS
>  > >  code would be a good idea.
>  > >
>  > I am thinking this is a good strategy. There is really no need for the
>  > NS_DEBUG_SPINLOCKS code as far as I can tell even any documentation
>  > for NS_DEBUG_SPINLOCKS use seems to of been pulled from the header.
>
>  We're in agreement then.  Please propose a patch.
>
Will do, tonight hopefully, depends on how the hockey game goes.

>
>  > >  boardergo looks like it needs its locking reviewed.  It has the
>  > >  card->hysdn_lock already, so I don't quite understand what the sti()
>  > >  and cli() are doing in ergo_irq_bh()
>  > >
>  > It looks like Thomas Gleixner and Amol Lad did the initial legwork
>  > (2bd7e20e0d24325b0799544bc8105cc57cc8e2aa and
>  > 0d9ba869e103d91d471146378ad85bf1fb8e74b4) but a bunch of sti() and one
>  > cli() survived. This is going to be a tough one to finish as I do not
>  > have any way to test it.
>
>  I don't think anyone else does either.  It's going to require careful
>  analysis of the driver to check they're simply obsolete.  It might be
>  worth asking Thomas and Amol why they were left (it may be a simple
>  oversight).
Yep a simple email to them might provide an answer or at minimum some insight.

>
>
>  > >  dmascc appears to be calling cli() while it's already in interrupt
>  > >  context.  If so, it already has the register_lock and so this is
>  > >  unnecessary.  Someone should dig into the driver to verify that this
>  > >  is true.
>  >
>  > Upon examination the only existing cli()/sti() is found in
>  > start_timer() which as you say is called only when we are already in
>  > an interrupt (scc_isr()) which already has the register_lock with the
>  > exception of one call to start_timer() in scc_send_packet() which
>  > again already has the register_lock. So I think these instances will
>  > be safe to remove.
>
>  Great!  Please send a patch.
>
Will do.

>
>  > >  xircom_tulip_cb also has a per-device spinlock.  Again, someone needs to
>  > >  verify why the various places calling cli() aren't grabbing the spinlock.
>  >
>  > This one looks like it was just neglected and the save_flags();cli()
>  > were just never moved over to
>  > spin_lock_irqsave()/spin_unlock_irqrestore(). Do you not think this
>  > would be a straight forward translation? as it looks like many other
>  > places in the kernel these were done with only compile testing.
>
>  Compile testing and a great deal of thinking.  For example, outl_CSR6() is
>  called from xircom_init_one() a few lines before we call spin_lock_init(),
>  so grabbing the spinlock in outl_CSR6() would cause a lockup.  Also, the
>  device isn't open at this point, so the interrupt routine can't be
>  called.
>
>  But simply deleting 'cli()' might cause trouble when it's called from,
>  for example xircom_tx_timeout().
>
Good thoughts. I will have to dig deeper into this.

>
>  > There are a few in sound/oss, would these be of interest or is this
>  > code maintained outside of the kernel?
>
>  I think you're wrong:
>
You think correctly. Silly me I should of dove deeper.

>  $ grep -wr cli sound
>  sound/oss/dmabuf.c:/* No kernel lock - DMAbuf_activate_recording protected by global cli/sti */
>  sound/oss/midibuf.c:                    /* yes, think the same, so I removed the cli() brackets
>  sound/oss/midibuf.c:                    /* yes removed the cli() brackets again
>  sound/oss/midi_synth.c: cli();
>
>  Initially, that looks like only one user, but examining the context:
>
>         /* save_flags(flags);
>         cli();
>         don't know against what irqhandler to protect*/
>
>  it's actually commented out.  So I don't see any users in sound/oss.
>
>  --
>
>
> Intel are signing my paycheques ... these opinions are still mine

BTW WindRiver pays mine :).

Mark

>  "Bill, look, we understand that you're interested in selling us this
>  operating system, but compare it to ours.  We can't possibly take such
>  a retrograde step."
>
