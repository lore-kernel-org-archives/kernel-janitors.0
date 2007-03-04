From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 04 Mar 2007 17:59:13 +0000
Subject: [KJ] some Kconfig help entries could use some updating
Message-Id: <Pine.LNX.4.64.0703041254120.4898@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  to get networking functioning on my inspiron laptop with a linksys
cardbus PCMCIA card, i need to select:

  Bus options
    PCCARD (PCMCIA/CardBus) support  --->

under which you can find selections for 16-bit PCMCIA support, etc.

  but in addition to the above, under

  Device drivers
    Network device support

you can find "PCMCIA network device support", whose help screen reads:

"Say Y if you would like to include support for any PCMCIA or CardBus
network adapters ..."

  but i already *have* that support from before.  the stuff under the
latter menu entry looks strictly like 16-bit stuff, so it shouldn't be
making reference to cardbus, yes?

  can someone clarify this, and suggest how to make it accurate?

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
