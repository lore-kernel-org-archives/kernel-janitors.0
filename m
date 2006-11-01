From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 01 Nov 2006 19:08:46 +0000
Subject: [KJ] atomic variables and "volatility"
Message-Id: <Pine.LNX.4.64.0611011355080.5454@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  since i'm getting the impression that the LKML is not the right
place for discussions like this, i'm going to move it to the KJ list.

  i'm curious about possible redundancy or confusing code in the
numerous atomic.h header files that define atomic variables for each
architecture.  the first issue is that there are two different
typedefs for an "atomic_t" depending on the architecture -- one of:

	typedef struct { int counter; } atomic_t;
	typedef struct { volatile int counter; } atomic_t;
                         ^^^^^^^^

  the "volatile" type qualifier is documented in one of those header
files thusly:

  "Counter is volatile to make sure gcc doesn't try to be clever
   and move things around on us."

that makes sense, but some of the architectures define that typedef
*with* a volatile, and some don't.  is this really something that is
architecture-dependent?  or is it more a compiler-dependent thing?
and would there be any possible harm in simply using "volatile"
everywhere?  surely that wouldn't break existing code, would it?  but
there's more.

  in include/asm-v850/atomic.h, atomic_t is defined as:

	typedef struct { int counter; } atomic_t;

which would suggest that there's no need to qualify this as
"volatile".  but if you look further down in that same header file,
note that some routines that accept an argument of a pointer to such a
struct declare it as "volatile" in the parameter list:

  static inline int atomic_add_return (int i, volatile atomic_t *v)
                                              ^^^^^^^^
  static __inline__ int atomic_sub_return (int i, volatile atomic_t *v)
                                                  ^^^^^^^^
  static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
  static inline int atomic_add_unless(atomic_t *v, int a, int u)

so what's going on here?  if you omit the "volatile" type qualifier
from the struct member itself, is it then equivalent to declare a
function parameter as "volatile atomic_t* v" to get the same effect?
and if it is, wouldn't it just be simpler to add "volatile" to the
struct member and drop that qualifier from the parameter list?
and is there a problem that only *some* of those inline functions
declare that parameter as "volatile"?

  in a nutshell, is there any reason to not just add "volatile" into
every typedef, so it could then be dropped from all those parameter
lists?

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
