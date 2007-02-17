From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 17 Feb 2007 12:48:10 +0000
Subject: [KJ] using "mutexes" in place of semaphores
Message-Id: <Pine.LNX.4.64.0702170735460.23474@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  another possible aesthetic cleanup is to replace the use of general
semaphores that are initialized to 1 with the simpler reference to an
actual "mutex" (since, after all, that's what mutexes are there for).

  there's a small number of semaphore initializations of the form
"sema_init(&sem, 1)" that could be rewritten as the simpler
"init_MUTEX(&sem)".  in some places, the name of the semaphore itself
makes it clear that it's a mutex anyway, such as:

  drivers/scsi/megaraid/megaraid_sas.c: sema_init(&instance->aen_mutex, 1);

a quick count shows that there's only a couple dozen instances of
calling sema_init() with a count of 1, while there are many more calls
of init_MUTEX() in the tree, suggesting that init_MUTEX() really is
the preferred standard.

  thoughts?  is this worth it?

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
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
