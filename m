From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 07 Nov 2007 09:44:21 +0000
Subject: still necessary to test for __GLIBC__ < 2??
Message-Id: <Pine.LNX.4.64.0711070442490.25840@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i just noticed a number of tests in some include files of the form:

#if defined(__KERNEL__) || !defined(__GLIBC__) || (__GLIBC__ < 2)

is testing __GLIBC__ < 2 still a valid check?  can you still build the
kernel against that version of glibc?  just curious.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
