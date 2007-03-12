From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 12 Mar 2007 21:59:04 +0000
Subject: [KJ] verifying the need for <linux/moduleparam.h>
Message-Id: <Pine.LNX.4.64.0703121756470.7762@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i just want to clarify something -- if a source file contains no
string of the form "module_param", does it have any need to include
that header file above?

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
