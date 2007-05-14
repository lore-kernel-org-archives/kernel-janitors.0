From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 14 May 2007 20:03:15 +0000
Subject: [KJ] what's the current story on cli()/sti()/save_flags() ...?
Message-Id: <Pine.LNX.4.64.0705141556360.15521@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i'm trying to get straight in my mind what the current situation is
regarding the deprecation/removal status of all of:

  * cli()
  * sti()
  * save_flags()
  * save_flags_cli()
  * restore_flags()

  according to Documentation/cli-sti-removal.txt, all of those should
have been gone long ago:

"... to make the transition easier, we've still kept the cli(), sti(),
save_flags(), save_flags_cli() and restore_flags() macros defined
on UP systems - but their usage will be phased out until 2.6 is
released."

but there's still a fair bit of that stuff in the kernel source tree.
the file Documentation/spinlocks.txt also talks about replacing:

        unsigned long flags;

        save_flags(flags); cli();
         ... critical section ...
        restore_flags(flags);

with something like:

   spinlock_t xxx_lock = SPIN_LOCK_UNLOCKED;


        unsigned long flags;

        spin_lock_irqsave(&xxx_lock, flags);
        ... critical section here ..
        spin_unlock_irqrestore(&xxx_lock, flags);

so, theoretically, what's the goal WRT to those allegedly deprecated
routines?  are they supposed to be gone by now or what?

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
