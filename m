From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 01 Feb 2007 15:32:48 +0000
Subject: [KJ] init_completion() versus INIT_COMPLETION()?
Message-Id: <Pine.LNX.4.64.0702011028400.15512@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i just noticed that there are two "init completion" routines defined
in include/linux/completion.h:

...
static inline void init_completion(struct completion *x)
{
        x->done = 0;
        init_waitqueue_head(&x->wait);
}
...
#define INIT_COMPLETION(x)      ((x).done = 0)
...

  obviously, both zero the "done" member, but the former also
initializes the wait queue.  is there some rationale for the existence
of that simpler macro?  the function seems like the more reasonable
and safer of the two.

  also the former is far more commonly used:

$ grep -rw init_completion . | wc -l
186
$ grep -rw INIT_COMPLETION . | wc -l
12

  was INIT_COMPLETION deprecated in favour of the inline function?  or
what?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
