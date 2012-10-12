From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 12 Oct 2012 16:41:56 +0000
Subject: [next:akpm 86/86] drivers/block/drbd/drbd_int.h:50:10: sparse: preprocessor token __must_hold redefi
Message-Id: <20121012164156.GD19120@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Josh,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   04b956faad392f46c9a234962a9990196b8e48fc
commit: 04b956faad392f46c9a234962a9990196b8e48fc [86/86] linux/compiler.h: add __must_hold macro for functions called with a lock held

+ drivers/block/drbd/drbd_int.h:50:10: sparse: preprocessor token __must_hold redefined
  include/linux/compiler.h:13:10: this was the original definition
  drivers/block/drbd/drbd_int.h:977:39: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1283:69: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1284:70: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1285:59: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1286:60: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1287:63: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1288:65: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1289:66: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1469:74: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1470:50: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1471:51: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1472:54: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1473:62: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1558:92: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1631:61: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_bitmap.c:955:75: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_bitmap.c:1008:100: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_bitmap.c:1124:42: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_bitmap.c:1135:43: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_bitmap.c:1146:47: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_bitmap.c:1156:68: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_bitmap.c:1172:54: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_bitmap.c:1190:66: sparse: attribute 'require_context': unknown attribute
--
+ drivers/block/drbd/drbd_int.h:50:10: sparse: preprocessor token __must_hold redefined
  include/linux/compiler.h:13:10: this was the original definition
  drivers/block/drbd/drbd_int.h:977:39: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1283:69: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1284:70: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1285:59: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1286:60: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1287:63: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1288:65: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1289:66: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1469:74: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1470:50: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1471:51: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1472:54: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1473:62: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1558:92: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1631:61: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_nl.c:605:95: sparse: attribute 'require_context': unknown attribute
--
+ drivers/block/drbd/drbd_int.h:50:10: sparse: preprocessor token __must_hold redefined
  include/linux/compiler.h:13:10: this was the original definition
  drivers/block/drbd/drbd_int.h:977:39: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1283:69: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1284:70: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1285:59: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1286:60: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1287:63: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1288:65: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1289:66: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1469:74: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1470:50: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1471:51: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1472:54: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1473:62: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1558:92: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1631:61: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_main.c:4014:60: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_main.c:4022:63: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_main.c:4038:62: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_main.c:4054:52: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_main.c:4071:56: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_main.c:4270:57: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_main.c:4278:59: sparse: attribute 'require_context': unknown attribute
--
+ drivers/block/drbd/drbd_int.h:50:10: sparse: preprocessor token __must_hold redefined
  include/linux/compiler.h:13:10: this was the original definition
  drivers/block/drbd/drbd_int.h:977:39: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1283:69: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1284:70: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1285:59: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1286:60: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1287:63: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1288:65: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1289:66: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1469:74: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1470:50: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1471:51: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1472:54: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1473:62: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1558:92: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1631:61: sparse: attribute 'require_context': unknown attribute
--
+ drivers/block/drbd/drbd_int.h:50:10: sparse: preprocessor token __must_hold redefined
  include/linux/compiler.h:13:10: this was the original definition
  drivers/block/drbd/drbd_int.h:977:39: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1283:69: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1284:70: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1285:59: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1286:60: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1287:63: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1288:65: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1289:66: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1469:74: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1470:50: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1471:51: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1472:54: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1473:62: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1558:92: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_int.h:1631:61: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_receiver.c:319:54: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_receiver.c:1062:81: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_receiver.c:1252:79: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_receiver.c:2171:56: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_receiver.c:2243:56: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_receiver.c:2292:56: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_receiver.c:2362:68: sparse: attribute 'require_context': unknown attribute
  drivers/block/drbd/drbd_receiver.c:2546:76: sparse: attribute 'require_context': unknown attribute

vim +50 drivers/block/drbd/drbd_int.h

b411b363 Philipp Reisner 2009-09-25  34  #include <linux/slab.h>
b411b363 Philipp Reisner 2009-09-25  35  #include <linux/crypto.h>
132cc538 Randy Dunlap    2009-10-07  36  #include <linux/ratelimit.h>
b411b363 Philipp Reisner 2009-09-25  37  #include <linux/tcp.h>
b411b363 Philipp Reisner 2009-09-25  38  #include <linux/mutex.h>
b411b363 Philipp Reisner 2009-09-25  39  #include <linux/major.h>
b411b363 Philipp Reisner 2009-09-25  40  #include <linux/blkdev.h>
b411b363 Philipp Reisner 2009-09-25  41  #include <linux/genhd.h>
b411b363 Philipp Reisner 2009-09-25  42  #include <net/tcp.h>
b411b363 Philipp Reisner 2009-09-25  43  #include <linux/lru_cache.h>
70c71606 Paul Gortmaker  2011-05-22  44  #include <linux/prefetch.h>
b411b363 Philipp Reisner 2009-09-25  45  
b411b363 Philipp Reisner 2009-09-25  46  #ifdef __CHECKER__
b411b363 Philipp Reisner 2009-09-25  47  # define __protected_by(x)       __attribute__((require_context(x,1,999,"rdwr")))
b411b363 Philipp Reisner 2009-09-25  48  # define __protected_read_by(x)  __attribute__((require_context(x,1,999,"read")))
b411b363 Philipp Reisner 2009-09-25  49  # define __protected_write_by(x) __attribute__((require_context(x,1,999,"write")))
b411b363 Philipp Reisner 2009-09-25 @50  # define __must_hold(x)       __attribute__((context(x,1,1), require_context(x,1,999,"call")))
b411b363 Philipp Reisner 2009-09-25  51  #else
b411b363 Philipp Reisner 2009-09-25  52  # define __protected_by(x)
b411b363 Philipp Reisner 2009-09-25  53  # define __protected_read_by(x)
b411b363 Philipp Reisner 2009-09-25  54  # define __protected_write_by(x)
b411b363 Philipp Reisner 2009-09-25  55  # define __must_hold(x)
b411b363 Philipp Reisner 2009-09-25  56  #endif
b411b363 Philipp Reisner 2009-09-25  57  
b411b363 Philipp Reisner 2009-09-25  58  #define __no_warn(lock, stmt) do { __acquire(lock); stmt; __release(lock); } while (0)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
