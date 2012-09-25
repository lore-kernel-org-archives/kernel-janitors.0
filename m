From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 25 Sep 2012 08:13:42 +0000
Subject: arch/x86/kernel/traps.c:276 do_general_protection() warn: add some parenthesis here?
Message-Id: <20120925081342.GA21642@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Frederic,

FYI, there are new smatch warnings show up in

37bee0638b95bc25ed67ec240eb56e25aef2f3ee  x86: Unspaghettize do_general_protection()

All smatch warnings:

+ arch/x86/kernel/traps.c:276 do_general_protection() warn: add some parenthesis here?
  arch/x86/kernel/traps.c:604 math_state_restore() info: ignoring unreachable code.

vim +276 arch/x86/kernel/traps.c

   272	
   273			tsk->thread.error_code = error_code;
   274			tsk->thread.trap_nr = X86_TRAP_GP;
   275			if (!notify_die(DIE_GPF, "general protection fault", regs, error_code,
 > 276				       X86_TRAP_GP, SIGSEGV) = NOTIFY_STOP)
   277				die("general protection fault", regs, error_code);
   278			return;
   279		}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
