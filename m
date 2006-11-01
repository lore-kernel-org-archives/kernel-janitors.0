From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 01 Nov 2006 19:24:32 +0000
Subject: [KJ] "__inline__":  historical cruft?
Message-Id: <Pine.LNX.4.64.0611011419540.5705@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  and while poking around the various atomic.h files, i noticed that
some of those header files declare their static functions as "inline",
while others use "__inline__", while yet others needlessly use a
mixture of *both* for no apparent reason.

  is there any compelling reason to not just start removing all the
worthless historical baggage from the source tree, beginning with
"__inline__"?  surely that can't have any value these days, can it?

rday

p.s.  a quick recursive grep and line count shows:

  inline:  	22579
  __inline__:	 1741

which suggests that "__inline__" has clearly fallen out of favour, or
something to that effect.  time to give it a quick burial.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
