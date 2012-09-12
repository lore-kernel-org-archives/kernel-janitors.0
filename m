From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 03:21:25 +0000
Subject: ptmx_open() error: double unlock 'mutex:&devpts_mutex'
Message-Id: <20120912032125.GA22336@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Alan,

FYI, there are new smatch warnings show up in commit 89c8d91e31f267703e365593f6bfebb9f6d2ad01

drivers/tty/pty.c:670 ptmx_open() error: double unlock 'mutex:&devpts_mutex'

vim +670 drivers/tty/pty.c

   666	out:
   667		mutex_unlock(&tty_mutex);
   668		devpts_kill_index(inode, index);
   669	err_file:
 > 670	        mutex_unlock(&devpts_mutex);
   671		tty_free_file(filp);
   672		return retval;
   673	}
   674	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
