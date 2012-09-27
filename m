From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 06:20:20 +0000
Subject: [vfs:for-next 60/72] include/linux/file.h:53:9: error: implicit declaration of function 'fget_raw_li
Message-Id: <20120927062020.GA27992@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-next
head:   49de614c74fadc7c47132ac87c0f7b05ca4084b7
commit: a5b470ba06aa3f96999ede5feba178df6bdb134a [60/72] new helpers: fdget()/fdput()
config: x86_64-allmodconfig

All error/warnings:

In file included from net/ceph/pagevec.c:6:0:
include/linux/file.h: In function 'fdget_raw':
include/linux/file.h:53:9: error: implicit declaration of function 'fget_raw_light' [-Werror=implicit-function-declaration]
include/linux/file.h:53:19: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/file.h: At top level:
include/linux/file.h:58:21: error: conflicting types for 'fget_raw_light'
include/linux/file.h:53:19: note: previous implicit declaration of 'fget_raw_light' was here
cc1: some warnings being treated as errors

vim +53 include/linux/file.h

a5b470ba (Al Viro 2012-08-27  50) static inline struct fd fdget_raw(unsigned int fd)
a5b470ba (Al Viro 2012-08-27  51) {
a5b470ba (Al Viro 2012-08-27  52) 	int b;
a5b470ba (Al Viro 2012-08-27 @53) 	struct file *f = fget_raw_light(fd, &b);
a5b470ba (Al Viro 2012-08-27  54) 	return (struct fd){f,b};
a5b470ba (Al Viro 2012-08-27  55) }

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
