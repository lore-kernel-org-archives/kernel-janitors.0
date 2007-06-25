From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 25 Jun 2007 13:40:48 +0000
Subject: [KJ] any value in cleaning out those hard-coded constants?
Message-Id: <Pine.LNX.4.64.0706250935210.4866@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  it's not like it's a big issue, but i'm wondering if it's worth
defining a project on the wiki that starts converting some of those
hard-coded constants to their macro forms as defined in kernel.h:

#define INT_MAX         ((int)(~0U>>1))
#define INT_MIN         (-INT_MAX - 1)
#define UINT_MAX        (~0U)
#define LONG_MAX        ((long)(~0UL>>1))
#define LONG_MIN        (-LONG_MAX - 1)
#define ULONG_MAX       (~0UL)
#define LLONG_MAX       ((long long)(~0ULL>>1))
#define LLONG_MIN       (-LLONG_MAX - 1)
#define ULLONG_MAX      (~0ULL)

  naturally, the above doesn't mean that every single occurrence of,
say, "~0ULL" should be replaced by "ULLONG_MAX".  i'm sure it would be
context dependent, but there certainly are enough instances of just
that one constant:

  $ grep -rw "~0ULL" *

that you'd think some of them would make more sense as ULLONG_MAX.
the same might be said of this single macro:

#define STACK_MAGIC     0xdeadbeef

  $ grep -ir deadbeef *

certainly, many of those don't correspond to "stack magic", but surely
some of them do.  it's all just a thought.

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
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
