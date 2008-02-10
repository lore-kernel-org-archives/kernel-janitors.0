From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 10 Feb 2008 11:39:58 +0000
Subject: more cleanup -- using FIELD_SIZEOF() macro
Message-Id: <alpine.LFD.1.00.0802100637001.9465@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  the header file include/linux/kernel.h defines:

  #define FIELD_SIZEOF(t, f) (sizeof(((t*)0)->f))

which is a much more pleasant way of calculating the size of a
structure member.  and there's plenty of places in the tree where that
change can be made, which you can see if you search for the
appropriate pattern:

$ grep -Er "sizeof ?\( ?\( ?\([^\*]*[^ ] ?\*\) ?0 ?\)->[^\)]+\)" *

rday
--


====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
====================================
