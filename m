From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 04 May 2007 07:48:52 +0000
Subject: [KJ] what's the point of all those "#if[n]def __KERNEL__"
Message-Id: <Pine.LNX.4.64.0705040337450.19670@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  (no, i'm not being an idiot.  read on.)

  i'm well aware that the point of the conditional __KERNEL__
directives is to identify header file content that isn't appropriate
for userspace, so it can be stripped out when running "make
headers_install".  but is there any *other* purpose to that check?
that is, if a header file is not being exported to userspace, is there
any point to having a test of that sort?

  i'm only asking because i was poking around and noticed that
lots of header files contain a check of that sort that aren't marked
for export to userspace.  for example. some arch/ppc headers:

$ grep -r "#if.*__KERNEL__" arch/ppc
arch/ppc/platforms/mvme5100.h:#ifdef __KERNEL__
arch/ppc/platforms/mbx.h:#ifdef __KERNEL__
arch/ppc/platforms/pq2ads.h:#ifdef __KERNEL__
arch/ppc/platforms/tqm8xx.h:#ifdef __KERNEL__
arch/ppc/platforms/ivms8.h:#ifdef __KERNEL__
... snip ...

those headers certainly don't get anywhere near userspace, so what
exactly are they testing for?  i'm just curious.

rday

p.s.  just to clarify something about "make headers_install", as i
understand it, headers that are listed in Kbuild files with
"headers-y" are exported as is, while those listed with "unifdef-y" ar
first unifdef'ed, then exported.  is that correct?

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
