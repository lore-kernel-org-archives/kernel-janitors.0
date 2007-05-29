From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 29 May 2007 15:55:55 +0000
Subject: [KJ] why does struct inodes_stat_t include "int dummy[5]"?
Message-Id: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  from include/linux/fs.h:

struct inodes_stat_t {
        int nr_inodes;
        int nr_unused;
        int dummy[5];    <---- ?????????
};

  does that array actually have a purpose?

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
