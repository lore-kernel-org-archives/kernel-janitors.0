From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 28 Jul 2012 10:33:48 +0000
Subject: [vfs:for-next 54/99] kernel/signal.c:1974:6: error: wrong type argument to unary exclamation mark
Message-Id: <20120728103348.GC10759@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

This kernel build error stop at commit 158e1645e ("trim task_work: get rid of
hlist"), when ->task_works is changed to a pointer:

-       struct hlist_head task_works;
+       void *task_works;

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-next
head:   8cae6f7158ec1fa44c8a04a43db7d8020ec60437
commit: 7266702805f9d824f92ce5c4069eca65d0f21d28 [54/99] signal: make sure we don't get stopped with pending task_work

All related error/warning messages:

kernel/signal.c: In function 'ptrace_notify':
kernel/signal.c:1974:6: error: wrong type argument to unary exclamation mark
kernel/signal.c: In function 'get_signal_to_deliver':
kernel/signal.c:2201:6: error: wrong type argument to unary exclamation mark

vim +1974 kernel/signal.c
  1971	void ptrace_notify(int exit_code)
  1972	{
  1973		BUG_ON((exit_code & (0x7f | ~0xffff)) != SIGTRAP);
> 1974		if (unlikely(current->task_works)) {
  1975			if (test_and_clear_ti_thread_flag(current_thread_info(),
  1976							   TIF_NOTIFY_RESUME)) {
  1977				smp_mb__after_clear_bit();

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
