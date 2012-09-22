From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 22 Sep 2012 00:41:11 +0000
Subject: [time:fortglx/3.7/time 11/13] include/linux/timekeeper_internal.h:101:1: sparse: missing identifier
Message-Id: <20120922004111.GH5959@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi John,

FYI, there are new sparse warnings show up in

tree:   git://git.linaro.org/people/jstultz/linux.git fortglx/3.7/time
head:   f9bb3ff13c4701ee6242ec4b4ef0cbc71d5ff299
commit: 672364f56055976aae7e68b59cf578173a3dbddc [11/13] time: Introduce new GENERIC_TIME_VSYSCALL

All sparse warnings:

+ include/linux/timekeeper_internal.h:101:1: sparse: missing identifier in declaration
+ include/linux/timekeeper_internal.h:101:1: sparse: Expected ; at the end of type declaration
+ include/linux/timekeeper_internal.h:101:1: sparse: got {
  kernel/time.c:167:17: sparse: undefined identifier 'update_vsyscall_tz'
  In file included from kernel/time.c:33:0:
  include/linux/timekeeper_internal.h:101:1: error: expected identifier or '(' before '{' token
  In file included from kernel/time.c:33:0:
  include/linux/timekeeper_internal.h:100:20: warning: 'update_vsyscall' declared 'static' but never defined [-Wunused-function]
--
+ include/linux/timekeeper_internal.h:101:1: sparse: missing identifier in declaration
+ include/linux/timekeeper_internal.h:101:1: sparse: Expected ; at the end of type declaration
+ include/linux/timekeeper_internal.h:101:1: sparse: got {
  arch/x86/include/asm/stat.h:26:1: sparse: Expected ; at the end of type declaration
  arch/x86/include/asm/stat.h:26:1: sparse: got }
+ include/linux/timekeeper_internal.h:100:35: sparse: marked inline, but without a definition
  In file included from kernel/time/timekeeping.c:11:0:
  include/linux/timekeeper_internal.h:101:1: error: expected identifier or '(' before '{' token
  In file included from kernel/time/timekeeping.c:11:0:
  include/linux/timekeeper_internal.h:100:20: warning: 'update_vsyscall' used but never defined [enabled by default]
? kernel/time.c:167:17: sparse: undefined identifier 'update_vsyscall_tz'
? arch/x86/include/asm/stat.h:26:1: sparse: Expected ; at the end of type declaration
? arch/x86/include/asm/stat.h:26:1: sparse: got }

vim +101 include/linux/timekeeper_internal.h
    85	
    86	extern void update_vsyscall_old(struct timespec *ts, struct timespec *wtm,
    87					struct clocksource *c, u32 mult);
    88	extern void update_vsyscall_tz(void);
    89	
    90	static inline void update_vsyscall(struct timekeeper *tk)
    91	{
    92		struct timespec xt;
    93	
    94		xt = tk_xtime(tk);
    95		update_vsyscall_old(&xt, &tk->wall_to_monotonic, tk->clock, tk->mult);
    96	}
    97	
    98	#else
    99	
   100	static inline void update_vsyscall(struct timekeeper *tk);
 > 101	{
   102	}
   103	static inline void update_vsyscall_tz(void)
   104	{
   105	}
   106	#endif
   107	
   108	#endif /* _LINUX_TIMEKEEPER_INTERNAL_H */

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
