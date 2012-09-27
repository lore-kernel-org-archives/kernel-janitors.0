From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 01:12:11 +0000
Subject: [next:akpm 22/413] kernel/audit.c:668:2: error: implicit declaration of function 'audit_get_sessioni
Message-Id: <20120927011211.GD7205@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kees,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   dad0019944369f58c193c1991c39ffda7ff584d2
commit: e269b4131288512ebfe2adfe69042983cb2e69e5 [22/413] audit.h: replace defines with C stubs
config: s390-defconfig

All error/warnings:

kernel/audit.c: In function 'audit_receive_msg':
kernel/audit.c:668:2: error: implicit declaration of function 'audit_get_sessionid' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
drivers/tty/tty_audit.c: In function 'tty_audit_buf_push_current':
drivers/tty/tty_audit.c:119:2: error: implicit declaration of function 'audit_get_sessionid' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +668 kernel/audit.c
   662			err = PTR_ERR(kauditd_task);
   663			kauditd_task = NULL;
   664			return err;
   665		}
   666	
   667		loginuid = audit_get_loginuid(current);
 > 668		sessionid = audit_get_sessionid(current);
   669		security_task_getsecid(current, &sid);
   670		seq  = nlh->nlmsg_seq;
   671		data = nlmsg_data(nlh);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
