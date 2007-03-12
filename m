From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 12 Mar 2007 12:05:30 +0000
Subject: [KJ] should module.h include moduleparam.h?
Message-Id: <Pine.LNX.4.64.0703120756380.7229@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  quite by accident, i noticed that linux/module.h includes
linux/moduleparam.h, which strikes me as unnecessary since one can
write a module that doesn't accept any parameters so why drag
moduleparam.h into it when you don't need it?

  (love's kernel book even specifically states, on p. 288, "All these
[parameter-related] macros require the inclusion of
<linux/moduleparam.h>."  obviously, that's not true.)

  thoughts?  if module code uses parameters, should it explicitly have
to include moduleparam.h?

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
