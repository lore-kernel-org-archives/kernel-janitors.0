From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 21 May 2007 18:26:31 +0000
Subject: [KJ] what's the value of "NORET_TYPE"?
Message-Id: <Pine.LNX.4.64.0705211425310.25535@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  what exactly is the rationale behind the macro NORET_TYPE?

$ grep -r "define.*NORET_TYPE" *
include/linux/ext4_fs.h:# define NORET_TYPE    /**/
include/linux/ext3_fs.h:# define NORET_TYPE    /**/
include/linux/linkage.h:#define NORET_TYPE    /**/
$

  oooooookay, so ... what's up with this?

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
