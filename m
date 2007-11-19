From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 19 Nov 2007 20:02:05 +0000
Subject: does the current kernel support __GLIBC__ < 2?
Message-Id: <alpine.LFD.0.9999.0711191500540.32654@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i noticed a few tests in some of the header files checking for
__GLIBC__ < 2.  is building the current version of the kernel even
feasible with that old a version of glibc?

rday

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
