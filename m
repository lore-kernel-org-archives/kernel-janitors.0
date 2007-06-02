From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 02 Jun 2007 16:48:39 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <Pine.LNX.4.64.0706021239160.10488@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


andi:

  some thoughts on how much of the "#if 0" stuff can be removed.
first, in a lot of cases, there's little you can do.  there will be
some code that has been commented out, with no indication as to why
that was done.  if you're lucky, you might be able to recognize that
the "removed" code represents a clearly deprecated or obsolete kernel
construct, in which case you can certainly take a shot at putting
together a patch and just emailing it offline to the respective
subsystem maintainer.

  i've had good luck with that -- if you're not sure about the patch,
there's no point posting it to the whole list, just send it to the
maintainer and ask for some feedback.  in some cases, they'll just
add it to their local tree and you're done.

  in other cases, there's obviously something weird going on and, if
you want to follow up, you might need to do some detective work.  as
an example, consider this snippet from
arch/blackfin/oprofile/common.c:

...
static void op_bfin_shutdown(void)
{
#if 0
        /* what is the difference between shutdown and stop? */
#endif
}
...
static void op_bfin_stop(void)
{
        mutex_lock(&pfmon_lock);
        if (pfmon_enabled) {
                model->stop();
                pfmon_enabled = 0;
        }
        mutex_unlock(&pfmon_lock);
}
...

  i don't know -- what *is* the difference?  you'd think the official
blackfin maintainer should know something like that.  and if you grep
under arch/blackfin, it certainly seems like no one is terribly
interested in that routine (at least under that directory):

$ grep -rw shutdown *
mach-common/ints-priority-dc.c: .shutdown = bf561_gpio_irq_shutdown
mach-common/ints-priority-sc.c: .shutdown = bfin_gpio_irq_shutdown
oprofile/common.c:      /* what is the difference between shutdown and stop? */
oprofile/common.c:      ops->shutdown = op_bfin_shutdown;

  however, without that particular system, it's tough to compile test
a removal.  in cases like that, a short email to one of the
maintainers might clear things up.

  there's no one formula for this sort of cleanup, and it's typically
compounded by the fact that developers are outrageously possessive of
their code, even if it's years old and rotting.  best advice:  just
start perusing and pick something that looks obvious.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
