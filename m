From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 09 Oct 2012 23:37:33 +0000
Subject: [signal:proposed-merge 1/1] fs/exec.c:1712:1: error: expected identifier or '(' before '>>' token
Message-Id: <20121009233733.GE9331@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git proposed-merge
head:   e7f8028d6cf2f35e3c64f12211e359549b59081f
commit: e7f8028d6cf2f35e3c64f12211e359549b59081f [1/1] Merge branch 'for-linus' into proposed-merge
config: x86_64-allyesconfig

All error/warnings:

fs/exec.c:1712:1: error: expected identifier or '(' before '>>' token

vim +1712 fs/exec.c

282124d1 Al Viro 2012-09-30  1706  	 * We were successful.  We won't be returning to our caller, but
282124d1 Al Viro 2012-09-30  1707  	 * instead to user space by manipulating the kernel stack.
282124d1 Al Viro 2012-09-30  1708  	 */
282124d1 Al Viro 2012-09-30  1709  	ret_from_kernel_execve(p);
282124d1 Al Viro 2012-09-30  1710  }
282124d1 Al Viro 2012-09-30  1711  #endif
e7f8028d Al Viro 2012-10-09 @1712  >>>>>>> for-linus

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
