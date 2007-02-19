From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 19 Feb 2007 14:04:00 +0000
Subject: [KJ] a kernel config-related possible cleanup
Message-Id: <Pine.LNX.4.64.0702190859190.3195@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  here's something that's fairly simple but would be handy.  if you
run "make menuconfig", and go under

  Device drivers
    Network device support

you can see that, if you select either of, say:

  Ethernet (10 or 100Mbit) --->
  Token ring devices --->

you can conveniently de-activate *all* of those selections with a
single click at the top of the menu.

  but you *can't* do that in other submenus, like

  Ethernet (1000 Mbit)
  Ethernet (10000 Mbit)

i think all submenus like that should have an all-encompassing
first-line selection, which would involve inventing new config
keywords, such as ETHERNET_1GBIT and ETHERNET_10GBIT, or something
like that.

  anyone want to run thru the menus and submit patches where
appropriate?

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
