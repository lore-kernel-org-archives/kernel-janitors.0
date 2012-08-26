From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 26 Aug 2012 19:28:29 +0000
Subject: [vfs:master 32/32] fs/open.c:817:18: sparse: restricted fmode_t degrades to integer
Message-Id: <20120826192829.GA9431@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git master
head:   9283194882d18e3755c4ebc0b86db9f9a4f4c81a
commit: 9283194882d18e3755c4ebc0b86db9f9a4f4c81a [32/32] don't leak O_CLOEXEC into ->f_flags

All sparse warnings:

+ fs/open.c:817:18: sparse: restricted fmode_t degrades to integer

vim +817 fs/open.c
   814			op->mode = 0;
   815	
   816		/* Must never be set by userspace */
 > 817		flags &= ~FMODE_NONOTIFY & ~O_CLOEXEC;
   818	
   819		/*
   820		 * O_SYNC is implemented as __O_SYNC|O_DSYNC.  As many places only

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
