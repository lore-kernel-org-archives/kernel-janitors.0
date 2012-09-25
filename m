From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 25 Sep 2012 08:15:02 +0000
Subject: arch/x86/kernel/traps.c:682 do_iret_error() warn: add some parenthesis here?
Message-Id: <20120925081502.GB21642@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Frederic,

FYI, there are new smatch warnings show up in

99fc5f65c655ea22ec1afecb7747663956b57f13  x86: Exception hooks for userspace RCU extended QS
2012-09-24 20:10:00 -0700

All smatch warnings:

  arch/x86/kernel/traps.c:289 do_general_protection() warn: add some parenthesis here?
  arch/x86/kernel/traps.c:627 math_state_restore() info: ignoring unreachable code.
+ arch/x86/kernel/traps.c:682 do_iret_error() warn: add some parenthesis here?

vim +682 arch/x86/kernel/traps.c

   681		if (!notify_die(DIE_TRAP, "iret exception", regs, error_code,
 > 682				X86_TRAP_IRET, SIGILL) = NOTIFY_STOP) {

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
