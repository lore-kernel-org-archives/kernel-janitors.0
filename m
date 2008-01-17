From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 17 Jan 2008 15:35:23 +0000
Subject: still lots of ARRAY_SIZE cleanup
Message-Id: <alpine.LFD.1.00.0801171033260.10452@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i'm currently tidying up my cleanup scripts, and there appears to
still be a fair bit of work to do in terms of replacing explicit
expressions with an invocation of the ARRAY_SIZE macro.

  feel free to run:

$ grep -Er "sizeof ?\(?([^\)]+)\)? ?/ ?sizeof ?\(?.*\1.*" .

to see what i'm talking about.  anyone who wants to take that on, feel
free, although i have no idea how much of that has already been
cleaned and is waiting for the next merge window.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
====================================
