From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 22 Feb 2007 21:13:31 +0000
Subject: [KJ] how many real time clocks do we need?
Message-Id: <Pine.LNX.4.64.0702221611400.6794@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  just poking around the drivers/char directory, and noticed the
existence of both the RTC real-time clock, and the GEN_RTC real-time
clock in the Kconfig file.

  is there still a compelling need to be supporting *both* of those?
just curious.

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
