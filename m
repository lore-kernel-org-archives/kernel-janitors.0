From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 02:06:34 +0000
Subject: [signal:master 102/105] kernel/signal.c:3117:1: sparse: symbol 'sys_sigaltstack' redeclared with dif
Message-Id: <20121002020634.GA6006@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git master
head:   3c33d2e266a793154e52533c7b20f5c090fa08ed
commit: 9bea9f53e6d85b91d9e525299b9ac9754e8770b5 [102/105] x86, um: sigaltstack conversion

? kernel/signal.c:3117:1: sparse: symbol 'sys_sigaltstack' redeclared with different type (originally declared at include/linux/syscalls.h:865) - incompatible argument 2 (different address spaces)

vim +3117 kernel/signal.c

^1da177e (Linus Torvalds 2005-04-16  3115) 
61143440 (Al Viro        2012-06-04  3116) #ifdef __ARCH_WANT_SYS_SIGALTSTACK
61143440 (Al Viro        2012-06-04 @3117) SYSCALL_DEFINE2(sigaltstack, const stack_t __user *, uss, stack_t *, uoss)
61143440 (Al Viro        2012-06-04  3118) {
61143440 (Al Viro        2012-06-04  3119) 	return do_sigaltstack(uss, uoss, current_user_stack_pointer());
61143440 (Al Viro        2012-06-04  3120) }
61143440 (Al Viro        2012-06-04  3121) #endif
61143440 (Al Viro        2012-06-04  3122) 
^1da177e (Linus Torvalds 2005-04-16  3123) #ifdef __ARCH_WANT_SYS_SIGPENDING
^1da177e (Linus Torvalds 2005-04-16  3124) 
41c57892 (Randy Dunlap   2011-04-04  3125) /**
41c57892 (Randy Dunlap   2011-04-04  3126)  *  sys_sigpending - examine pending signals
41c57892 (Randy Dunlap   2011-04-04  3127)  *  @set: where mask of pending signal is returned
41c57892 (Randy Dunlap   2011-04-04  3128)  */
b290ebe2 (Heiko Carstens 2009-01-14  3129) SYSCALL_DEFINE1(sigpending, old_sigset_t __user *, set)
^1da177e (Linus Torvalds 2005-04-16  3130) {
^1da177e (Linus Torvalds 2005-04-16  3131) 	return do_sigpending(set, sizeof(*set));
^1da177e (Linus Torvalds 2005-04-16  3132) }
^1da177e (Linus Torvalds 2005-04-16  3133) 

The code at line 3117 was first introduced by commit:
6114344 sigaltack cleanups series - beginning

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
