From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 10:41:27 +0000
Subject: [driver-core:driver-core-next 4/11] include/linux/device.h:925:12: error: 'dev_vprintk_emit' defined
Message-Id: <20121002104127.GA31577@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Joe,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-next
head:   e0f21e6d52cc245e7d4f7e02ca4b7b6571660ec2
commit: 05e4e5b87aab74f994acf9dd4bed4a8f1367cd09 [4/11] dev: Add dev_vprintk_emit and dev_printk_emit
config: sh-allnoconfig

All error/warnings:

include/linux/device.h:925:12: error: 'dev_vprintk_emit' defined but not used [-Werror=unused-function]
cc1: all warnings being treated as errors

vim +925 include/linux/device.h

b9075fa9 (Joe Perches 2011-10-31  919) int dev_notice(const struct device *dev, const char *fmt, ...);
b9075fa9 (Joe Perches 2011-10-31  920) extern __printf(2, 3)
b9075fa9 (Joe Perches 2011-10-31  921) int _dev_info(const struct device *dev, const char *fmt, ...);
99bcf217 (Joe Perches 2010-06-27  922) 
99bcf217 (Joe Perches 2010-06-27  923) #else
99bcf217 (Joe Perches 2010-06-27  924) 
05e4e5b8 (Joe Perches 2012-09-12 @925) static int dev_vprintk_emit(int level, const struct device *dev,
05e4e5b8 (Joe Perches 2012-09-12  926) 			    const char *fmt, va_list args)
05e4e5b8 (Joe Perches 2012-09-12  927) { return 0; }
05e4e5b8 (Joe Perches 2012-09-12  928) static inline __printf(3, 4)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
