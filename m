From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 10 Feb 2007 20:11:45 +0000
Subject: Re: [KJ] is there a short form for "memset(blah, 0, len)"?
Message-Id: <Pine.LNX.4.64.0702101504390.5962@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  as a short followup, if you see how many memset() calls are used to
just clear memory:

  $ grep -Er "memset ?\(.*,0 ?,.*\)" * | less

you can see that adding a memzero() call would definitely be useful.
in addition, there are another ton of calls of the form:

  memset(&fpr_final,0, sizeof(fpr_final));

perhaps another simple macro wrapper of the form

  #define structzero(s) memset(&s, 0, sizeof(s))

thoughts?

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
