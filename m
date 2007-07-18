From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 18 Jul 2007 17:16:53 +0000
Subject: any (current) value to EXPORT_UNUSED_SYMBOL[_GPL]?
Message-Id: <Pine.LNX.4.64.0707181312470.643@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i just noticed the option to be able to export unused or obsolete
symbols, but it's currently totally unused, and the help for that
menuconfig option reads (in part):

"Unused but exported symbols make the kernel needlessly bigger.  For
that reason most of these unused exports will soon be removed.  This
option is provided temporarily to provide a transition period in case
some external kernel module needs one of these symbols anyway."

  well, it seems that they've all been removed.  so should this
temporary hack be tossed?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
