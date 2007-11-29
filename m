From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 29 Nov 2007 08:44:05 +0000
Subject: can we use "__printf(a,b)" in kernel.h?
Message-Id: <alpine.LFD.0.9999.0711290342130.9694@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  is there any reason we can't replace all those explicit
"__attribute__ format printf" references in kernel.h with the shorter
"__printf" equivalent?  after all, kernel.h has already included
compiler-gcc.h at that point, so the shorter form is available.

rday

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
