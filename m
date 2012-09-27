From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 09:18:40 +0000
Subject: [next:akpm 17/397] include/linux/audit.h:536:1: error: expected ';' before '}' token
Message-Id: <20120927091840.GA9923@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kees,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   5ca573b894e5efd072a90c1364dbf5774e867911
commit: 57fb5bbce51d7949861259b0348c23d63da94710 [17/397] audit.h: replace defines with C stubs
config: x86_64-allmodconfig

All error/warnings:

In file included from include/net/xfrm.h:14:0,
                 from net/dccp/minisocks.c:20:
include/linux/audit.h: In function 'audit_get_loginuid':
include/linux/audit.h:536:1: error: expected ';' before '}' token

vim +536 include/linux/audit.h

57fb5bbc (Kees Cook       2012-09-26  533) static inline kuid_t audit_get_loginuid(struct task_struct *tsk)
57fb5bbc (Kees Cook       2012-09-26  534) {
57fb5bbc (Kees Cook       2012-09-26  535) 	return tsk->loginuid
57fb5bbc (Kees Cook       2012-09-26 @536) }
57fb5bbc (Kees Cook       2012-09-26  537) 
57fb5bbc (Kees Cook       2012-09-26  538) static inline int audit_get_sessionid(struct task_struct *tsk)
57fb5bbc (Kees Cook       2012-09-26  539) {

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
