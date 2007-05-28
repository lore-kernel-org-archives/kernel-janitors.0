From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 28 May 2007 20:35:26 +0000
Subject: [KJ] the standard for including header files?
Message-Id: <Pine.LNX.4.64.0705281627190.15720@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  in my travels thru the source tree, i've noticed header files like
the following (include/linux/ioctl.h):

#ifndef _LINUX_IOCTL_H
#define _LINUX_IOCTL_H

#include <asm/ioctl.h>

#endif /* _LINUX_IOCTL_H */

  fair enough -- it simply includes the asm-specific form of that
header file, so one can include either of those two header files to
get exactly the same effect.

  but what's the *correct* header file to include?  *at the moment*,
those two includes are equivalent but nothing says they have to be
that way forever.  perhaps some day some arch-independent content is
added to linux/ioctl.h.  if that happens, those files that include
*that* header file will pick up the additional content, while files
that instead include asm/ioctl.h won't.

  it may be that this will never be a problem, but there certainly is
some variety of who is including what in the source tree:

$ grep -r "include.*linux/ioctl.h" * | wc -l
131
$ grep -r "include.*asm/ioctl.h" * | wc -l
40

  there are a few other header files like that:  user.h, param.h, etc.
i'm just wondering what the standard is.

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
