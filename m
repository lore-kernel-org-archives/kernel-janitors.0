From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 15 May 2007 08:05:12 +0000
Subject: [KJ] centralizing all of the types.h content?
Message-Id: <Pine.LNX.4.64.0705150403510.19177@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is there any reason that most of the content of the various
include/asm-*/types.h files couldn't be centralized, perhaps in
include/linux/types.h?

  certainly, a lot of that content looks absolutely identical across
all architectures.

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
