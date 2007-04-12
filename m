From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 12 Apr 2007 18:49:33 +0000
Subject: [KJ] how dead is legacy power management?
Message-Id: <Pine.LNX.4.64.0704121443290.30803@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  while poking around looking at power management, i noticed that
"Legacy Power Management API" is listed as "(DEPRECATED)" while, in
addition, its help screen says that it has been "obsoleted by the
driver model".  that kind of suggests that it's a candidate for
removal, no?

  running

  $ grep -rw CONFIG_PM_LEGACY *

shows the only meaningful references here:

drivers/acpi/bus.c:#ifdef CONFIG_PM_LEGACY
drivers/serial/68328serial.c:#ifdef CONFIG_PM_LEGACY
drivers/serial/68328serial.c:#endif /* CONFIG_PM_LEGACY */
drivers/serial/68328serial.c:#ifdef CONFIG_PM_LEGACY

  if, outside of actual power management, there's just one driver that
needs it, maybe it's that time.

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
