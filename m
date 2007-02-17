From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 17 Feb 2007 17:22:35 +0000
Subject: [KJ] init_completion() versus INIT_COMPLETION()?
Message-Id: <Pine.LNX.4.64.0702171216490.25283@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702011028400.15512@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702011028400.15512@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  continuing my wanderings thru concurrency land, i'm curious about
whether there is an essential difference between init_completion() and
INIT_COMPLETION()?

  according to linux/completion.h, the fundamental call is:

  static inline void init_completion(struct completion *x)
  {
        x->done = 0;
        init_waitqueue_head(&x->wait);
  }

whereas the INIT_COMPLETION() macro is meant to be used only to
*re-initialize* an already previously-initialized completion:

  #define INIT_COMPLETION(x)      ((x).done = 0)

  but do you really need two forms of that?  would it hurt if
subsequent re-initializations used init_completion()?  a quick count
shows 186 invocations of init_completion(), and only 12 of
INIT_COMPLETION().  that normally suggests to me that the latter
example might be unnecessary.

  in any event, the thought of having two different routines with
different semantics whose names differ only in their case really
creeps me out.

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
