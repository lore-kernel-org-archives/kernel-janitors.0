From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 04 Apr 2008 13:18:45 +0000
Subject: any value to numerous checks of "#ifdef __GNUC__"?
Message-Id: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  there are numerous header files that contain a check of the form

    #ifdef __GNUC__

but <linux/compiler.h> already insists on a GNU C-flavoured compiler:

#if __GNUC__ >= 4
# include <linux/compiler-gcc4.h>
#elif __GNUC__ = 3 && __GNUC_MINOR__ >= 2
# include <linux/compiler-gcc3.h>
#else
# error Sorry, your compiler is too old/not recognized.
#endif

  so is there any point in keeping all those checks around?  is it
even remotely feasible that the kernel might someday support a non-GNU
C compiler, given the numerous gcc extensions that are used?

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
