From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 27 May 2007 21:28:05 +0000
Subject: [KJ] replacing old-style "non-seekable" errors with "no_llseek"
Message-Id: <Pine.LNX.4.64.0705271722580.13051@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  based on a discussion of lseek() here:

http://lwn.net/Articles/96662/

it appears that an old-style way of specifying that a device was
non-seekable:

    loff_t my_llseek(struct file *file, loff_t offset, int whence)
    {
        return -ESPIPE;    /* Not seekable */
    }

can be rewritten more cleanly using the no_llseek() helper routine,
and just assigning no_llseek to the llseek member of the
file_operations struct, as in:

    .llseek = no_llseek

and deleting the old routine.  am i reading that correctly?  or is
there more to it than that?

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
